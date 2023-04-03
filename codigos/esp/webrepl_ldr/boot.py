import esp, webrepl, json, gc, network

esp.osdebug(None)

gc.collect()

config = open('configuration/config.json')
config_file = json.load(config)
config.close()

ssid = config_file['ssid']
ssid_password = config_file['password']

station = network.WLAN(network.STA_IF)
station.active(True)

if not station.isconnected():

    print('Connecting to WiFi')

    station.connect(ssid, ssid_password)

    while not station.isconnected():
        pass

    print(f'Connected with success to {ssid}. IP Config: {station.ifconfig()}')

webrepl.start()
