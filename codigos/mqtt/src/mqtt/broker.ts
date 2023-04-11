import mosca from 'mosca'
import dotenv from 'dotenv'

const mqttPort = process.env.MQTT_PORT;

const server = new mosca.Server({port: mqttPort})

server.on('ready', () => {
    console.log(`Servidor MQTT rodando na porta ${mqttPort}`);
});