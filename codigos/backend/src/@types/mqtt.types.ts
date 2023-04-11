import * as mqttv5 from 'paho-mqtt'

export interface MqttInterface {

    initialize(): Promise<void>;

    getClient(): Promise<mqttv5.Client>;

    callback(payload: string): Promise<void>;

    onmessagearrived(message: string): Promise<any>;

    onconnectionlost(response: string): Promise<any>;
}