import * as React from "react";
import styles from "./UserInputForm.module.scss";
import { PrimaryButton, Stack, TextField } from "office-ui-fabric-react";
import { IScreen, UserData } from "../../../../models";
import { isNullOrEmpty, isValidEmail } from "../../../../misc/StringsExtension";

const UserInputForm = ({ onSubmit, onError }: IScreen) => {
  const [userData, setUserData] = React.useState<UserData>(new UserData());

  const handleInputChange = (e) => {
    setUserData({ ...userData, [e.target.name]: e.target.value });
  };

  const FormIsValid = (): boolean => {
    return !isNullOrEmpty(userData.Name) && !isNullOrEmpty(userData.Email) && !isNullOrEmpty(userData.Country) && isValidEmail(userData.Email);
  };

  const handleSubmit = () => {
    if (FormIsValid()) {
      onSubmit(userData);
    } else {
      onError({ Message: "Missing User Information, please fill in and continue" });
    }
  };

  return (
    <Stack tokens={{ childrenGap: 20 }} className={styles.FormContainer}>
      <h1>Please input your information and submit to continue</h1>

      <TextField required label="Name" value={userData.Name} onChange={handleInputChange} inputClassName={styles.SubjectInput} name="Name" />
      <TextField required label="Email" value={userData.Email} onChange={handleInputChange} inputClassName={styles.SubjectInput} name="Email" />
      <TextField required label="Country" value={userData.Country} onChange={handleInputChange} inputClassName={styles.SubjectInput} name="Country" />
      <PrimaryButton
        onClick={(e) => {
          handleSubmit();
        }}
        text="Submit"
        className={styles.SendButton}
      />
    </Stack>
  );
};

export default UserInputForm;
