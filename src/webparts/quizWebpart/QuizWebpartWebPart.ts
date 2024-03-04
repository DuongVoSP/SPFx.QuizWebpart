import * as React from "react";
import * as ReactDom from "react-dom";
import { Version } from "@microsoft/sp-core-library";
import { IPropertyPaneConfiguration } from "@microsoft/sp-property-pane";
import { BaseClientSideWebPart, WebPartContext } from "@microsoft/sp-webpart-base";

import * as strings from "QuizWebpartWebPartStrings";
import { QuizWebpart } from "./components/QuizWebpart";
import { IAppContext } from "../../models";

import { setup as pnpSetup } from "@pnp/common";
import { ISiteUserInfo } from "@pnp/sp/site-users/types";
import { sp } from "@pnp/sp/presets/all";
import { Label } from "office-ui-fabric-react";

export interface IQuizWebpartWebPartProps {}

export const AppContext = React.createContext<IAppContext>(null);

export default class QuizWebpartWebPart extends BaseClientSideWebPart<IQuizWebpartWebPartProps> {
  private _currentUser: ISiteUserInfo;
  public render(): void {
    const element = React.createElement(
      AppContext.Provider,
      {
        value: {
          webpartContext: this.context,
          currentUser: this._currentUser,
        },
      },
      React.createElement(QuizWebpart)
    );

    ReactDom.render(element, this.domElement);
  }

  protected async onInit(): Promise<void> {
    await super.onInit();
    // other init code may be present
    pnpSetup({ spfxContext: this.context });

    this._currentUser = await sp.web.currentUser.get();
  }

  protected onDispose(): void {
    ReactDom.unmountComponentAtNode(this.domElement);
  }

  protected get dataVersion(): Version {
    return Version.parse("1.0");
  }

  protected getPropertyPaneConfiguration(): IPropertyPaneConfiguration {
    return {
      pages: [],
    };
  }
}
