import Router from "@koa/router";
import images from "./images";

const router = new Router();

router.use("/images", images.routes(), images.allowedMethods());

export default router;
