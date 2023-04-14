import { MqttInterface } from "../@types/mqtt.types";
import Client from 'paho-mqtt'
import * as mqtt from 'paho-mqtt'
import { environment } from "../constants/environment";

global.WebSocket = require('ws');

class MqttService implements MqttInterface {

    async initialize(): Promise<void> {

        if (global.mqttv5) {
            return;
        }

        const {HOSTNAME, PORT, CLIENT_ID} = environment.MQTT;

        const client = await new mqtt.Client(HOSTNAME, PORT, CLIENT_ID);

        await client.connect({

            userName: "mqtt",
            password: "lar_mqtt"

        });

        global.mqttv5 = client;

        client.subscribe('#');

        console.log('MQTT conectado com sucesso.')
    }

    async getClient(): Promise<Client> {
        return global.mqttv5;
    }


    async callback(payload: string): Promise<void> {
        return console.log(payload);
    }

    async onmessagearrived(message: string): Promise<any> {
        
    }

    async onsubscribetopic(topic: string): Promise<string> {
        return (await this.getClient()).subscribe(topic);
    }

    async onpublishmessage(message: string, destination: string): Promise<void> {

       //const mqttMsg = (this.getClient()).Message(message);

       console.log('ok')

       //return (await this.getClient()).send(mqttMsg, destination);
    }

    onconnectionlost(response: string): Promise<any> {
        throw new Error("Method not implemented.");
    }
    
}

export default MqttService