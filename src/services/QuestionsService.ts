import { sp } from "@pnp/sp"
import { ListTitles } from "../models/Constants"

export class QuestionService {
    static GetQuestions = async () => {
        const questionData = await sp.web.lists.getByTitle(ListTitles.Questions).items.filter('disabled eq false').select("Title, type, question, options, Id").getAll();
        return questionData;
    }
}