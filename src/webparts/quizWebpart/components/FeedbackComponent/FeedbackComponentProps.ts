import { IScreen } from "../../../../models";
import { QuizAnswerProps } from "../QuizQuestions/QuizQuestionProps";

export interface FeedbackComponentProps extends IScreen {
    results: QuizAnswerProps[];
}