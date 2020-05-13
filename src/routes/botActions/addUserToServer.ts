import Router from "@koa/router";
import { userToServer } from "../../lib/discord";

const router = new Router<KoaState>();

router.post("/", async (ctx) => {
  const { request, response, state } = ctx;

  const user: DiscordUser = state.user;
  const { authorization } = request.headers;
  const success = await userToServer(user.id, authorization);

  if (success) {
    response.status = 200;
    response.body = "OK";
  } else {
    response.status = 500;
    response.body = "Server Error";

    ctx.throw(
      "Adding a user to the server failed! Check logs above for reasoning"
    );
  }
});

export default router;
