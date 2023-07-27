import Pool from  '../SQL/postgresdb.js';
import Router from 'express';


const pool = Pool;
const router = Router();

// insert new row
router.post("/", async(req, res) => {
    try{
        const {exercise_id, e_name, e_difficulty, e_muscles}  = req.body;
        const newTrainer = await pool.query(`INSERT INTO public."Exercises"(e_name, e_difficulty, e_muscles) \
        VALUES (($1), ($2), ($3)) returning *;`, [e_name, e_difficulty, e_muscles])
        res.json(newTrainer)
    }
    catch(err){

        console.error(err.message)
    }
})

// get all rows
router.get("/", async(req, res)=> {
    try{
        const allTrainers = await pool.query(`select * from "Exercises"`);
        res.json(allTrainers.rows)

    }
    catch(err){
        console.error(err.message);
    }
})

// get specific row
router.get("/:id", async(req, res)=> {
    try{
        const {id} = req.params;
        const allTrainers = await pool.query(`select * from "Exercises" where exercise_id = $1`, [id]);
        res.json(allTrainers.rows)
    }
    catch(err){
        console.error(err.message);
    }
})

// delete row
router.delete("/:id", async(req, res)=> {
    try{
        const {id} = req.params;
        const allTrainers = await pool.query(`delete from "Exercises" where exercise_id = $1 RETURNING *;`, [id]);
        res.json(allTrainers)
    }
    catch(err){
        console.error(err.message);
    }
})

// update row
router.put("/:id", async(req, res)=> {
    try{
        const {exercise_id, e_name, e_difficulty, e_muscles}  = req.body;
        const {id} = req.params;
        const allTrainers = await pool.query(`UPDATE "Exercises" SET e_name = ($1),  e_difficulty = ($2), \
        e_muscles = ($3) WHERE exercise_id = ($4) RETURNING *;`, [e_name, e_difficulty, e_muscles, id]);
        res.json(allTrainers.rows);
    }
    catch(err){
        console.error(err.message);
    }
});

export default router;