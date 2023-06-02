import { MqttInterface } from "../@types/mqtt.types";
import * as mqtt from 'paho-mqtt'
import { environment } from "../constants/environment";
import { hostname } from "os";

global.WebSocket = require('ws');

const { HOSTNAME, PORT, CLIENT_ID } = environment.MQTT;

const client = new mqtt.Client('10.6.1.42', PORT, CLIENT_ID);

class MqttService implements MqttInterface {

    async initialize(): Promise<void> {

        console.log(`hostname ${HOSTNAME}`)
        console.log(`port ${PORT}`)

        client.startTrace();

        client.connect({
            onSuccess: this.onconnect,
            userName: 'mqtt',
            password: 'lar_mqtt'
        });

        client.publish('teste', 'hello_world', 1, false);
    }

    async onconnect(): Promise<void> {

        client.subscribe('esp/dht/temperature')

        const message = new client.MQTT.Message("Hello world");

        message.destination = "/helloworld";

        client.publish(message);
    }

    async getClient(): Promise<mqtt.Client> {
        return global.mqttv5
    }


    async callback(payload: string): Promise<void> {
        return console.log(payload);
    }

    async onmessagearrived(message: string): Promise<any> {
        
    }

    async onconnectionlost(response: string): Promise<void> {
        
    }

    async onsubscribetopic(topic: string): Promise<any> {
        
    }

    async onpublishmessage(message: string, destination: string): Promise<void> {
        
    }
    
}

export default MqttService;