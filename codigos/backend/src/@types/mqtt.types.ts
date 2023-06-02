import * as mqttv5 from 'paho-mqtt'
export interface MqttInterface {

    initialize(): Promise<void>;
    
    onconnect(): Promise<void>;

    getClient(): Promise<mqttv5.Client>;

    callback(payload: string): Promise<void>;

    onmessagearrived(message: string): Promise<any>;

    onsubscribetopic(topic: string): Promise<any>;

    onpublishmessage(message: string, destination: string): Promise<void>;

    onconnectionlost(response: string): Promise<any>;
}