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

def publishMessage(topic, message): # Método para publicarmos uma mensagem no MQTT
    client.publish(topic, message)

try:
    client = connect_and_subscribe()
except OSError as e:
    restart_and_reconnect()

while True:

    if (time.time() - lastMsg) >= msgDelay: # Enviando a cada 5s uma mensagem para o tópico escolhido
        publishMessage(b'teste', 'Hello world') # Específicamos o nosso tópico em b'<string>' aqui e enviamos a mensagem
