import mqtt from 'mqtt'
import dotenv from 'dotenv'

const client = mqtt.connect(process.env.MQTT_ADDRESS);

const subTopic = process.env.MQTT_SUB_TOPIC;

client.on('connect', () => {
    client.subscribe(subTopic);
});

client.on('message', function(topic, msg) {
    console.log(msg.toString());
});