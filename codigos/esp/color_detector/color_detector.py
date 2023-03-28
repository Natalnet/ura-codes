from machine import Pin, ADC

import time, neopixel

# Variáveis

lastRead = 0
readInterval = 1

pin_Neopixel = 23
num_of_pixels = 8

pin_ldr = 33

# Componentes

np = neopixel.NeoPixel(Pin(pin_Neopixel), num_of_pixels)

ldr = ADC(Pin(pin_ldr))
ldr.atten(ADC.ATTN_11DB)

# Cores padrões

RED = (255, 0, 0)
YELLOW = (255, 150, 0)
GREEN = (0, 255, 0)
CYAN = (0, 255, 255)
BLUE = (0, 0, 255)
PURPLE = (180, 0, 255)
WHITE = (255, 255, 255)

# Arrays

red_vals = []
green_vals = []
blue_vals = []

while True:
    
    ldr_val = ldr.read()
    
    if (time.time() - lastRead) >= readInterval:
        
        print(ldr_val)
        
        np.fill(WHITE)
        np.write()
        
        if (ldr_val > 3480 and ldr_val < 3600):
            print('Cor vermelha')
            red_vals.append(ldr_val)
        elif (ldr_val > 3100 and ldr_val < 3200):
            print('Cor verde')
            green_vals.append(ldr_val)
        elif (ldr_val > 3000 and ldr_val < 3099):
            print('Cor azul')
            blue_vals.append(ldr_val)
            
        lastRead = time.time()
