import express from "express";
import cors from "cors";
import multer from "multer";

const app = express();
// const upload = multer({dest: "./uploads/"})

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    const fileNameParts = file.originalname.split(".");
    if (fileNameParts.length <= 1) cb(new Error("File has no extension"));
    const extension = fileNameParts.pop();
    const orginalFilename = fileNameParts.join(".");
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);

    const newFileName = originalname + "-" + uniqueSuffix + "." + extension;
    cb(null, newFileName);
  },
});
const upload = multer({ storage });

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(
  cors({
    origin: "*",
  })
);

app.post("/form", (req, res) => {
  delete req.body.password;
  res.send({ data: req.body });
});

app.post("/fileform", upload.single("file"), (req, res) => {
  console.log(req.file);
  res.send({ data: "test" });
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
  console.log("Server is running on port", PORT);
});
