import { getUserDetails } from "../lib/discord";
import Error from "../config/errors";
import { Next, ParameterizedContext } from "koa";

const forceValidToken = async (
  ctx: ParameterizedContext<KoaState>,
  next: Next
): Promise<void> => {
  const { request, response, state } = ctx;

  const { authorization } = request.headers;
  if (!authorization) {
    response.status = 401;
    response.body = "Unauthorized";
    return;
  }

  try {
    const userDetails = await getUserDetails(authorization);
    state.user = userDetails;
  } catch (e) {
    if (e.code === Error.UNEXPECTED_RESPONSE_CODE) {
      ctx.throw(`Error thrown: ${e.message}`);
    }

    response.status = 401;
    response.body = "Unauthorized";
    return;
  }

  await next();
};

export default forceValidToken;
