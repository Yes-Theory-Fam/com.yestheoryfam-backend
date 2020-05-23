import { bot } from "./api";

const { GUILD_ID, MODERATOR_ROLE } = process.env;

export const isMod = (userId: string): boolean => {
  const guildMember = bot.guilds.resolve(GUILD_ID).member(userId);
  if (!guildMember) return false;

  return guildMember.roles.cache.some((r) => r.id === MODERATOR_ROLE);
};

export default isMod;
