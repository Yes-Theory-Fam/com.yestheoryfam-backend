import Router from "@koa/router";
import { BUCKET_NAME, client } from "../../lib/minio";

const router = new Router<KoaState>();

router.get("/:fileId", async (ctx) => {
  const { fileId } = ctx.params;
  ctx.body = await client.getObject(BUCKET_NAME, fileId);
  ctx.status = 200;
});
// Download

export default router;
