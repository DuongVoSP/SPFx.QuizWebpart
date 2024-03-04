import { WebPartContext } from "@microsoft/sp-webpart-base";
import { ISiteUserInfo } from "@pnp/sp/site-users/types";
import * as React from "react";

export interface IAppContext {
    webpartContext: WebPartContext;
    currentUser: ISiteUserInfo;
  }

export const AppContext = React.createContext<IAppContext>(null);
