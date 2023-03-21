from umqttsimple import MQTTClient

from time import sleep_ms

import time

msgDelay = 5
lastMsg = 0

def connect():
    global client_id, mqtt_address, mqtt_port, mqtt_user, mqtt_password

    client = MQTTClient(client_id, mqtt_address, mqtt_port, mqtt_user, mqtt_password)

    client.connect()

    return client

def restart_and_reconnect():

    time.sleep(10)

    machine.reset()

def publishMessage(topic, message):
    client.publish(topic, message)

try:
    client = connect_and_subscribe()
except OSError as e:
    restart_and_reconnect()

while True:

    if (time.time() - lastMsg) >= msgDelay:
        publishMessage('teste', b'Hello world')
