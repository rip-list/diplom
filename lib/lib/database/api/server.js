const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const port = 3000;
app.use(cors());
mongoose.connect('mongodb://localhost:27017/diplom')
  .then(() => {
    console.log('Connected to MongoDB');
    app.listen(port, () => {
      console.log(`Server is running on port ${port}`);
    });
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error);
  });

const Schema = mongoose.Schema;
const userSchema = new Schema({
  username: String,
  password: String,
});

const UserModel = mongoose.model('data_users', userSchema);  // Изменили название модели на 'data_user'

app.use(express.json());

app.post('/diplom/data_users', express.json(), async (req, res) => {
  try {
    const { username, password } = req.body;
    if (username == null) {
      console.log('444444');
      return false;
    }
    const newUser = new UserModel({ username, password });
    await newUser.save();
    res.status(201).json(newUser);
    console.log('User creating');
  } catch (error) {
    console.error('Error creating user:', error);
    res.status(500).send('Internal Server Error');
  }
});
app.post('/diplom/checkUser', async (req, res) => {
  try {
    const { username, password } = req.body;
    const user = await UserModel.find({ username, password });

    console.log(username, password);

    if (user) {
      res.status(200).json({ success: true, message: 'Credentials are valid' });
    } else {
      res.status(401).json({ success: false, message: 'Invalid credentials' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});