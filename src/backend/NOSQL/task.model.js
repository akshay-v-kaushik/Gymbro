import mongoose from "mongoose";

const schema = mongoose.Schema;

const exerciseSchema = new schema({    
    reps: {type: Number, required: true},
    sets: {type: Number, required: true},
    days: {type: [String], required: true}
});

const routineSchema = new schema({
    duration: {type: Number, required: true},
    exercises: {type: [exerciseSchema]}
});

const customerSchema = new schema({
    customer_name: {type: String, required: true},
    routines: {type: [routineSchema]}
});

const trainerSchema = new schema({
    trainer_name: {type: String, required: true},
    customers: {type: [customerSchema], required: true}
});

const Task = mongoose.model('TaskCollection', trainerSchema);
export default Task;