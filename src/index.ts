import Koa from "koa";
import dotenv from "dotenv";
import cors, { Options } from "@koa/cors";
import koaLogger from "koa-logger-winston";

// Loads .env files
dotenv.config();

import { forceValidToken, logger, errorHandler } from "./middleware";
import routes from "./routes";

const app = new Koa();
const port = 3000;

// Adding localhost probably isn't the brightest idea for the production version?
const whitelist = [
  process.env["LOCAL_WEBSITE"],
  "https://yestheoryfam.com",
  "https://yes.sklirg.io",
];

const corsOptions: Options = {
  origin: (ctx) => {
    const origin = ctx.request.header.origin;
    if (whitelist.includes(origin)) return origin;

    ctx.throw(`Disallowed origin attempted to connect to API: ${origin}`);
  },
};

app.use(errorHandler);
app.use(cors(corsOptions));
app.use(koaLogger(logger));
app.use(forceValidToken);
app.use(routes.routes()).use(routes.allowedMethods());

app.listen(port, () => console.log("Running on port " + port));
