import Boom from "@hapi/boom";
import joi from "@hapi/joi";
import { Next, Context } from "koa";

import logger from "./logger";

const errorToJson = async (ctx: Context, next: Next): Promise<void> => {
  try {
    await next();
  } catch (error) {
    ctx.set("content-type", "application/json");

    if (error.isJoi) {
      logger.log("warn", error.stack);

      ctx.status = 400;
      ctx.body = JSON.stringify({
        errors: error.details.map((problem: joi.ValidationErrorItem) => ({
          status: 400,
          detail: problem.message,
          source: { pointer: problem.path.join("/") },
        })),
      });

      return;
    }

    const boomError = Boom.boomify(error);
    const status = boomError.output.statusCode;

    logger.log(status >= 500 ? "error" : "warn", error.stack);

    ctx.status = status;

    ctx.body = JSON.stringify({
      errors: [
        {
          status,
          title: boomError.output.payload.error,
          detail: boomError.output.payload.message,
        },
      ],
    });
  }
};

export default errorToJson;
