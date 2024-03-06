import * as React from "react";
import { FeedbackComponentProps } from "./FeedbackComponentProps";
import { PrimaryButton, Stack, TextField } from "office-ui-fabric-react";
import styles from "./FeedbackComponent.module.scss";
import { sp } from "@pnp/sp";
import { IEmailProperties } from "@pnp/sp/sputilities";
import { AppContext } from "../../../../models";

const FeedbackComponent = ({ results, onSubmit, onError }: FeedbackComponentProps) => {
  const [mailBody, setMailBody] = React.useState("");
  const { currentUser } = React.useContext(AppContext);
  
  const sendFeedback = () => {
    const emailProps: IEmailProperties = {
      To: [currentUser.Email],
      Subject: "Give feedback from the Quiz Game",
      Body: mailBody,
      AdditionalHeaders: {
        "content-type": "text/html",
      },
    };

    sp.utility.sendEmail(emailProps).then(() => {
      onSubmit(currentUser.Email);
    }).catch(onError);    
  };

  console.table(results);
  return (
    <Stack className={styles.FormContainer} tokens={{childrenGap: 10}}>
      <h2>Quiz Results</h2>
      <div>
        {results.map((r) => (<p>{r.Title}: {r.answer?.split(";#").join(", ")}</p>))}
      </div>
      <TextField multiline height={100} value={mailBody} onChange={(e, val) => setMailBody(val)}></TextField>
      <PrimaryButton
        onClick={(e) => {
          sendFeedback();
        }}
        text="Give Feedback"
        className={styles.FeedbackButton}
      />
    </Stack>
  );
};

export default FeedbackComponent;
