import { Router } from "express";
import User from "../models/User.js";

const router = Router();

/**
 * @openapi
 * components:
 *   schemas:
 *     User:
 *       type: object
 *       properties:
 *         _id:
 *           type: string
 *           description: The ID of the user.
 *         name:
 *           type: string
 *           description: The name of the user.
 *         email:
 *           type: string
 *           description: The email address of the user.
 *     UserInput:
 *       type: object
 *       properties:
 *         name:
 *           type: string
 *           description: The updated name of the user.
 *         email:
 *           type: string
 *           description: The updated email address of the user.
 */

const users = [
  {
    id: 1,
    name: "John Doe",
    email: "JohnD7@outlook.com",
  },
];

/**
 * @openapi
 * /api/users:
 *   get:
 *     summary: Get all users
 *     tags:
 *       - Users
 *     description: Returns a list of all users.
 *     responses:
 *       200:
 *         description: Successful response with all users.
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/User'
 */

router.get("/api/users", async (req, res) => {
  const users = await User.find({})
    .then((t) => {
      res.status(200).send({ users: t });
    })
    .catch((error) => {
      res.status(500).send({ error: error });
    });
});

/**
 * @openapi
 * /api/users:
 *   post:
 *     summary: Create a new user
 *     tags:
 *       - Users
 *     description: Create a new user with the provided name and email.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 description: The name of the user.
 *               email:
 *                 type: string
 *                 description: The email address of the user.
 *     responses:
 *       200:
 *         description: Successful creation of the user.
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 newUser:
 *                   $ref: '#/components/schemas/User'
 *       500:
 *         description: Internal server error.
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   description: Error message indicating the cause of the error.
 */

router.post("/api/users", async (req, res) => {
  const { email, name } = req.body;
  const newUser = new User({ name: name, email: email });
  await newUser
    .save()
    .then((t) => {
      console.log(t);
      res.status(200).send({ newUser: t });
    })
    .catch((err) => {
      console.log(err);
      res.status(500).send({ error: err });
    });
});

/**
 * @openapi
 * /api/users/{id}:
 *   put:
 *     summary: Update a user
 *     tags:
 *       - Users
 *     description: Update the details of a user with the specified ID.
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: The ID of the user to update.
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 description: The updated name of the user.
 *               email:
 *                 type: string
 *                 description: The updated email address of the user.
 *     responses:
 *       200:
 *         description: Successful update of the user.
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 _id:
 *                   type: string
 *                   description: The ID of the user.
 *                 name:
 *                   type: string
 *                   description: The name of the user.
 *                 email:
 *                   type: string
 *                   description: The email address of the user.
 *       500:
 *         description: Internal server error.
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   description: Error message indicating the cause of the error.
 */

router.put("/api/users/:id", async (req, res) => {
  console.log(req.body);
  const id = req.params.id;
  try {
    const user = await User.updateOne({ _id: id }, { ...req.body });
    console.log(user);
    res.status(200).json({ user });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

/**
 * @openapi
 * /api/users/{id}:
 *   delete:
 *     summary: Delete a user
 *     tags:
 *       - Users
 *     description: Delete a user with the specified ID.
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: The ID of the user to delete.
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Successful deletion of the user.
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 user:
 *                   $ref: '#/components/schemas/User'
 *       500:
 *         description: Internal server error.
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   description: Error message indicating the cause of the error.
 */
router.delete("/api/users/:id", async (req, res) => {
  console.log("Request Body", req.body);
  const id = req.params.id;

  try {
    const user = await User.findOneAndDelete({ _id: id });
    console.log(user);
    res.status(200).json({ user });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;
