import Pool from  '../db.js';
import Router from 'express';

const pool = Pool;
const router = Router();


// insert new row
router.post("/", async(req, res) => {
    try{
        const {customer_id, c_name, c_dob, c_phone, c_weight, c_height, c_gender}  = req.body;
        const newTrainer = await pool.query(`INSERT INTO public."Customer"(c_name, c_dob, c_phone, c_weight, c_height, c_gender) \
        VALUES (($1),DATE ($2), ($3), ($4), ($5), ($6)) returning *;`, [c_name, c_dob, c_phone, c_weight, c_height, c_gender])
        res.json(newTrainer)
    }
    catch(err){

        console.error(err.message)
    }
})

// get all rows
router.get("/", async(req, res)=> {
    try{
        const allTrainers = await pool.query(`select * from "Customer"`);
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
        const allTrainers = await pool.query(`select * from "Customer" where customer_id = $1`, [id]);
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
        const allTrainers = await pool.query(`delete from "Customer" where customer_id = $1 RETURNING *;`, [id]);
        res.json(allTrainers)
    }
    catch(err){
        console.error(err.message);
    }
})

// update row
router.put("/:id", async(req, res)=> {
    try{
        const {customer_id, c_name, c_dob, c_phone, c_weight, c_height, c_gender}  = req.body;
        const {id} = req.params;
        const allTrainers = await pool.query(`UPDATE "Customer" SET c_name = ($1),  c_dob =DATE ($2), \
        c_phone = ($3), c_weight = ($4), c_height = ($4), c_gender = ($5) WHERE customer_id = ($6) RETURNING *;`, [c_name, c_dob, c_phone, c_weight, c_height, c_gender, id]);
        res.json(allTrainers.rows);
    }
    catch(err){
        console.error(err.message);
    }
})

export default router;