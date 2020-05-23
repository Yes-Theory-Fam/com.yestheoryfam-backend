import { forceMod } from "../middleware";
import { Context } from "koa";
import Router from "@koa/router";

const router = new Router();

router.get("/", forceMod, async (ctx: Context) => {
  ctx.status = 200;
});

export default router;
