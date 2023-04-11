import * as mqttv5 from 'paho-mqtt'

export interface MqttInterface {

    initialize(): Promise<void>;

    callback(): Promise<void>;
}