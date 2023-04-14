import Server from "./server";
import { MqttInterface } from "./@types/mqtt.types";
import MqttService from "./services/mqtt.service";

Server.start().then(async => {
    const mqtt = new MqttService();
    

    mqtt.initialize();

}).catch(console.log);