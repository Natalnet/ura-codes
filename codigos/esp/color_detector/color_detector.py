from machine import Pin, ADC

import time, neopixel

# VARIÁVEIS

lastRead = 0
readInterval = 1

pin_Neopixel = 23
num_of_pixel = 8

pin_ldr = 33

minR = 0
maxR = 0
minG = 0
maxG = 0
minB = 0
maxB = 0

# COMPONENTES

np = neopixel.NeoPixel(Pin(pin_Neopixel), num_of_pixel)

ldr = ADC(Pin(pin_ldr))
ldr.atten(ADC.ATTN_11DB)

# CORES | nota: cores limitadas as que terão uso

RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0 , 255)
WHITE = (255, 255, 255)

# ARRAYS

red_vals = []
green_vals = []
blue_vals = []

# FUNÇÕES 1- BUSCADOR 2- SINALIZADOR 3,4,5 - ARMAZENAMENTO
def minor(ldr_val, minV):
	
def blinkW(color): 
    for i in range(3)
        np.fill(color)
        np.show()
        time.sleep(1)
        np.fill((0, 0, 0))
        np.show()
        time.sleep(1)

def calR():
    tempo = 10
    t0 = time.monotonic()
    np.fill(WHITE)
    np.show()
    while time.monotonic() - t0 < tempo:
        ldr_val = ldr.read()
        if(time.time() - lastRead) >= readInterval:
            print(ldr_val)
            red_vals.append(ldr_val)
            with open('redval.json', 'w') as f:
                ujson.dump(red_vals, f)
    

def calG():
    tempo = 10
    t0 = time.monotonic()
    np.fill(WHITE)
    np.show()
    while time.monotonic() - t0 < tempo:
        ldr_val = ldr.read()
        if(time.time() - lastRead) >= readInterval:
            print(ldr_val)
            red_vals.append(ldr_val)
            with open('greenval.json', 'w') as f:
                ujson.dump(red_vals, f)

def calB():
    tempo = 10
    t0 = time.monotonic()
    np.fill(WHITE)
    np.show()
    while time.monotonic() - t0 < tempo:
        ldr_val = ldr.read()
        if(time.time() - lastRead) >= readInterval:
            print(ldr_val)
            red_vals.append(ldr_val)
            with open('blueval.json', 'w') as f:
                ujson.dump(red_vals, f)
                
# SETUP? KKKK

print("calibração")
time.sleep(5)
blinkW(RED)
calR()
time.sleep(5)
blinkW(GREEN)
calG()
time.sleep(5)
blinkW(BLUE)
time.sleeep(5)

# LOOP

while True:
    
    ldr_val = ldr.read()
    if(time.time() - lastRead) >= readInterval:
        print(ldr_val)
        np.fill(WHITE)
        np.show()
		
		if ldr_val >= minR and ldr_val <= maxR:
			print("Vermelho")
		elif ldr_val >= minG and ldr_val <= maxG:
			print("Verde")
		elif ldr_val >= minB and ldr_val <= maxB:
			print("verde")
		else print("Fora do intervalo de leitura")
        
        lastRead = time.time()
 
