const express = require ('express');
const cors = require('cors');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const cookieParser =  require('cookie-parser');
const authRoute = require('./routes/auth');
const userRoute = require('./routes/user');

const app = express();
dotenv.config();

//console.log('dotenv', process.env.DB_URL)
mongoose.connect(process.env.DB_URL)
.then(()=>{
    console.log('ket noi thanh cong db')
})
.catch((err)=>{
    console.log(err)
})

app.use(cors());
app.use(cookieParser());
app.use(express.json());

//routers
app.use('/v1/auth', authRoute);
app.use('/v1/user', userRoute);

app.listen(8000,()=>{
    console.log('server dang chay');
});

//authentication
//authorization phan quyen
//jsonwebtoken de xac thuc nguoi dung
