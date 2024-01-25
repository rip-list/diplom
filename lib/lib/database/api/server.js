const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

mongoose.connect('mongodb://localhost:27017/diplom')
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error);
  });

const Schema = mongoose.Schema;
const userSchema = new Schema({
  username: String,
  password: String,
});

const UserModel = mongoose.model('data_user', userSchema);  // Изменили название модели на 'data_user'

app.use(express.json());

app.post('/diplom/data_user', express.json(), async (req, res) => {
  try {
    const { username, password } = req.body;
    const newUser = new UserModel({ username, password });
    await newUser.save();
    res.status(201).json(newUser);
    console.log('user creating');
  } catch (error) {
    console.error('Error creating user:', error);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
