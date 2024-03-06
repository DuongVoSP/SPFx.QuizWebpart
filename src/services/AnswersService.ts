import { sp } from "@pnp/sp";
import { ListTitles } from "../models/Constants";
import { QuizAnswerProps } from "../webparts/quizWebpart/components/QuizQuestions/QuizQuestionProps";

export class AnswersService {
  static SubmitAnswers = async (answers: QuizAnswerProps[]) : Promise<void> => {
      const batch = sp.web.createBatch();
      answers.forEach((aws) => {
        sp.web.lists.getByTitle(ListTitles.Answer).items.inBatch(batch).add({
          Title: aws.Title,
          answer: aws.answer,
          questionId: aws.questionId,
          userResponseId: aws.userId,
        }).then((d) => console.log(d)).catch((e) => { throw(e)});
      });
      await batch.execute();
  };
}
 