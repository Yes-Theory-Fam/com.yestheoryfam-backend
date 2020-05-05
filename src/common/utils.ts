import Error from "../config/errors";

// Not ideal; gotta check how to shut ESLint up when importing types
// eslint-disable-next-line no-unused-vars
import { AxiosResponse } from "axios";

const createUnexpectedResponseError = (
  response: AxiosResponse,
  action: string
) => {
  return {
    code: Error.UNEXPECTED_RESPONSE_CODE,
    message: `Unexpected response code while ${action}: ${response.status} - Body was: ${response.data}`,
  };
};

export { createUnexpectedResponseError };
