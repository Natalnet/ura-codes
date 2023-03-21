import gc
import esp
import machine
import network
import json

from umqttsimple import MQTTClient

esp.osdebug(None)

gc.collect()

config = open("config.json")
load_config = json.load(config)

config.close()

ssid = load_config["ssid"]
ssid_password = load_config["ssid_password"]

mqtt_address = load_config["mqtt_address"]
mqtt_port = load_config["mqtt_port"]
mqtt_user = load_config["mqtt_user"]
mqtt_password = load_config["mqtt_password"]

client_id = ubinascii.hexlify(machine.unique_id())

wlan = network.WLAN(network.STA_IF)
wlan.active(True)

if not wlan.isconnected():

    print('Connecting to WiFi...')

    wlan.connect(ssid, ssid_password)

    while not wlan.isconnected():
        pass

    print('Connected network: ', wlan.ifconfig())

print('System initialized with success')

