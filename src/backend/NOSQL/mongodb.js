import mongoose from 'mongoose';

const URI = 'mongodb+srv://gymbro:gymbro%40mongoDB@cluster0.yj5yi2e.mongodb.net/'

mongoose.connect(URI, {useNewUrlParser: true});
const connection = mongoose.connection;

export default connection;