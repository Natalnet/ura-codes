import time, machine, neopixel

pin = 23
num_pixels = 8

np = neopixel.NeoPixel(machine.pin(pin), num_pixels)

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

def rainbow(i):
    
    for k in range(255):
        
        for x in range(num_pixels):
            
            index = (x * 256 // num_pixels) + k
            
            np[x] = cycle(index & 255)
        
        np.write()

while True:

    rainbow(20)