import {mongoose, Schema} from 'mongoose';

const exerciseSchema = new Schema({
    e_name: {type: String, required: true},
    e_difficulty: {type: String, required: true},
    e_targetMuscles: {type: [String], required: true},
    e_visual: {type: Mixed, required: false},
})


const Exercise = mongoose.model('Exercise', exerciseSchema);
export default Exercise;

