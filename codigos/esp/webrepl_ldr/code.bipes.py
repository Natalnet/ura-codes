from machine import ADC
from machine import Pin
import time

adc33=ADC(Pin(33))
adc33.atten(ADC.ATTN_11DB)
adc33.width(ADC.WIDTH_11BIT)


while True:
  print(adc33.read())
  time.sleep(1)
