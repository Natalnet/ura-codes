import { MqttInterface } from "../@types/mqtt.types";
import client from 'paho-mqtt'
import * as mqtt from 'paho-mqtt'
import { enviroment } from "../constants/enviroment";

class MqttService implements MqttInterface {

    async initialize(): Promise<void> {

        if (global.mqttv5) {
            return;
        }

        const {HOSTNAME, PORT, CLIENT_ID} = enviroment.MQTT;

        const client = await new mqtt.Client(HOSTNAME, Number(PORT), CLIENT_ID);

        await client.connect({onSucess:console.log(`Conectado ao MQTT de IP ${HOSTNAME} na porta ${PORT}`)});
    }

    async getClient(): Promise<MqttInterface> {
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