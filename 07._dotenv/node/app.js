import express from 'express';
import dotenv from 'dotenv';

const app = express();
dotenv.config();
const PORT = process.env.SERVER_PORT || 8080;


app.get('/mysecret', (req, res) => {
    try{
        res.status(200).send({data : process.env.MY_SECRET || null})
    }catch(error){
        res.status(500).send({error: error})
    }
});

const server = app.listen(PORT, () => {
    console.log("App is running on port", PORT);
});