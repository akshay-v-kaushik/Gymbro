import express from 'express';
import routeExercise from './Routes/exercise_api.js';
import routeCustomer from './Routes/customer_api.js';
import routeTrainer from './Routes/trainer_api.js';
import routeSubscription from './Routes/subscription_api.js';

const app = express();
app.use('/Gymbro/exercise', routeExercise);
app.use('/Gymbro/trainer', routeTrainer);
app.use('/Gymbro/customer', routeCustomer);
app.use('/Gymbro/subscription', routeSubscription);

app.use(express.json())
app.listen(5000, ()=>{
    console.log("Server started successfully!\n Server running on http://localhost:5000")
});