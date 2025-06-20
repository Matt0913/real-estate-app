
import express from 'express';
import cors from 'cors';
import { pool } from './db.js';
import propertiesRouter from './routes/properties.js';

const app = express();
app.use(cors());
app.use(express.json());          


app.get('/api/ping', (_req, res) => res.json({pong: true}));


app.use('/api/properties', propertiesRouter);


app.use((req, res) => res.status(404).json({error: 'Not found'}));

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log('API running on port', PORT));

