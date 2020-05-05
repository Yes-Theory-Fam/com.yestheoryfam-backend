import express from "express";
import listEndpoints from "express-list-endpoints";
import dotenv from "dotenv";

import { forceValidToken } from "./middleware";
import routes from "./routes";

// Loads .env file
dotenv.config();

const app = express();

const port = 3000;

console.log(process.env["BOT_TOKEN"]);

app.use(forceValidToken);
app.use("/", routes);

app.listen(port, () => console.log("Running on port " + port));

// Mostly to make sure all endpoints are correct and later to have an easier list to go through when documenting.
console.log("Endpoints that are listened on:", listEndpoints(app));
