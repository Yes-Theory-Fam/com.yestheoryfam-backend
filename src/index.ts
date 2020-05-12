import Koa from 'koa';
import { errorToJson } from './middleware/error-to-json';
import bodyParser from 'koa-bodyparser';
import proxy from "koa-proxy";
import koaLogger from "koa-logger-winston";
import Boom from '@hapi/boom';
import cors from '@koa/cors';
import logger from './logger';
import dotenv from "dotenv";

dotenv.config();


const app = new Koa();

app.use(
  cors()
);


app.use(
  koaLogger(logger)
);

app.use(
  errorToJson()
);

app.use(bodyParser({
  enableTypes: ['json'],
  onerror: (err, ctx) => {
    ctx.throw(Boom.badData(err.message));
  }
}))


app.use(proxy({
  host:"http://discordapp.com/api"
}));

app.listen(process.env.HTTP_PORT, () => console.log("Running on port " + process.env.HTTP_PORT));


