import Router from "@koa/router";
import botActions from "./botActions";
import blogs from "./blog";
import isMod from "./isMod";

const router = new Router();

router.use("/bot-actions", botActions.routes(), botActions.allowedMethods());
router.use("/blogs", blogs.routes(), blogs.allowedMethods());
router.use("/is-mod", isMod.routes(), isMod.allowedMethods());
router.get("/", (ctx) => (ctx.body = "OK"));

export default router;
