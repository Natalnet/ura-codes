import Server from "./server";
import { MqttInterface } from "./@types/mqtt.types";
import MqttService from "./services/mqtt.service";

Server.start().then(async => {
    const mqtt = new MqttService();
    console.log('rodando mqtt');
    mqtt.initialize();
}).catch(console.log);