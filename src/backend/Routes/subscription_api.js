import Pool from  '../db.js';
import Router from 'express';

const pool = Pool;
const router = Router();

// insert new row
router.post("/", async(req, res) => {
    try{
        const {s_name, s_cost, s_facilities, s_duration}  = req.body;
        const newSubscription = await pool.query(`INSERT INTO public."Subscriptions"(
            s_name, s_cost, s_facilities, s_duration)
            VALUES (($1), ($2), ($3), ($4)) returning *;`, [s_name, s_cost, s_facilities, s_duration])
        res.json(newSubscription)
    }
    catch(err){

        console.error(err.message)
    }
})

// get all rows
router.get("/", async(req, res)=> {
    try{
        const allSubscriptions = await pool.query(`select * from "Subscriptions"`);
        res.json(allSubscriptions.rows)

    }
    catch(err){
        console.error(err.message);
    }
})

// get specific row
router.get("/:id", async(req, res)=> {
    try{
        const {id} = req.params;
        const allSubscriptions = await pool.query(`select * from "Subscriptions" where s_id = $1`, [id]);
        res.json(allSubscriptions.rows)
    }
    catch(err){
        console.error(err.message);
    }
})

// delete row
router.delete("/:id", async(req, res)=> {
    try{
        const {id} = req.params;
        const allSubscriptions = await pool.query(`delete from "Subscriptions" where s_id = $1 RETURNING *;`, [id]);
        res.json(allSubscriptions)
    }
    catch(err){
        console.error(err.message);
    }
})

// update row
router.put("/:id", async(req, res)=> {
    try{
        const {s_name, s_cost, s_facilities, s_duration}  = req.body;
        const {id} = req.params;
        const allSubscriptions = await pool.query(`UPDATE "Subscriptions" SET s_name = ($1),  s_cost = ($2), \
        s_facilities = ($3), s_duration = ($4) WHERE exercise_id = ($5) RETURNING *;`, [s_name, s_cost, s_facilities, s_duration, id]);
        res.json(allSubscriptions.rows);
    }
    catch(err){
        console.error(err.message);
    }
});

export default router;