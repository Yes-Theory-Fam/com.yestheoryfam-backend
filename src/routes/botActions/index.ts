import Router from "@koa/router";
import addUser from "./addUserToServer";

const router = new Router();

router.use("/add-user", addUser.routes(), addUser.allowedMethods());

export default router;
