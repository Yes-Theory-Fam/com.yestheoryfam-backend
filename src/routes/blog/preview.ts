import Router from "@koa/router";
import { BlogRepository } from "../../entities/Blog";
import { bot } from "../../lib/discord/api";
import Joi from "@hapi/joi";

import { forceMod } from "../../middleware";
import { Boom } from "@hapi/boom";

const router = new Router<KoaState>();
const { LOCAL_WEBSITE } = process.env;

router.get("/:id", async (ctx) => {
  const previewId = ctx.params.id;
  const repo = await BlogRepository();
  const blog = await repo.findOne({
    where: {
      previewId,
    },
  });

  if (!blog) ctx.throw(new Boom("Preview not found!", { statusCode: 404 }));

  ctx.status = 200;
  ctx.body = blog;
});

router.post("/:id/accept", forceMod, async (ctx) => {
  const previewId = ctx.params.id;
  const repo = await BlogRepository();
  const blog = await repo.findOne({
    previewId,
  });

  if (blog.isPublic) {
    ctx.throw(new Boom("Post is already public!", { statusCode: 400 }));
  }

  blog.isPublic = true;
  repo.save(blog);
  ctx.status = 204;

  const author = blog.authorId;
  const authorDm = await bot.users.resolve(author).createDM();

  const url = `${LOCAL_WEBSITE}/blogs/${blog.id}`;

  authorDm.send(
    `Heyyo! Just wanted to let you know that your blog post was approved :) You can find it here: ${url}
Thanks for writing!`
  );
});

router.post("/:id/reject", forceMod, async (ctx) => {
  const previewId = ctx.params.id;
  const body = ctx.request.body;
  await Joi.object({ message: Joi.string() }).validateAsync(body);

  const repo = await BlogRepository();
  const blog = await repo.findOne({ previewId });

  if (blog.isPublic) {
    ctx.throw(new Boom("Post is already public!", { statusCode: 400 }));
  }

  const author = blog.authorId;

  await repo.delete(blog);

  ctx.status = 204;
  const message = body.message;
  const authorDm = await bot.users.resolve(author).createDM();

  authorDm.send(
    `Heyyo! Just wanted to let you know that your blog post was rejected. The mod who made that decision included this message:
> ${message}
Thanks for writing either way and sorry that it didn't work out!`
  );
});

export default router;
