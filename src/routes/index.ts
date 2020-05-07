import { Router } from "express";

import botActions from "./botActions";

const router = Router();

router.get("/", (_, res) => res.send("OK"));
router.use("/bot-actions", botActions);

export default router;
