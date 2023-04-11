import mqtt from 'mqtt'
import dotenv from 'dotenv'

const client = mqtt.connect(process.env.MQTT_ADDRESS);

client.on('connect', () => {
    console.log('Publisher client online');
});