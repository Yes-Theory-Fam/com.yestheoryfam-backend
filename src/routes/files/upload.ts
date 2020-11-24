import Router from "@koa/router";
import multer from "@koa/multer";
import { upload } from "../../lib/minio";
import {
  PhotowallEntry,
  PhotowallEntryRepository,
} from "../../entities/PhotowallEntry";

const multerM = multer();

const router = new Router<KoaState>();

const postPhotowallUpload = async (fileId: string): Promise<void> => {
  const repo = await PhotowallEntryRepository();
  const entry = new PhotowallEntry();
  entry.fileId = fileId;
  // TODO false + review process
  entry.published = true;
  await repo.save(entry);
};

const uploads = [
  {
    directory: "photowall",
    postUpload: postPhotowallUpload,
  },
  {
    directory: "blog",
  },
];

for (const { directory, postUpload } of uploads) {
  // Make directory more flexible but with validation
  router.post("/" + directory, multerM.single("file"), async (ctx) => {
    const { file } = ctx.request;
    const fileId = await upload(file);
    if (postUpload) {
      await postUpload(fileId);
    }
  });
}

export default router;
