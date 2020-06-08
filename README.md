# Backend for yestheoryfam.com

This repository contains the code for the express server powering the website https://yestheoryfam.com

## Requirements

Node 13+ is required to run this project.

You also need a `.env` file in the root of this project with these keys:

| Key                      | Description                                                                                                                                                                                                                           |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BOT_TOKEN`              | A Discord Bot token. This is used to add users to the server (see [Add Guild Member](https://discordapp.com/developers/docs/resources/guild#add-guild-member))                                                                        |
| `GUILD_ID`               | The ID of the server people will be added to                                                                                                                                                                                          |
| `BUDDY_PROJECT_ROLES`    | A comma seperated list of role IDs the user is given when signing up for the buddy project. The first of them has to be the actual Buddy Project role as it is considered for a check for whether a user is new to the server or not. |
| `LOCAL_WEBSITE`          | (optional) The host of the local dev server running the frontend. This is used for CORS and should be left out in a production environment.                                                                                           |
| `LOG_LEVEL`              | The log level for the winston logger, see [Winston Logging Levels](https://github.com/winstonjs/winston#logging-levels) for more information.                                                                                         |
| `HTTP_PORT`              | (optional) The port the server will listen on (defaults to 3000)                                                                                                                                                                      |
| `DISCORD_LOGGER_WEBHOOK` | (optional) A Discord Webhook URL used for Winston. If not present, Winston will log to the console                                                                                                                                    |
| `SKIP_AUTHENTICATION`    | (optional) true \| false, if true the backend won't force a valid Discord auth token to be used. This can come in handy in development when using something like Postman and not wanting to change Discord tokens every now and then. |

## Instructions

To run the webservice, run the following commands:

```
git clone https://github.com/yes-theory-fam/com.yestheory-backend.git
cd com.yestheory-backend
npm install
npm start
```

This will clone the repository, install all dependencies and start the node process.
