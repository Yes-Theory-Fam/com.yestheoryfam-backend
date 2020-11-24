import Router from "@koa/router";
import { PhotowallEntryRepository } from "../../entities/PhotowallEntry";

const pageSize = 20;
const router = new Router<KoaState>();

interface PhotowallPageResult {
  page: number;
  hasNext: boolean;
  imageIds: string[];
}

const getImages = async (page = 0): Promise<PhotowallPageResult> => {
  const skip = page * pageSize;
  const repo = await PhotowallEntryRepository();
  const photowallEntries = await repo.find({
    where: {
      published: true,
    },
    skip,
    take: pageSize + 1,
    select: ["fileId"],
  });

  return {
    page,
    hasNext: photowallEntries.length > pageSize,
    imageIds: photowallEntries.map((entry) => entry.fileId),
  };
};

router.get("/", async (ctx) => {
  ctx.body = await getImages();
  ctx.status = 200;
});

router.get("/:page", async (ctx) => {
  const { page } = ctx.params;
  ctx.body = await getImages(page);
  ctx.status = 200;
});

export default router;
