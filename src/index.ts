import Koa from "koa";
import dotenv from "dotenv";
import cors, { Options } from "@koa/cors";
import koaLogger from "koa-logger-winston";
import bodyParser from "koa-bodyparser";
import Boom from "@hapi/boom";

// Loads .env files
dotenv.config();

import "./db"; // Imported for side effects
import { forceValidToken, logger, errorHandler } from "./middleware";
import routes from "./routes";
import { PhotowallEntryRepository } from "./entities/PhotowallEntry";
import { seedPhotowall } from "./scripts/photowall/seedPhotowall";

const app = new Koa();
const HTTP_PORT = process.env["HTTP_PORT"] ?? 3000;

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

app.use(
  bodyParser({
    enableTypes: ["json"],
    onerror: (err, ctx) => {
      ctx.throw(Boom.badData(err.message));
    },
  })
);

app.use(forceValidToken);
app.use(routes.routes());

console.log(routes.stack.map((s) => s.path));

app.listen(HTTP_PORT, () => console.log("Running on port " + HTTP_PORT));

const seed = async (): Promise<void> => {
  const photoWallRepo = await PhotowallEntryRepository();
  const hasResult = await photoWallRepo.findOne();
  if (!hasResult) {
    await seedPhotowall();
  }
};

setTimeout(() => seed().then(() => console.log("Seeded")), 1000);
