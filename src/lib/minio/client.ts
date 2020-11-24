import { Client } from "minio";

const { ACCESS_KEY, SECRET_KEY, ENDPOINT } = process.env;

export const client = new Client({
  accessKey: ACCESS_KEY,
  secretKey: SECRET_KEY,
  endPoint: ENDPOINT,
  useSSL: false,
});

export const BUCKET_NAME = "yestheoryfam";
