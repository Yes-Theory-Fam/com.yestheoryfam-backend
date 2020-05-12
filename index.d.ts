import { DefaultStateExtends } from "koa";

interface DiscordUser {
  id: string;
}

interface BackendError {
  code: import("./src/config/errors").default;
  message: string;
}

declare module "koa" {
  interface DefaultState extends DefaultStateExtends {
    user: DiscordUser;
  }
}
