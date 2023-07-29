#include <Adafruit_NeoPixel.h>  //Bibilioteca para usar o neopixel

//Declarando pinos
#define PINNP 3
#define PINLDR A0

//Iniciando neopixel
Adafruit_NeoPixel led = Adafruit_NeoPixel(1, PINNP, NEO_RGB + NEO_KHZ800);

//Declarando variáveis
int leitura = 0;
int maxR = 0, minR = 2000;
int maxG = 0, minG = 2000;
int maxB = 0, minB = 2000;

void setup() {
  //Preparando sensores
  led.begin();
  led.show();
  Serial.begin(9600);

  //Calibrando Verde
  led.setPixelColor(0, 255, 0, 0); //Indicando que a cor Verde será calibrada
  led.show();
  delay(1500);
  led.setPixelColor(0, 255, 255, 255); 
  led.show();
  calibraLDR(minG, maxG);
  delay(1500);
  //Calibrando Vermelho
  led.setPixelColor(0, 0, 255, 0); //Indicando que a cor Vermelho será calibrada
  led.show();
  delay(1500);
  led.setPixelColor(0, 255, 255, 255); 
  led.show();
  calibraLDR(minR, maxR);
  delay(1500);
  //Calibrando azul
  led.setPixelColor(0, 0, 0, 255); //Indicando que a cor azul será calibrada
  led.show();
  delay(1500);
  led.setPixelColor(0, 255, 255, 255); 
  led.show();
  calibraLDR(minB, maxB);
  delay(1500);
}

void loop() {
  //
  
  //inciando leitura
  leitura = analogRead(PINLDR);

  Serial.println(leitura);

  //Detectando cores
  if(leitura < maxR && leitura > minR){
  Serial.println("Vermelho");
  
  }else if(leitura < maxG && leitura > minR){
  Serial.println("Verde");
  
  }else if(leitura < maxB && leitura > minB){
  Serial.println("Azul");
  }

  delay(500);

}

void calibraLDR(int &minVal, int &maxVal){
  minVal = 2000;
  maxVal = 0;
  
  for (int i = 0; i < 100; i++) {

    leitura = analogRead(PINLDR);
    
    if (leitura < minVal) { //verificando se a leitua é menor que o valor atual
      minVal = leitura; 
    }

    if (leitura > maxVal) { //Verificando se a leitura é maior que o valor atual
      maxVal = leitura;
    }

    delay(100);
  }
}