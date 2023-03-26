import express from 'express';

const app = express();
app.use(express.json());


app.post("/payment", (req, res) => {
    console.log(req.body);
    res.status(202).send({message : 'OK'});
})



const server = app.listen(3000, () => {
    console.log("Server is running on port", server.address().port);
})