import { BUCKET_NAME, client } from "../../lib/minio";
import {
  PhotowallEntry,
  PhotowallEntryRepository,
} from "../../entities/PhotowallEntry";

import { promises as fsPromises } from "fs";

export const seedPhotowall = async (): Promise<void> => {
  const directory = "src/scripts/photowall/assets/";
  const files = await fsPromises.readdir(directory);
  const repo = await PhotowallEntryRepository();
  const entries = [];
  for (const file of files) {
    if (!(file.endsWith(".jpg") || file.endsWith(".jpeg"))) {
      continue;
    }

    const path = directory + file;
    const stat = await fsPromises.stat(path);
    if (stat.isDirectory()) {
      continue;
    }

    await client.fPutObject(BUCKET_NAME, file, path, {});
    const entry = new PhotowallEntry();
    entry.fileId = file;
    entry.published = true;
    entries.push(entry);
  }
  await repo.save(entries);
};
