import * as React from "react";
import styles from "./QuizWebpart.module.scss";
import { useState, useEffect } from "react";
import { PrimaryButton, Stack, TextField } from "office-ui-fabric-react";
import QuizQuestion from "./QuizQuestions/QuizQuestions";
import UserInputForm from "./UserInputForm/UserInputForm";
import FeedbackComponent from "./FeedbackComponent/FeedbackComponent";
import InstructionComponent from "./InstructionComponent/InstructionComponent";
import { UserDataService } from "../../../services/UserDataService";

export interface IQuizWebpartProps {}

export const QuizWebpart: React.FunctionComponent<IQuizWebpartProps> = (props: React.PropsWithChildren<IQuizWebpartProps>) => {
  const [userData, setUserData] = useState(null);
  const [quizResults, setQuizResults] = useState(null);
  const [currentStep, setCurrentStep] = React.useState(1);
  const [alertKey, setAlertKey] = React.useState(null);
  const [alertMessage, setAlertMessage] = React.useState(null);

  const handleError = (e): void => {
    setAlertMessage(e?.Message ?? e);
    setAlertKey(Math.random());
  };

  const moveNextStep = (): void => {
    setCurrentStep(currentStep + 1);
  };

  const handleUserSubmit = (data) => {
    UserDataService.Add(data)
      .then((responseData) => {
        setUserData({ ...data, Id: responseData.data.Id });
        moveNextStep();
      })
      .catch(handleError);
  };

  const handleQuizSubmit = (data) => {
    setQuizResults(data);
    moveNextStep();
  };

  const handleSendFeedback = (email: string) => {
    setAlertMessage("Feedback mail sent to "+ email);
    setAlertKey(Math.random());
    setCurrentStep(1)
  }

  const SCREENS = [
  <InstructionComponent onSubmit={moveNextStep} onError={handleError} />, 
  <UserInputForm onSubmit={handleUserSubmit} onError={handleError} />, 
  <QuizQuestion userData={userData} onError={handleError} onSubmit={handleQuizSubmit} />, 
  <FeedbackComponent userData={userData} results={quizResults} onError={handleError} onSubmit={handleSendFeedback} />];
  return (
    <div className={styles.QuizWebpart}>
      {SCREENS[currentStep - 1]}
      {alertKey && (
        <div key={alertKey} className={styles.BottomDiv}>
          {alertMessage}
        </div>
      )}
    </div>
  );
};
