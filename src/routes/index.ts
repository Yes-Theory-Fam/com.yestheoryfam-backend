import { Router } from "express";

import botActions from "./botActions";

const router = Router();

router.use("/bot-actions", botActions);

export default router;
