import { sp } from "@pnp/sp"
import { ListTitles } from "../models/Constants"
import { UserData } from "../models";

export class UserDataService {
    static Add = async (userData: UserData) => {
        const responseData = await sp.web.lists.getByTitle(ListTitles.UserData).items.add({
            Title: userData.Name,
            email: userData.Email,
            country: userData.Country,
        });
        return responseData;
    }
}