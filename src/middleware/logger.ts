import Winston from "winston";
import DiscordTransport from "winston-discord-transport";

const { LOG_LEVEL, DISCORD_LOGGER_WEBHOOK } = process.env;

const transports = DISCORD_LOGGER_WEBHOOK
  ? new DiscordTransport({
      webhook: DISCORD_LOGGER_WEBHOOK,
      level: LOG_LEVEL,
      defaultMeta: { name: "BackendLoggerTesting" },
    })
  : new Winston.transports.Console({ level: LOG_LEVEL });

export default Winston.createLogger({
  level: LOG_LEVEL,
  format: Winston.format.json(),
  transports,
});
