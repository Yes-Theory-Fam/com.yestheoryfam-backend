# Backend for yestheoryfam.com

This repository contains the code for the express server powering the website https://yestheoryfam.com

## Requirements

Node 13+ and Yarn are required to run this project.

You also need a `.env` file in the root of this project with these keys:

| Key                  | Description                                                                                                                                                    |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BOT_TOKEN`          | A Discord Bot token. This is used to add users to the server (see [Add Guild Member](https://discordapp.com/developers/docs/resources/guild#add-guild-member)) |
| `GUILD_ID`           | The ID of the server people will be added to                                                                                                                   |
| `BUDDY_PROJECT_ROLE` | The ID of the role for users who are part of the Buddy Project                                                                                                 |

## Instructions

To run the webservice, run the following commands:

```
git clone https://github.com/yes-theory-fam/com.yestheory-backend.git
cd com.yestheory-backend
yarn
yarn start
```

This will clone the repository, install all dependencies and start the node process.
