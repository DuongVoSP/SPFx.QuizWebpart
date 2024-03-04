import * as React from 'react';
import { QuizQuestionsProps } from './QuizQuestionProps';

const QuizQuestion = ({ question, type, options, onAnswer, onSubmit, onError }: QuizQuestionsProps) => {
  const renderQuestion = () => {
    // Implement rendering logic based on question type
    // For example, render a multiple-choice question
    if (type === 'multipleChoice') {
      return (
        <div>
          <p>{question}</p>
          {options.map((option, index) => (
            <button key={index} onClick={() => onAnswer(option)}>
              {option}
            </button>
          ))}
        </div>
      );
    }
    // Add support for other question types as needed
  };

  return <div>{renderQuestion()}</div>;
};

export default QuizQuestion;
