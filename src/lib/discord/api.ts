import axios from "axios";

interface UserDetails {
  type: "user";
  token: string;
}

interface BotDetails {
  type: "bot";
}

type ApiCredentials = UserDetails | BotDetails;

const BOT_TOKEN = process.env["BOT_TOKEN"];

export const DiscordApi = (creds: ApiCredentials) => {
  const isUserCheck = (creds: ApiCredentials): creds is UserDetails =>
    creds.type === "user";

  const token = isUserCheck(creds)
    ? `Bearer ${creds.token}`
    : `Bot ${BOT_TOKEN}`;

  const api = axios.create({
    baseURL: "https://discordapp.com/api/",
    timeout: 3000,
    headers: {
      Authorization: token,
    },
  });
  return api;
};

export default DiscordApi;
