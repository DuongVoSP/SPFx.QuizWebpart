export interface QuizQuestionsProps { 
    Id: any;
    Title: any;
    question: any;
    type: any, 
    options: any, 
    onAnswer: any
}

export interface QuizAnswerProps { 
    Id: any;
    Title: any;
    questionId: any;
    answer: any, 
    userId: any
}