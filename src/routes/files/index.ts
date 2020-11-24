import Router from "@koa/router";
import upload from "./upload";
import download from "./download";

const router = new Router();

router.use("/upload", upload.routes(), upload.allowedMethods());
router.use("/download", download.routes(), download.allowedMethods());

export default router;
