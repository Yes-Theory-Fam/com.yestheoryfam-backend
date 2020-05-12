declare global {
  interface DiscordUser {
    id: string;
  }

  interface BackendError {
    code: import("./src/config/errors").default;
    message: string;
  }
}

import { DefaultStateExtends } from "koa";

declare module "koa" {
  interface DefaultState extends DefaultStateExtends {
    user: DiscordUser;
  }
}
