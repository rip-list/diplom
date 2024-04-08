const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const multer = require('multer');
const path = require('path');
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
  patronum: String
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


// загрузка аватара 
const uploadDir = path.join(__dirname, 'uploads');
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, uploadDir);
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});

const upload = multer({ storage: storage });

// Маршрут для загрузки файлов
const FileModel = mongoose.model('File', {
  avatar : String,
  data: Buffer,
});

app.post('/upload', upload.single('file'), async (req, res) => {
  try {
    const { file } = req;
    const data = fs.readFileSync(file.path);

    const newFile = new FileModel({
      name: file.originalname,
      data: data,
    });
    await newFile.save();

    fs.unlinkSync(file.path);

    res.send('Файл успешно загружен в MongoDB');
  } catch (error) {
    console.error(error);
    res.status(500).send('Ошибка загрузки файла');
  }
});
app.listen(port, () => {
  console.log(`Сервер запущен на порту ${port}`);
});