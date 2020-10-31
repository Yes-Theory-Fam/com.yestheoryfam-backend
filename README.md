# Backend for yestheoryfam.com

This repository contains the code for the express server powering the website https://yestheoryfam.com

## Requirements

Node 13+ is required to run this project.

You also need a `.env` file in the root of this project with these keys:

| Key                      | Description                                                                                                                                                                                                                           |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BOT_TOKEN`              | A Discord Bot token. This is used to add users to the server (see [Add Guild Member](https://discordapp.com/developers/docs/resources/guild#add-guild-member))                                                                        |
| `GUILD_ID`               | The ID of the server people will be added to                                                                                                                                                                                          |
| `BUDDY_PROJECT_ROLE`     | The ID of the role for users who are part of the Buddy Project                                                                                                                                                                        |
| `LOGGING_CHANNEL`        | The ID of a TextChannel on Discord used to log things like new blogs. The channel has to be in the guild referenced by `GUILD_ID`                                                                                                     |
| `LOCAL_WEBSITE`          | The host of the local dev server running the frontend. This is used for CORS as well as creating logging URLs. environment.                                                                                                           |
| `LOG_LEVEL`              | The log level for the winston logger, see [Winston Logging Levels](https://github.com/winstonjs/winston#logging-levels) for more information.                                                                                         |
| `HTTP_PORT`              | (optional) The port the server will listen on (defaults to 3000)                                                                                                                                                                      |
| `DISCORD_LOGGER_WEBHOOK` | (optional) A Discord Webhook URL used for Winston. If not present, Winston will log to the console                                                                                                                                    |
| `SKIP_AUTHENTICATION`    | (optional) true \| false, if true the backend won't force a valid Discord auth token to be used. This can come in handy in development when using something like Postman and not wanting to change Discord tokens every now and then. |
| `MODERATOR_ROLE`         | The ID of a role on the server referenced by `GUILD_ID` that is allowed to handle blog posts.                                                                                                                                         |

## Instructions

To run the webservice, run the following commands (requires docker to be installed):

```
git clone https://github.com/yes-theory-fam/com.yestheory-backend.git
cd com.yestheory-backend
docker-compose up
npm install
npm start
```

This will clone the repository, install all dependencies and launch a database as well as a minio server to host files.

### Relevant addresses

Address | Description
http://localhost:3000 | Backend
http://localhost:5432 | Exposed postgres database
http://localhost:9000 | Exposed minio server
