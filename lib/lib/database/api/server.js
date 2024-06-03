const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const fs = require('fs');
const multer = require('multer');
const path = require('path');
const { Console } = require('console');
const app = express();
const port = 3000;



app.use(cors({
  origin: 'http://localhost:3000/diplom', // потом поменять на адрес в случае разворота 
  methods: 'GET, POST, OPTIONS, PUT, PATCH, DELETE',
  credentials: true,
  allowedHeaders: 'Content-Type',
}));


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
  tasks: [{ type: mongoose.Schema.Types.ObjectId, ref: 'task_users' }],
  firstName: String, 
  lastName: String,
  patronum: String,
  avatarPath: String,
  role: { type: String, enum: ['Intern', 'Director', 'Manager'], default: 'Intern' }
});

const taskSchema = new mongoose.Schema({
  title: String,
  description: String,
});

const UserModel = mongoose.model('data_users', userSchema);  // Изменили название модели на 'data_user'
const TaskModel = mongoose.model('task_users', taskSchema);  // Изменили название модели на 'data_user'

app.use(express.json());

// регистрация

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

// проверка логина юзера
app.use(express.json());

app.post('/diplom/checkUser', async (req, res) => {
  try {
    const { username, password } = req.body;
    console.log('Received request with username:', username, 'and password:', password);

    const user = await UserModel.findOne({ username, password }).populate('tasks')  ;

    console.log('Found user in the database:', user);
    if (user) {
      // Совпадение найдено
      res.status(200).json({ 
        success: true,
        
        user_id: user._id,
        tasks: user.tasks,
        firstName: user.firstName,
        lastName: user.lastName,
        patronum: user.patronum      
      });
      console.log('Returned success response with user_id:', user._id);
    } else {
      // Нет совпадений
      res.status(401).json({ success: false, message: 'Invalid credentials' });
      console.log('Returned failure response');
    }
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});




const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const dir = 'user_avatar/';
    if (!fs.existsSync(dir)){
      fs.mkdirSync(dir);
    }
    cb(null, dir);
  },
  filename: (req, file, cb) => {
    cb(null, req.body.userId + path.extname(file.originalname)); // используем userId как имя файла
  }
});

const upload = multer({ storage: storage });

app.post('/upload', upload.single('image'), async (req, res) => {
  try {
    if (!req.file) {
      throw new Error('File not provided');
    }

    const userId = req.body.userId;
    const avatarPath = 'user_avatar/' + req.file.filename;

    const user = await UserModel.findByIdAndUpdate(userId, { avatarPath: avatarPath });
  

    if (!user) {
      throw new Error('User not found ');
    }
    const newAvatarUrl = `${req.protocol}://${req.get('host')}/get-avatar/${userId}`;

    res.status(200).json({ message: 'File uploaded successfully, ${newAvatarUrl}' , filePath: avatarPath, avatarUrl: newAvatarUrl });
  } catch (error) {
    console.error('Error uploading file:', error.message);
    res.status(500).json({ message: 'Internal Server Error', error: error.message });
  }
});
 

app.get('/get-avatar/:userId', async (req, res) => {
  try {
    const user = await UserModel.findById(req.params.userId);
    
    if (!user || !user.avatarPath) {
      return res.status(404).send('Data not found');
    }
    
    const avatarPath = path.join(__dirname, user.avatarPath);

    res.sendFile(avatarPath, (err) => {
      if (err) {
        console.error('Error sending file:', err);
        res.status(400).json({ message: 'File not provided' });

      } else {
        console.log('File successfully sent');
      }
    });
  } catch (error) {
    console.error('Server error:', error);
    res.status(500).send(error.message);
  }
});


app.post('/updateUser', async (req, res) => {
  console.log('Received body:', req.body);
  
  const { userId, firstName, lastName, patronum } = req.body;
  
  if (!userId) {
    console.log('UserId missing');
    return res.status(400).send('Missing fields');
  }

  try {
    const user = await UserModel.findById(userId);
    if (!user) {
      console.log('User not found for userId:', userId);
      return res.status(404).send('User not found');
    }

    user.firstName = firstName;
    user.lastName = lastName;
    user.patronum = patronum;
    await user.save();

    console.log('User updated successfully');
    res.status(200).send('User updated successfully');
  } catch (error) {
    console.error('Error updating user:', error.message);
    res.status(500).send(error.message);
  }
});
