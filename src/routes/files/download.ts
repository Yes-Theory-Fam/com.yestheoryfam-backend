import Router from "@koa/router";

const router = new Router<KoaState>();

router.get("/:id", async (ctx) => {
  console.log(ctx.params);
});
// Download

export default router;
