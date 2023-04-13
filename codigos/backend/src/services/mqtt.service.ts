import { MqttInterface } from "../@types/mqtt.types";
import client from 'paho-mqtt'
import * as mqtt from 'paho-mqtt'
import { environment } from "../constants/environment";

global.WebSocket = require('ws');

class MqttService implements MqttInterface {

    async initialize(): Promise<void> {

        const {HOSTNAME, PORT, CLIENT_ID} = environment.MQTT;

        const client = await new mqtt.Client(HOSTNAME, PORT, CLIENT_ID);

        await client.connect(console.log(`Conectado ao MQTT de IP ${HOSTNAME} na porta ${PORT}`));
    }

    async getClient(): Promise<mqtt.Client> {
        return global.mqttv5
    }


    async callback(payload: string): Promise<void> {
        return console.log(payload);
    }

    async onmessagearrived(message: string): Promise<any> {
        
    }
    onconnectionlost(response: string): Promise<any> {
        throw new Error("Method not implemented.");
    }
    
}

export default MqttService