import { Router } from "express";
import { userToServer } from "../../lib/discord";

const router = Router();

router.post("/", async (req, res) => {
  const user: DiscordUser = res.locals.user;
  const { authorization } = req.headers;
  const success = await userToServer(user.id, authorization);

  if (success) {
    res.send("OK");
  } else {
    console.error(
      "Adding a user to the server failed! Check logs above for reasoning"
    );
    res.status(500).send("Server Error");
  }
});

export default router;
