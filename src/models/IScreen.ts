import { UserData } from "./UserData";

export interface IScreen {
    userData?: UserData;
    onSubmit: (data: any) => void;
    onError: (e) => void;
}