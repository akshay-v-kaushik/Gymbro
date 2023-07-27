import express from 'express';
import connection from './NOSQL/mongodb.js';
import routeTask from './Routes/task_api.js'
import routeExercise from './Routes/exercise_api.js';
import routeCustomer from './Routes/customer_api.js';
import routeTrainer from './Routes/trainer_api.js';
import routeSubscription from './Routes/subscription_api.js';


const app = express();

app.use(express.json());
app.use('/Gymbro/exercise', routeExercise);
app.use('/Gymbro/trainer', routeTrainer);
app.use('/Gymbro/customer', routeCustomer);
app.use('/Gymbro/subscription', routeSubscription);
app.use('/Gymbro/task', routeTask);

connection.once('open', ()=>{
    console.log('Connected to MongoDB server');
});

app.listen(5000, ()=>{
    console.log("Server started successfully!\nServer running on http://localhost:5000")
});