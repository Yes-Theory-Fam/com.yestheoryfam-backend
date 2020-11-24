import { client, BUCKET_NAME } from "./client";
import shortId from "shortid";
import mime from "mime";
import { File } from "@koa/multer";

export const upload = async (file: File): Promise<string> => {
  const id = shortId.generate();
  const extension = mime.getExtension(file.mimetype);
  const uploadName = `${id}.${extension}`;
  await client.putObject(BUCKET_NAME, uploadName, file.buffer, file.size);

  return uploadName;
};
