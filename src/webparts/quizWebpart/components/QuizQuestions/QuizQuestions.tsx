import * as React from "react";
import { QuizQuestionsProps } from "./QuizQuestionProps";
import { AppContext, IAppContext, IScreen } from "../../../../models";
import { Stack, ProgressIndicator, PrimaryButton, DefaultButton, TextField, Checkbox, IChoiceGroupOption, ChoiceGroup } from "office-ui-fabric-react";
import styles from "./QuizQuestions.module.scss";
import TimeAPIService from "../../../../services/TimeApiService";
import { GetTimeByZoneResponse } from "../../../../models/TimeApiModels";

const QuizQuestion = ({name, question, type, options, onAnswer }: QuizQuestionsProps) => {
  if (type === "MultiChoice") {
    return (
      <div>
        <p>{question}</p>
        {options.split(";#")?.map((option, index) => (
          <Checkbox key={index} onClick={() => onAnswer(option)}>
            {option}
          </Checkbox>
        ))}
      </div>
    );
  }

  if (type === "Choice") {
    const statusOptions: IChoiceGroupOption[] = options.split(";#")?.map(str => { return { key: str, text: str }});  
    const onChange = (ev: React.FormEvent<HTMLInputElement>, option: any): void => {  
      onAnswer(option.key)  
    };  
  
    return (
      <div>
        <p>{question}</p>
        <ChoiceGroup  
          id={name}  
          name={name}          
          options={statusOptions}  
          onChange={onChange}  
        />  
      </div>
    );
  }
};

const QuizQuestions = ({ userData, onSubmit, onError }: IScreen) => {
  const [quizResults, setQuizResults] = React.useState(null);
  const [questionIndex, setQuestionIndex] = React.useState(0);
  const [currentTime, setCurrentTime] = React.useState(null);
  const [Questions, setQuestions] = React.useState([]);
  const { webpartContext } = React.useContext(AppContext);
  const handleQuizAnswer = (answer) => {
    // Validate answer using TimeIO API if needed
    // Set quizResults based on validation
    setQuizResults({ answer });
  };

  const goNext = () => {
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
    const timeService = new TimeAPIService(webpartContext);
    timeService.get2().then(() =>{ console.log("sone") }).catch(onError);
  }, [])

  const renderHeader = () => {
    return (
      <div className={styles.Header}>
        <h1 className={styles.Top}>Welcome {userData.Name},<span>{currentTime}</span></h1>
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
