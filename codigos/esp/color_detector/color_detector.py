from machine import Pin, ADC
import time
import neopixel
import json

# VARIÁVEIS

lastRead = 0
readInterval = 1

pin_Neopixel = 23
num_of_pixels = 8

pin_ldr = 33

minR = 0
maxR = 0
minG = 0
maxG = 0
minB = 0
maxB = 0

#with open('data.json', 'w') as f:

# COMPONENTES

np = neopixel.NeoPixel(Pin(pin_Neopixel), num_of_pixels)

ldr = ADC(Pin(pin_ldr))
ldr.atten(ADC.ATTN_11DB)

# CORES | nota: cores limitadas as que terão uso

RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)
WHITE = (255, 255, 255)

# ARRAYS

red_vals = []
green_vals = []
blue_vals = []

# FUNÇÕES 1- BUSCADOR 2- SINALIZADOR 3,4,5 - ARMAZENAMENTO

def maxmin():
    with open('data.json', 'r') as f:
        data = json.load(f)
    global minR, maxR
    minR, maxR = min(data[0]), max(data[0])
    global minG, maxG
    minG, maxG = min(data[1]), max(data[1])
    global minB, maxB
    minB, maxB = min(data[2]), max(data[2])
    return (minR, maxR), (minG, maxG), (minB, maxB)


def blinkW(color):
    for i in range(3):
        np.fill(color)
        np.write()
        time.sleep(1)
        np.fill((0, 0, 0))
        np.write()
        time.sleep(1)
    np.fill((0, 0, 0))
    np.write()

def calR():
    global red_vals
    tempo = 10
    t0 = time.time()
    np.fill(WHITE)
    np.write()
    with open('data.json', 'r') as f:
        red_vals = json.load(f)
    while time.time() - t0 < tempo:
        ldr_val = ldr.read()
        if (time.time() - lastRead) >= readInterval:
            print(ldr_val)
            red_vals.append(ldr_val)
            with open('data.json', 'w') as f:
                json.dump(red_vals, f)
    np.fill((0, 0, 0))
    np.write()

def calG():
    global green_vals
    tempo = 10
    t0 = time.time()
    np.fill(WHITE)
    np.write()
    with open('data.json', 'r') as f:
        green_vals = json.load(f)
    while time.time() - t0 < tempo:
        ldr_val = ldr.read()
        if (time.time() - lastRead) >= readInterval:
            print(ldr_val)
            green_vals.append(ldr_val)
            with open('data.json', 'w') as f:
                json.dump(green_vals, f)
    np.fill((0, 0, 0))
    np.write()


def calB():
    global blue_vals
    tempo = 10
    t0 = time.time()
    np.fill(WHITE)
    np.write()
    with open('data.json', 'r') as f:
        blue_vals = json.load(f)
    while time.time() - t0 < tempo:
        ldr_val = ldr.read()
        if (time.time() - lastRead) >= readInterval:
            print(ldr_val)
            blue_vals.append(ldr_val)
            with open('data.json', 'w') as f:
                json.dump(blue_vals, f)
    np.fill((0, 0, 0))
    np.write()


# SETUP? KKKK


print("calibração")
time.sleep(3)
blinkW(RED)
print("calibrando vermelho")
calR()
time.sleep(3)
blinkW(GREEN)
print("calibrando verde")
calG()
time.sleep(3)
blinkW(BLUE)
print("calibrando azul")
calB()
minR, maxR, minG, maxG, minB, maxB = maxmin()
time.sleep(5)

# LOOP

while True:

    ldr_val = ldr.read()
    if (time.time() - lastRead) >= readInterval:
        print(ldr_val)
        np.fill(WHITE)
        np.write()
        if ldr_val >= minR and ldr_val <= maxR:
            print("Vermelho")
        elif ldr_val >= minG and ldr_val <= maxG:
            print("Verde")
        elif ldr_val >= minB and ldr_val <= maxB:
            print("verde")
        else: 
            print("Fora do intervalo de leitura")
            
        lastRead = time.time()
