import Router from 'express';
import Task from '../Models/task.model.js';

const router = Router();

router.get('/', async (req, res) => {
    try{
        const task = await Task.find();
        res.json(task);
    } catch(err) {
        res.status(400).json('Error ' +err)
    }
});

router.post('/', async (req, res) => {
    try{
        const {trainer_name, customers} = req.body;
        const newExercise = new Task({trainer_name, customers});
        await newExercise.save();
        res.json('Exercise added');
    } catch (err) {
        res.status(400).json('Error '+err)
    }

});

router.get('/:id', async (req, res) =>{
    try{
        const task = await Task.findById(req.params.id);
        res.json(task);
    } catch(err) {
        res.status(400).json('Error '+ err);
    }
});

router.delete('/:id', async (req, res) =>{
    try{
        const task = await Task.findByIdAndDelete(req.params.id);
        res.json("Task Deleted");
    } catch(err) {
        res.status(400).json('Error '+ err);
    }
});

router.put('/:id', async (req, res) =>{
    try{
        const task = await Task.findById(req.params.id);
        if(!task){
            return res.status(404).json({ error: 'Task not found' });            
        }
        const {trainer_id, customer_id, duration, exercises} = req.body;
        task.trainer_id = trainer_id;
        task.customer_id = customer_id;
        task.duration = duration;
        task.exercises = exercises;
        await task.save();
        res.json({ message: 'Task updated successfully', task: task })

    } catch(err) {
        res.status(400).json('Error '+ err);
    }
});


export default router;