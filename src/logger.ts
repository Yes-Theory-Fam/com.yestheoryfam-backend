import * as Winston from "winston";
import DiscordTransport from "winston-discord-transport";

const { LOG_LEVEL, DISCORD_LOGGER_WEBHOOK } = process.env;

export default Winston.createLogger({
  format: Winston.format.json(),
  transports: [
    new DiscordTransport({
      webhook: DISCORD_LOGGER_WEBHOOK,
      level: LOG_LEVEL,
      defaultMeta: { name: "YesTheoryFam-Backend" },
    }),
  ],
});
