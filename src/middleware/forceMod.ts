import { ParameterizedContext, Next } from "koa";
import { isMod } from "../lib/discord";
import { Boom } from "@hapi/boom";

const forceMod = async (
  ctx: ParameterizedContext<KoaState>,
  next: Next
): Promise<void> => {
  const userId = ctx.state.user.id;
  if (!isMod(userId))
    ctx.throw(
      new Boom(
        "You need to be a moderator to do this, contact a developer to get the role ID!",
        { statusCode: 403 }
      )
    );

  await next();
};

export default forceMod;
