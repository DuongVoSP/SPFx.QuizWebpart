import * as React from "react";
import { QuizAnswerProps, QuizQuestionsProps } from "./QuizQuestionProps";
import { AppContext, IScreen } from "../../../../models";
import { Stack, ProgressIndicator, PrimaryButton, DefaultButton, TextField, Checkbox, IChoiceGroupOption, ChoiceGroup } from "office-ui-fabric-react";
import styles from "./QuizQuestions.module.scss";
import { QuestionService } from "../../../../services/QuestionsService";
import { MultiChoiceQuestion } from "./MultiChoiceQuestion";
import { SingleChoiceQuestion } from "./SingleChoiceQuestion";
import { AnswersService } from "../../../../services/AnswersService";

const QuizQuestion : React.FC<QuizQuestionsProps> = ({ Id, Title, question, type, options, onAnswer, answer }: QuizQuestionsProps) => {
  const TypeMapComponents = {
    Choice: SingleChoiceQuestion,
    MultiChoice: MultiChoiceQuestion,
  };
  const submitAnswer = (answer) => {
    onAnswer(answer, Id);
  };
  const component = React.createElement(TypeMapComponents[type], { Title, question, type, options, onAnswer: submitAnswer, answer });
  return component;
};

const QuizQuestions: React.FunctionComponent<IScreen> = ({ userData, onSubmit, onError }: IScreen) => {
  const [questionIndex, setQuestionIndex] = React.useState(0);
  const [currentTime, setCurrentTime] = React.useState(null);
  const [QuestionsData, setQuestionsData] = React.useState([]);
  const { webpartContext } = React.useContext(AppContext);

  const handleQuizAnswer = (answer, questionId) => {
    // Validate answer using TimeIO API if needed
    // Set quizResults based on validation
    // let cloneResults = [...quizResults];
    // let existedAnswer = cloneResults.filter((res) => res.questionId == questionId)[0];
    // if (existedAnswer) {
    //   existedAnswer.answer = answer;
    //   quizResults = cloneResults;
    // } else {
    //   cloneResults.push({
    //     userId: userData.Id,
    //     questionId: questionId,
    //     answer: answer,
    //   } as QuizAnswerProps);
    //   // setQuizResults(cloneResults);
    //   quizResults = cloneResults;
    // }

    //Set temp answer
    QuestionsData.filter(q => q.Id == questionId)[0].answer = answer;
    setQuestionsData(QuestionsData);
  };

  const goNext = () => {
    setQuestionIndex(questionIndex + 1);
  };
  const goBack = () => {
    setQuestionIndex(questionIndex - 1);
  };
  const submitQuiz = () => {
    console.table(QuestionsData);
    const res = confirm("Do you want to submit the results ?");
    if (res) {
      const quizResults = QuestionsData.map(q => { return {
            Title : "Response " + q.Title,
            userId: userData.Id,
            questionId: q.Id,
            answer: q.answer,
          } as QuizAnswerProps
      });
      AnswersService.SubmitAnswers(quizResults).then(() => {
        onSubmit(quizResults);
      }).catch(onError)
    }
  };

  React.useEffect(() => {
    // const timeService = new TimeAPIService(webpartContext);
    // timeService.fetch().then(data => {
    //   debugger;
    //   console.table(data);
    //   return data;
    // }).catch(onError);

    QuestionService.GetQuestions()
      .then((questionData) => {
        setQuestionsData(questionData.reverse());
      })
      .catch(onError);
  }, []);

  const renderHeader = () => {
    return (
      <div className={styles.Header}>
        <h1 className={styles.Top}>
          Welcome #{userData.Id} {userData.Name},<span>{currentTime}</span>
        </h1>
        <ProgressIndicator styles={{ itemName: { fontWeight: 600 } }} label={`[${questionIndex + 1}/${QuestionsData.length}]`} percentComplete={(questionIndex + 1) / QuestionsData.length} className={styles.ProgressBar} barHeight={5} />
      </div>
    );
  };

  const renderButtons = () => {
    return (
      <Stack horizontal horizontalAlign="center" tokens={{ childrenGap: 10 }} style={{ margin: 10 }}>
        {questionIndex !== 0 && (
          <DefaultButton
            onClick={(e) => {
              goBack();
            }}
            text="Back"
            className={styles.BackButton}
          />
        )}

        {questionIndex !== QuestionsData.length - 1 && (
          <DefaultButton
            onClick={(e) => {
              goNext();
            }}
            text="Next"
            className={styles.NextButton}
          />
        )}

        {questionIndex === QuestionsData.length - 1 && (
          <PrimaryButton
            onClick={(e) => {
              submitQuiz();
            }}
            text="Submit"
            className={styles.SubmitButton}
          />
        )}
      </Stack>
    );
  };

  return (
    <Stack>
      {renderHeader()}
      {QuestionsData.length > 0 && <QuizQuestion
        key={QuestionsData[questionIndex].Id}
        {...QuestionsData[questionIndex]}
        onAnswer={handleQuizAnswer}
      />}
      {renderButtons()}
    </Stack>
  );
};

export default QuizQuestions;

