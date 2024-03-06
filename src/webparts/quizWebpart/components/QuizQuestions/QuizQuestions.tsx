import * as React from "react";
import { QuizAnswerProps, QuizQuestionsProps } from "./QuizQuestionProps";
import { AppContext, IAppContext, IScreen } from "../../../../models";
import { Stack, ProgressIndicator, PrimaryButton, DefaultButton, TextField, Checkbox, IChoiceGroupOption, ChoiceGroup } from "office-ui-fabric-react";
import styles from "./QuizQuestions.module.scss";
import TimeAPIService from "../../../../services/TimeApiService";
import { GetTimeByZoneResponse } from "../../../../models/TimeApiModels";
import { QuestionService } from "../../../../services/QuestionsService";
import { object } from "prop-types";

const SingleChoiceQuestion = ({Id, Title, question, options, onAnswer }: QuizQuestionsProps) => {
  const statusOptions: IChoiceGroupOption[] = options.split(";#")?.map(str => { return { key: str, text: str }});  
  const onChange = (ev: React.FormEvent<HTMLInputElement>, option: any): void => {  
    onAnswer(option.key)  
  };  

  return (
    <div>
      <h1>{Title}</h1>
      <h2><div dangerouslySetInnerHTML={{__html : question}}></div></h2>

      <ChoiceGroup  
        id={Title}  
        name={Title}          
        options={statusOptions}  
        onChange={onChange}  
      />  
    </div>
  );
}
const MultiChoiceQuestion = ({Title, question, options, onAnswer }: QuizQuestionsProps) => {
  const [selected, setSelected] = React.useState([]);

  const onCheckboxChecked = (checked, option) => {
    let temp = [...selected];
    if(checked)
    {
      temp.push(option);
    } else
    {
      temp = temp.filter(s => s !== option);
    }
    setSelected(temp)
    onAnswer(temp.join(";#"));
  }

  return <div>
  <h1>{Title}</h1>
  <h2><div dangerouslySetInnerHTML={{__html : question}}></div></h2>
  <Stack tokens={{childrenGap: 10}}>
    {options.split(";#")?.map((option, index) => (
      <Checkbox key={`${index}-${Title}`} checked={selected?.indexOf(option) > -1} onChange={(checked) => onCheckboxChecked(checked, option)} label={option} />
    ))}
  </Stack>
</div>;
}

const QuizQuestion = ({Id, Title, question, type, options, onAnswer }: QuizQuestionsProps) => {
  const TypeMapComponents = {
    "Choice" : SingleChoiceQuestion,
    "MultiChoice" : MultiChoiceQuestion,
  }
  const submitAnswer = (answer) =>{
    debugger;
    onAnswer(answer, Id);
  }
  const component = React.createElement(TypeMapComponents[type], {Id, Title, question, type, options, onAnswer: submitAnswer });
  return component;
};

const QuizQuestions = ({ userData, onSubmit, onError }: IScreen) => {
  // const [quizResults, setQuizResults] = React.useState([]);
  const [questionIndex, setQuestionIndex] = React.useState(0);
  const [currentTime, setCurrentTime] = React.useState(null);
  const [Questions, setQuestions] = React.useState([]);
  const { webpartContext } = React.useContext(AppContext);

  let quizResults = [];
  const handleQuizAnswer = (answer,  questionId) => {
    // Validate answer using TimeIO API if needed
    // Set quizResults based on validation
    debugger;
    let cloneResults =  [...quizResults];
    let existedAnswer = cloneResults.filter(res => res.questionId == questionId)[0];
    if(existedAnswer)
    {
      existedAnswer.answer = answer;
      quizResults = cloneResults;
      
    } else{
      cloneResults.push({ 
        userId: userData.Id,
        questionId: questionId,
        answer: answer
      } as QuizAnswerProps)
      // setQuizResults(cloneResults);
      quizResults = cloneResults;

    }
  };

  const goNext = () => {
    console.log(quizResults); 

    setQuestionIndex(questionIndex + 1);
  };
  const goBack = () => {
    setQuestionIndex(questionIndex - 1);
  };
  const submitQuiz = () => {
    const res = confirm("Do you want to submit the results ?")
    if(res) onSubmit(quizResults);
  }

  React.useEffect(() => {
    // const timeService = new TimeAPIService(webpartContext);
    // timeService.fetch().then(data => {
    //   debugger;
    //   console.table(data);
    //   return data;
    // }).catch(onError);

    QuestionService.GetQuestions().then(questionData => {
      setQuestions(questionData.map(data => <QuizQuestion {...data} onAnswer={(a, id) => {
        console.log(quizResults); 
        handleQuizAnswer(a, id)}} />))
    }).catch(onError);
  }, [])

  const renderHeader = () => {
    return (
      <div className={styles.Header}>
        <h1 className={styles.Top}>Welcome #{userData.Id} {userData.Name},<span>{currentTime}</span></h1>
        <ProgressIndicator styles={{ itemName: { fontWeight: 600 } }} label={`[${questionIndex + 1}/${Questions.length}]`} percentComplete={ (questionIndex + 1) / Questions.length} className={styles.ProgressBar} barHeight={5} />
      </div>
    );
  };

  const renderButtons = () => {
    return (
      <Stack horizontal horizontalAlign="center"  tokens={{ childrenGap: 10 }} style={{margin: 10}}>
        {questionIndex !== 0 && (
          <DefaultButton
            onClick={(e) => {
              goBack();
            }}
            text="Back"
            className={styles.BackButton}
          />
        )}

        {questionIndex !== Questions.length - 1 && (
          <DefaultButton
            onClick={(e) => {
              goNext();
            }}
            text="Next"
            className={styles.NextButton}
          />
        )}

        {questionIndex === Questions.length - 1 && (
          <PrimaryButton
            onClick={(e) => {
              submitQuiz()
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
      {Questions[questionIndex]}
      {renderButtons()}
    </Stack>
  );
};

export default QuizQuestions;
