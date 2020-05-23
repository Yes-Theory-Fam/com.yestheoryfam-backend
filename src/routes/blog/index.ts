import Router from "@koa/router";

import blogs from "./root";
import preview from "./preview";

const router = new Router();

router.use("/preview", preview.routes(), preview.allowedMethods());
router.use("", blogs.routes(), blogs.allowedMethods());

export default router;
