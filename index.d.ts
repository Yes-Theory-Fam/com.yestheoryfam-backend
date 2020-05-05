declare module "express-list-endpoints" {
  interface Endpoint {
    path: string;
    methods: Array<string>;
  }

  function listEndpoints(app: import("express").Express): Array<Endpoint>;

  export = listEndpoints;
}

interface DiscordUser {
  id: string;
}

interface BackendError {
  code: import("./src/config/errors").default;
  message: string;
}
