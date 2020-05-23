import Router from "@koa/router";
import { BlogRepository, BlogSchema, Blog } from "../../entities/Blog";
import shortId from "shortid";
import { logToDiscord } from "../../common/utils";

const router = new Router<KoaState>();

const { LOCAL_WEBSITE } = process.env;

router.get("/", async (ctx) => {
  const repo = await BlogRepository();
  const blogs = await repo.find({
    where: {
      isPublic: true,
    },
    order: {
      id: "DESC",
    },
  });

  ctx.status = 200;
  ctx.body = blogs;
});

router.post("/", async (ctx) => {
  const blog: Blog = ctx.request.body;
  await BlogSchema.validateAsync(blog);
  blog.authorId = ctx.state.user.id;
  blog.authorName = ctx.state.user.username;
  blog.previewId = shortId.generate();

  const repo = await BlogRepository();
  const saved = await repo.save(blog);
  ctx.status = 201;
  ctx.body = {
    id: saved.id,
    previewId: saved.previewId,
  };

  logToDiscord(
    `Someone just wrote a new blog post! Check it out at ${LOCAL_WEBSITE}/blogs/preview/${saved.previewId} !`
  );
});

router.get("/:id", async (ctx) => {
  const id = ctx.params.id;
  const repo = await BlogRepository();
  const blog = await repo.findOne(id);

  if (!blog.isPublic) {
    ctx.throw(404, "Blog not found!");
  }

  ctx.status = 200;
  ctx.body = blog;
});

export default router;
