import * as React from "react";
import { FeedbackComponentProps } from "./FeedbackComponentProps";
import { PrimaryButton, TextField } from "office-ui-fabric-react";
import styles from "./FeedbackComponent.module.scss";
import { sp } from "@pnp/sp";
import { IEmailProperties } from "@pnp/sp/sputilities";
import { AppContext } from "../../../../models";

const FeedbackComponent = ({ results, onSubmit, onError }: FeedbackComponentProps) => {
  const [mailBody, setMailBody] = React.useState("");
  const { currentUser } = React.useContext(AppContext);
  const sendFeedback = async () => {
    const emailProps: IEmailProperties = {
      To: [currentUser.Email],
      Subject: "Give feedback from the Quiz Game",
      Body: mailBody,
      AdditionalHeaders: {
        "content-type": "text/html",
      },
    };

    await sp.utility.sendEmail(emailProps);
    onSubmit(currentUser.Email);
  };

  return (
    <div>
      <h2>Quiz Results</h2>
      {results.map((r) => {
        <p>
          {r.Title}: {r.answer.split(";#").join(", ")}
        </p>;
      })}
      <TextField multiline height={100} value={mailBody} onChange={(e, val) => setMailBody(val)}></TextField>
      <PrimaryButton
        onClick={(e) => {
          sendFeedback();
        }}
        text="Give Feedback"
        className={styles.FeedbackButton}
      />
    </div>
  );
};

export default FeedbackComponent;
