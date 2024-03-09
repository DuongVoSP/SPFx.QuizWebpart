import { QuizAnswerProps } from "../webparts/quizWebpart/components/QuizQuestions/QuizQuestionProps";
import { UserData } from "./UserData";

export interface IScreen {
    userData?: UserData;
    onSubmit: (data: UserData | QuizAnswerProps[] | string | undefined) => void;
    onError: (e) => void;
}