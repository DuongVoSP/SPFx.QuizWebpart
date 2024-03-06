import { WebPartContext } from "@microsoft/sp-webpart-base";
import { GetTimeByZoneResponse } from "../models/TimeApiModels";
import { HttpClient, IHttpClientOptions, HttpClientResponse } from "@microsoft/sp-http";

// Define the API base URL
const API_BASE_URL = "https://timeapi.io/api";

class TimeAPIService {
  private timeZone: string;
  private context: WebPartContext;
  constructor(context) {
    this.context = context;
    const user: any = context.pageContext.user;
    this.timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
  }

  getCurrentTime = () => {
    const httpClientOptions: IHttpClientOptions = {
      headers: new Headers() ,
      method: "GET",
      mode: "cors",
    };

    httpClientOptions.headers["Access-Control-Allow-Origin"] = "*";

    const apiUrl = `${API_BASE_URL}/Time/current/zone?timeZone=${this.timeZone}`;
    return this.context.httpClient.get(apiUrl, HttpClient.configurations.v1, httpClientOptions);
  };

  fetch = () => {
    const apiUrl = `${API_BASE_URL}/Time/current/zone?timeZone=${this.timeZone}`;

    return fetch(apiUrl, 
      { 
        method: 'GET'
      });
  }
}

export default TimeAPIService;
