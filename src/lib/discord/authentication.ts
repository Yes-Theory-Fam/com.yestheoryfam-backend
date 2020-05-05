import Api from "./api";
import { PROFILE } from "./urls";
import Error from "../../config/errors";

import { createUnexpectedResponseError } from "../../common/utils";

const getUserDetails = async (token: string): Promise<DiscordUser> => {
  const response = await Api({ type: "user", token }).get(PROFILE);
  if (response.status === 401) throw { code: Error.UNAUTHORIZED };
  if (response.status !== 200)
    throw createUnexpectedResponseError(response, "getting user details");
  return response.data;
};

export { getUserDetails };
