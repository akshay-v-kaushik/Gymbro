import {mongoose} from 'mongoose';

const uri = `mongodb+srv://akshay-v-kaushik:dildofagit47@gymbro.ikscicr.mongodb.net/`;
mongoose.connect(uri, {useNewUrlParser: true});
const connection = mongoose.connection;
connection.once('open', () => {
    console.log('Connection to MongoDB server established successfully');
})