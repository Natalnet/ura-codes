from machine import Pin, ADC

import time, neopixel

lastRead = 0
readInterval = 1
 
pin_Neopixel = 23
num_of_pixels = 8

pin_ldr = 33

np = neopixel.NeoPixel(Pin(pin_Neopixel), num_of_pixels)
ldr = ADC(Pin(pin_ldr)) 

ldr.atten(ADC.ATTN_11DB)

RED = (255, 0, 0)
YELLOW = (255, 150, 0)
GREEN = (0, 255, 0)
CYAN = (0, 255, 255)
BLUE = (0, 0, 255)
PURPLE = (180, 0, 255)
WHITE = (255, 255, 255)

red_vals = []
green_vals = []
blue_vals = []

v = 0
while True:
    v = input('Digite qual cor voce deseja calibrar (1 = Vermelho; 2 = Verde; 3 = Azul):  ')
    if(v == 1):
        ldr_val = ldr.read()
        if (time.time() - lastRead) >= readInterval:
            print(ldr_val)
            red_vals.append(ldr_val)
            np.fill(WHITE)
            np.write()
            lastRead = time.time()
    elif(v==2):
        ldr_val = ldr.read()
        if (time.time() - lastRead) >= readInterval:
            print(ldr_val)
            green_vals.append(ldr_val)
            np.fill(WHITE)
            np.write()
            lastRead = time.time()
    elif(v==3):
        ldr_val = ldr.read()
        if (time.time() - lastRead) >= readInterval:
            print(ldr_val)
            blue_vals.append(ldr_val)
            np.fill(WHITE)
            np.write()
            lastRead = time.time()
    else:
        print('Esse valor não remete a nenhuma cor correspondente')
        continue
    
        
        

