import time, machine, neopixel

pin = 23
num_pixels = 8

np = neopixel.NeoPixel(machine.Pin(pin), num_pixels)

RED = (255, 0, 0)
YELLOW = (255, 150, 0)
GREEN = (0, 255, 0)
CYAN = (0, 255, 255)
BLUE = (0, 0, 255)
PURPLE = (180, 0, 255)

def cycle(pos):
    
    if pos < 0 or pos > 255:
        return (0, 0, 0)
    
    if pos < 85:
        return (255 - pos * 3, pos * 3, 0)
    
    if pos < 170:
        pos -= 85
        return (0, 255 - pos * 3, pos * 3)
    
    pos -= 170
    
    return (pos * 3, 0, 255 - pos * 3)

def chasing(color, i):
    
    for x in range(num_pixels):
        
        np[x] = color
        
        time.sleep(i)
        
        np.write()
        
        time.sleep(0.5)

def rainbow(i):
    
    for k in range(255):
        
        for x in range(num_pixels):
            
            index = (x * 256 // num_pixels) + k
            
            np[x] = cycle(index & 255)
        
        np.write()

while True:
    
    np.fill(RED)
    np.write()
    
    time.sleep(1)
    
    np.fill(GREEN)
    np.write()
    
    time.sleep(1)
    
    np.fill(BLUE)
    
    time.sleep(1)
    
    chasing(RED, 0.1)
    chasing(YELLOW, 0.1)
    chasing(GREEN, 0.1)
    chasing(CYAN, 0.1)
    chasing(BLUE, 0.1)
    chasing(PURPLE, 0.1)
    
    rainbow(0)