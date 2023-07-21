import express from 'express';
import Pool from  './db.js';

const app = express();
const pool = Pool;

app.use(express.json())
app.listen(5000, ()=>{
    console.log("Server started successfully!\n Server running on http://localhost:5000")
});

// insert new row
app.post("/Gymbro/exercise", async(req, res) => {
    try{
        const {exercise_id, e_name, e_difficulty, e_muscles}  = req.body;
        const newTrainer = await pool.query(`INSERT INTO public."Exercise"(e_name, e_difficulty, e_muscles) \
        VALUES (($1), ($2), ($3)) returning *;`, [e_name, e_difficulty, e_muscles])
        res.json(newTrainer)
    }
    catch(err){

        console.error(err.message)
    }
})

// get all rows
app.get("/Gymbro/exercise", async(req, res)=> {
    try{
        const allTrainers = await pool.query(`select * from "Exercise"`);
        res.json(allTrainers.rows)

    }
    catch(err){
        console.error(err.message);
    }
})

// get specific row
app.get("/Gymbro/exercise/:id", async(req, res)=> {
    try{
        const {id} = req.params;
        const allTrainers = await pool.query(`select * from "Exercise" where exercise_id = $1`, [id]);
        res.json(allTrainers.rows)
    }
    catch(err){
        console.error(err.message);
    }
})

// delete row
app.delete("/Gymbro/exercise/:id", async(req, res)=> {
    try{
        const {id} = req.params;
        const allTrainers = await pool.query(`delete from "Exercise" where exercise_id = $1 RETURNING *;`, [id]);
        res.json(allTrainers)
    }
    catch(err){
        console.error(err.message);
    }
})

// update row
app.put("/Gymbro/exercise/:id", async(req, res)=> {
    try{
        const {exercise_id, e_name, e_difficulty, e_muscles}  = req.body;
        const {id} = req.params;
        const allTrainers = await pool.query(`UPDATE "Exercise" SET e_name = ($1),  e_difficulty = ($2), \
        e_muscles = ($3) WHERE exercise_id = ($4) RETURNING *;`, [e_name, e_difficulty, e_muscles, id]);
        res.json(allTrainers.rows);
    }
    catch(err){
        console.error(err.message);
    }
})