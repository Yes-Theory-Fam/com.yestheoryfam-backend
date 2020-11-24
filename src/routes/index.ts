import Router from "@koa/router";
import botActions from "./botActions";
import blogs from "./blog";
import isMod from "./isMod";
import files from "./files";
import photowall from "./photowall";

const router = new Router();

router.use("/bot-actions", botActions.routes(), botActions.allowedMethods());
router.use("/blogs", blogs.routes(), blogs.allowedMethods());
router.use("/is-mod", isMod.routes(), isMod.allowedMethods());
router.use("/files", files.routes(), files.allowedMethods());
router.use("/photowall", photowall.routes(), photowall.allowedMethods());
router.get("/", (ctx) => (ctx.body = "OK"));

export default router;
