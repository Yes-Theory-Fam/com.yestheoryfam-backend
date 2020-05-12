import Router from "@koa/router";
import botActions from "./botActions";

const router = new Router();

router.use("/bot-actions", botActions.routes(), botActions.allowedMethods());
router.get("/", (ctx) => (ctx.body = "OK"));

export default router;
