import express from "express";
import dotenv from "dotenv";

const app = express();
dotenv.config();
const PORT = process.env.SERVER_PORT || 8080;

app.get("/date", (req, res) => {
  res.send(new Date());
});

app.get("/datefromfastapi", async (req, res) => {
  try {
    const response = await fetch("http://127.0.0.1:8000/date");
    const date = await response.json();
    res.status(200).send({ data: date });
  } catch (error) {
    res.status(500).send({ error: error });
  }
});

const server = app.listen(PORT, () => {
  console.log("App is running on port", server.address().port);
});
