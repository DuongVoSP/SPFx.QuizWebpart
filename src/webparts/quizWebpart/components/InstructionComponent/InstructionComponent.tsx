import { PrimaryButton, Stack } from "office-ui-fabric-react";
import * as React from "react";
import styles from "./InstructionComponent.module.scss";
import { IScreen } from "../../../../models";

const InstructionComponent = ({ onSubmit, onError }: IScreen) => {
  const handleSubmit = () => {
    onSubmit();
  };

  return (
    <Stack className={styles.FormContainer}>
      <h1>Welcome to the Cyber Security Quiz</h1>
      <p>Test your knowledge on Cyber Security and enhance your awareness about online security threats.</p>
      <p>Are you ready to get started?</p>
      <PrimaryButton
        onClick={(e) => {
          handleSubmit();
        }}
        text="Start Quiz"
        className={styles.StartButton}
      />
    </Stack>
  );
};

export default InstructionComponent;
