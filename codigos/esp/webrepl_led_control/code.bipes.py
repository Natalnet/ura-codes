from machine import Pin
import time

def gpio_set(pin,value):
  if value >= 1:
    Pin(pin, Pin.OUT).on()
  else:
    Pin(pin, Pin.OUT).off()


while True:
  gpio_set((2), True)
  time.sleep(1)
  gpio_set((2), False)
  time.sleep(1)
  gpio_set((2), True)
