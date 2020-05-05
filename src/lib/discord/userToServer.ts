import Api from "./api";
import { ADD_MEMBER } from "./urls";
import { createUnexpectedResponseError } from "../../common/utils";

const BUDDY_PROJECT_ROLE = process.env["BUDDY_PROJECT_ROLE"];

const userToServer = async (
  userId: string,
  accessToken: string
): Promise<boolean> => {
  const api = Api({ type: "bot" });
  const roles = [BUDDY_PROJECT_ROLE];

  // eslint-disable-next-line @typescript-eslint/camelcase
  const payload = { access_token: accessToken, roles };

  const response = await api.put(ADD_MEMBER + userId, payload);
  if (response.status === 201) {
    return true;
  }

  // User already on the server -> doesn't receive the role automatically -> need to patch manually
  if (response.status === 204) {
    const patchResponse = await api.patch(ADD_MEMBER + userId, payload);
    if (patchResponse.status === 204) {
      return true;
    }

    throw createUnexpectedResponseError(response, "patching guild member");
  }

  throw createUnexpectedResponseError(response, "adding guild member");
};

export { userToServer };
