import express from 'express';
import Pool from  '../db.js';
import Router from 'express';

//const app = express();
const pool = Pool;
const router = Router();

// app.use(express.json())
// app.listen(5000, ()=>{
//     console.log("Server started successfully!\n Server running on http://localhost:5000")
// });

// insert new row
router.post("/", async(req, res) => {
    try{
        const {trainer_id, t_name, t_dob, t_phone, t_salary, t_gender}  = req.body;
        const newTrainer = await pool.query(`INSERT INTO public."Trainer"(t_name, t_dob, t_phone, t_salary, t_gender) \
        VALUES (($1),DATE ($2), ($3), ($4), ($5)) returning *;`, [t_name, t_dob, t_phone, t_salary, t_gender])
        res.json(newTrainer)
    }
    catch(err){

        console.error(err.message)
    }
})

// get all rows
router.get("/", async(req, res)=> {
    try{
        const allTrainers = await pool.query(`select * from "Trainer"`);
        res.setHeader("Access-Control-Allow-Origin", "*");
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
        const allTrainers = await pool.query(`select * from "Trainer" where trainer_id = $1`, [id]);
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
        const allTrainers = await pool.query(`delete from "Trainer" where trainer_id = $1 RETURNING *;`, [id]);
        res.json(allTrainers)
    }
    catch(err){
        console.error(err.message);
    }
})

// update row
router.put("/:id", async(req, res)=> {
    try{
        const {trainer_id, t_name, t_dob, t_phone, t_salary, t_gender}  = req.body;
        const {id} = req.params;
        const allTrainers = await pool.query(`UPDATE "Trainer" SET t_name = ($1),  t_dob =DATE ($2), \
        t_phone = ($3), t_salary = ($4), t_gender = ($5) WHERE trainer_id = ($6) RETURNING *;`, [t_name, t_dob, t_phone, t_salary, t_gender, id]);
        res.json(allTrainers.rows);
    }
    catch(err){
        console.error(err.message);
    }
})

export default router;