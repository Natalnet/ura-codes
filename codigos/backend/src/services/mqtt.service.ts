import { MqttInterface } from "../@types/mqtt.types";
import * as mqtt from 'paho-mqtt'
import { enviroment } from "../constants/enviroment";

class MqttService implements MqttInterface {

    async initialize(): Promise<void> {

        const {HOSTNAME, PORT} = enviroment.MQTT;

        const client = await new mqtt.Client(HOSTNAME, PORT, "mqtt-ura", {

            keepalive: 60,
            clean: true,
            reconnectPeriod: 1000,

        });

        client.connect({onSucess:console.log(`Conectado ao MQTT de IP ${HOSTNAME} 
        na porta ${PORT}`)})
    }


    callback(): Promise<void> {
        throw new Error("Method not implemented.");
    }
    
}

export default MqttService