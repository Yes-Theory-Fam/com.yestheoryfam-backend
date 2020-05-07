import express from "express";
import listEndpoints from "express-list-endpoints";
import dotenv from "dotenv";
import cors, { CorsOptions } from "cors";

import { forceValidToken } from "./middleware";
import routes from "./routes";

// Loads .env file
dotenv.config();

const app = express();
const port = 3000;

// Adding localhost probably isn't the brightest idea for the productive version?
const whitelist = [
  "http://localhost:8080",
  "https://yestheoryfam.com",
  "https://yes.sklirg.io",
];

const corsOptions: CorsOptions = {
  origin: (origin, cb) => {
    console.log(origin);

    if (whitelist.includes(origin)) return cb(null, true);
    cb(new Error("Not allowed by CORS"));
  },
};

app.use(cors(corsOptions));
app.use(forceValidToken);
app.use("/", routes);

app.listen(port, () => console.log("Running on port " + port));

// Mostly to make sure all endpoints are correct and later to have an easier list to go through when documenting.
console.log("Endpoints that are listened on:", listEndpoints(app));
