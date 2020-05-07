import { Router } from "express";

const router = Router();

router.use("/", (req, _, next) => {
  const { method, path, query, headers } = req;
  const now = new Date().toUTCString();

  console.log(
    `[${now}] - ${method} Request to ${path} with query`,
    query,
    "and headers",
    headers
  );

  next();
});

export default router;
