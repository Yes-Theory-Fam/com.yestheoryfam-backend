import { Router } from "express";
import { getUserDetails } from "../lib/discord";
import Error from "../config/errors";

const router = Router();

router.use("/", async (req, res, next) => {
  const { authorization } = req.headers;
  if (!authorization) {
    res.status(401).send("Unauthorized");
    return;
  }

  try {
    const userDetails = await getUserDetails(authorization);
    res.locals.user = userDetails;
  } catch (e) {
    if (e.code === Error.UNEXPECTED_RESPONSE_CODE) {
      console.log(`Error thrown: ${e.message}`);
    }
    res.status(401).send("Unauthorized");
    return;
  }

  next();
});

export default router;
