// server/routes/properties.js
import { Router } from 'express';
import { pool } from '../db.js';
const router = Router();

router.get('/', async (_req, res) => {
  const [rows] = await pool.query('SELECT * FROM properties LIMIT 50');
  res.json(rows);
});

export default router;
