import express from 'express';
import fileSelector from '../node/functions.js';
import fetch from 'node-fetch';
import https from 'https';

const options = {
    hostname: "localhost",
    port: 7142,
    path: '/me/xml',
    method: 'GET',
    headers: {
        'Content-Type' : 'application/json'
    },
    rejectUnauthorized: false
  };

const app = express();

app.get("/data/yaml", async (req , res) => {
    const result = await fileSelector('./data/me.yaml');
    res.send(result);
});

app.get("/data/xml", async (req, res) => {
    const result = await fileSelector('./data/me.xml');
    res.send(result);
})

app.get("/data/json", async (req, res) => {
    const result = await fileSelector('./data/me.json');
    res.send(result);
})

app.get("/data/csv", async (req, res) => {
    const result = await fileSelector('./data/me.csv');
    res.send(result);
})

app.get("/data/txt", async (req, res) => {
    const result = await fileSelector('./data/me.txt');
    res.send(result);
})

app.get("/dotnet/xml", async (req, res) => {
   const result = await fetch("http://localhost:5257json");
    const json = await result.json();
    res.send(json)
});

app.get("/dotnet/yaml", async (req, res) => {
    const result = await fetch("http://localhost:5257/yaml");
    const json = await result.json();
    res.send(json);
})

const server = app.listen(8080, () => {
    console.log('server is listening on ', server.address().port);
});