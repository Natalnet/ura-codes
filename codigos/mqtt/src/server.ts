import express from 'express'
import cors from 'cors'
import api from './api/api'

const app = express()

app.use(express.json())
app.use(cors())

const port = 5555;

app.listen(port, () => {
    console.log(`Servidor iniciado na porta ${port}`);
});