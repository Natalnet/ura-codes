import express from 'express'
import cors from 'cors'
import api from './api/api'

import RedisService from "./services/redis.service"

const app = express()
const redis = new RedisService();

app.use(express.json())
app.use(cors())

const port = 5555;

app.listen(port, () => {
    console.log(`Servidor iniciado na porta ${port}`);

}).then(async() => {

    await redis.initialize()

}).catch((error) => console.log('Erro', error));