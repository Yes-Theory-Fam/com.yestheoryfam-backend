interface DiscordUser {
  id: string;
  username: string;
}

interface BackendError {
  code: import("./src/config/errors").default;
  message: string;
}

interface KoaState {
  user: DiscordUser;
}
