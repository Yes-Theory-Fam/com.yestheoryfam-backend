import { Router } from "express";
import addUser from "./addUserToServer";

const router = Router();

router.use("/add-user", addUser);

export default router;
