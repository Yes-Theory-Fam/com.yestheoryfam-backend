import { bot } from "./api";
const BUDDY_PROJECT_ROLES = process.env["BUDDY_PROJECT_ROLES"];
const GUILD_ID = process.env["GUILD_ID"];

const userToServer = async (
  userId: string,
  accessToken: string
): Promise<boolean> => {
  const server = bot.guilds.resolve(GUILD_ID);
  const roles = BUDDY_PROJECT_ROLES.split(/\s*,\s*/);
  const bpRole = roles[0];

  const token = accessToken.substring("Bearer ".length);

  const newMember = await server.addMember(userId, {
    accessToken: token,
    roles,
  });

  if (newMember.roles.cache.map(({ id }) => id).includes(bpRole)) {
    return true;
  }

  console.log(
    "BP Role not found, assumption is that the user is on the server already"
  );

  server.member(userId).roles.add(BUDDY_PROJECT_ROLES);
};

export { userToServer };
