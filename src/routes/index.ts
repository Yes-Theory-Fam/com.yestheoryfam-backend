import { Router } from "express";

import botActions from "./botActions";

const router = Router();

router.use("/bot-actions", botActions);
router.get("/", (_, res) => res.send("OK"));

export default router;
