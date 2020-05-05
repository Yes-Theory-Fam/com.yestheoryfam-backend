import Error from "../config/errors";

import { AxiosResponse } from "axios";

const createUnexpectedResponseError = (
  response: AxiosResponse,
  action: string
): BackendError => {
  return {
    code: Error.UNEXPECTED_RESPONSE_CODE,
    message: `Unexpected response code while ${action}: ${response.status} - Body was: ${response.data}`,
  };
};

export { createUnexpectedResponseError };
