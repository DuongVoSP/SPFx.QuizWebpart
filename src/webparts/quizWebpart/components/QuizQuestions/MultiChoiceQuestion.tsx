import { Stack, Checkbox } from "office-ui-fabric-react";
import * as React from "react";
import { QuizQuestionsProps } from "./QuizQuestionProps";

export const MultiChoiceQuestion :  React.FC<QuizQuestionsProps> = ({ Title, question, options, onAnswer, answer }: QuizQuestionsProps) => {
    const [selected, setSelected] = React.useState(answer ? answer.split(";#") : []);
  
    const onCheckboxChecked = (checked, option) => {
      let temp = [...selected];
      if (checked) {
        temp.push(option);
      } else {
        temp = temp.filter((s) => s !== option);
      }
      setSelected(temp);
      onAnswer(temp.join(";#"));
    };
  
    return (
      <div>
        <h1>{Title}</h1>
        <h2>
          <div dangerouslySetInnerHTML={{ __html: question }}></div>
        </h2>
        <Stack tokens={{ childrenGap: 10 }}>
          {options.split(";#")?.map((option, index) => (
            <Checkbox key={`${index}-${Title}`} checked={selected?.indexOf(option) > -1} onChange={(e, checked) => onCheckboxChecked(checked, option)} label={option} />
          ))}
        </Stack>
      </div>
    );
  };
  