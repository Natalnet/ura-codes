from umqttsimple import MQTTClient

from time import sleep_ms

import time

msgDelay = 5
lastMsg = 0

topic_sub = b'teste' # Criando variável do canal sempre em bytes b'<string>'

def connect():
    global client_id, mqtt_address, mqtt_port, mqtt_user, mqtt_password

    client = MQTTClient(client_id, mqtt_address, mqtt_port, mqtt_user, mqtt_password)

    client.connect()
    client.set_callback(sub_cb) # Registrando o sub_cb
    client.subscribe(topic_sub) # Indicando ao client que devemos escutar esse canal 

    return client

def restart_and_reconnect():

    time.sleep(10)

    machine.reset()

def sub_cb(topic, msg): # Filtrando as informações presentes dentro do tópico, aqui poderemos filtrar todo e qualquer valor enviado.

    if topic == topic_sub and msg == b'Hello world': # Verificando se o tópico no sub_cb é o registro pelo client e se a mensagem Hello World é recebida
        print(';)') # Caso seja, vamos imprimir uma carinha feliz, indicando que está tudo certo

try:
    client = connect_and_subscribe()
except OSError as e:
    restart_and_reconnect()

while True:

    client.check_msg() # Solicitando que o client possa verificar se há mensagens pendentes na fila de envio
