export interface QuizQuestionsProps { 
    Id: number;
    Title: string;
    question: string;
    type: string, 
    options: string, 
    onAnswer: (answer: string, questionId?: number) => void;
    answer: string, 
}

export interface QuizAnswerProps { 
    Id: number;
    Title: string;
    questionId: string;
    answer: string, 
    userId: string
}