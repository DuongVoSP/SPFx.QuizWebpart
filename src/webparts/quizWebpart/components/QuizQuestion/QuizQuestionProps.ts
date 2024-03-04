import { IScreen } from "../../../../models";

export interface QuizQuestionsProps extends IScreen { 
    question: any;
    type: any, 
    options: any, 
    onAnswer: any
}