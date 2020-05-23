import Error from "../config/errors";
import { AxiosResponse } from "axios";

import { bot } from "../lib/discord/api";
import { TextChannel } from "discord.js";

const createUnexpectedResponseError = (
  response: AxiosResponse,
  action: string
): BackendError => {
  return {
    code: Error.UNEXPECTED_RESPONSE_CODE,
    message: `Unexpected response code while ${action}: ${response.status} - Body was: ${response.data}`,
  };
};

const logToDiscord = (message: string): void => {
  const { GUILD_ID, LOGGING_CHANNEL } = process.env;

  const loggingChannel = bot.guilds
    .resolve(GUILD_ID)
    .channels.resolve(LOGGING_CHANNEL) as TextChannel;

  loggingChannel.send(message);
};

export { createUnexpectedResponseError, logToDiscord };
