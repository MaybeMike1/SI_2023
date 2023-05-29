import express from "express";
import swaggerUi from "swagger-ui-express";
import swaggerJsdoc from "swagger-jsdoc";
import rateLimit from "express-rate-limit";
import usersRouter from "./routes/userRouter.js";
import mongoose from "mongoose";
import dotenv from 'dotenv';


const app = express();

dotenv.config();

app.use(express.json());

mongoose.connect(process.env.LOCAL_CONNECTION).then((t, error) => {
    if(error) console.log(error);
    console.log("connection established");
});

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // Limit each IP to 100 requests per `window` (here, per 15 minutes)
  standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
  legacyHeaders: false, // Disable the `X-RateLimit-*` headers
});
app.use(limiter);

const swaggerDefinition = {
  openapi: "3.0.0",
  info: {
    title: "OpenAPI Example API",
    version: "1.0.0",
    description: "A simple Express API that utilizes OpenAPI",
  },
};
const options = {
  swaggerDefinition,
  apis: ["./routes/*.js"],
};
app.use("/docs", swaggerUi.serve, swaggerUi.setup(swaggerJsdoc(options)));

app.use(usersRouter);

app.listen(8080, () => console.log("Server is running on port", 8080));
