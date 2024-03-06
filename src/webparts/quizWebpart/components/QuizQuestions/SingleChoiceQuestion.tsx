import * as React from "react";
import { IChoiceGroupOption, ChoiceGroup } from "office-ui-fabric-react";
import { QuizQuestionsProps } from "./QuizQuestionProps";

export const SingleChoiceQuestion :  React.FC<QuizQuestionsProps> = ({ Title, question, options, onAnswer, answer }: QuizQuestionsProps) => {
    const statusOptions: IChoiceGroupOption[] = options.split(";#")?.map((str) => {
      return { key: str, text: str };
    });
    const onChange = (ev: React.FormEvent<HTMLInputElement>, option: any): void => {
      onAnswer(option.key);
    };
  
    return (
      <div>
        <h1>{Title}</h1>
        <h2>
          <div dangerouslySetInnerHTML={{ __html: question }}></div>
        </h2>
  
        <ChoiceGroup id={Title} name={Title} options={statusOptions} onChange={onChange} selectedKey={answer} />
      </div>
    );
  };