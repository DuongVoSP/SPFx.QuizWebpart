import { Label, PrimaryButton, Stack } from "office-ui-fabric-react";
import * as React from "react";
import styles from "./InstructionComponent.module.scss";
import { IScreen } from "../../../../models";
import Countdown from "../CountdownComponent/Countdown";

const InstructionComponent = ({ onSubmit, onError }: IScreen) => {
  const handleSubmit = () => {
    onSubmit(null);
  };

  return (
    <Stack className={styles.FormContainer}>
      <h1>Welcome to the Cyber Security Quiz</h1>
      <p>These days, the tax return comes out to most people. This is one of the many holidays scammers take advantage of.</p>

      <p>Protect yourself from IT and security-related fraud in SMS and email👩🏼 💻</p>

      <p>
        In today's digital world, it is becoming increasingly difficult to distinguish between genuine communication and fraud in SMS and email messages. Scammers are becoming increasingly sophisticated in their attacks, and it can be challenging to
        detect their deception.{" "}
      </p>

      <p>What should you look out for and be aware of to protect yourself from IT and security-related SMS and email fraud?</p>
      <p>Test your knowledge on Cyber Security and enhance your awareness about online security threats.</p>
      <p>
        You will have <strong>30 minutes</strong> to complete <strong>10 questions</strong>
      </p>
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
