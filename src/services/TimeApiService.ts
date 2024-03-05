import { WebPartContext } from "@microsoft/sp-webpart-base";
import axios, { AxiosResponse } from "axios";
import { GetTimeByZoneResponse } from "../models/TimeApiModels";
import { HttpClient, IHttpClientOptions, HttpClientResponse } from '@microsoft/sp-http';

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
  // Example: Fetch current time
  async getCurrentTime(): Promise<GetTimeByZoneResponse> {
    try {
      const response = await axios.get(`${API_BASE_URL}/Time/current/zone?timeZone=${this.timeZone}`);
      return response.data;
    } catch (error) {
      // Handle errors
      throw error;
    }
  }

  get2 = () => {
    const apiUrl = `${API_BASE_URL}/Time/current/zone?timeZone=${this.timeZone}`;
    return this.context.httpClient.get(apiUrl, HttpClient.configurations.v1);
  };
}

export default TimeAPIService;
