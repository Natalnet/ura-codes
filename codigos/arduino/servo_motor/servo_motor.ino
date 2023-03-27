#include <Servo.h> // Importando a biblioteca do Servo.
#define serv 6    // Definindo que a porta 6 para o servo.

Servo servo;  // Declarando o objeto do Servo em forma de variável "servo".

int posicao = 0; // Definindo a posição inicial do servo, como zero.

void setup(){

  servo.attach(serv);  // Registrando a porta do servo.

  Serial.begin(9600); // Iniciando a porta serial em 9600ms 

  servo.write(posicao); // Definindo a posição do servo como zero(Foi definido antes do setup) 
}

void loop(){
/*
  Usaremos um for para fazer o servo se mover.
*/

for ( posicao = 0 ; posicao < 180 ; posicao++){

  servo.write(posicao);
  
  delay(10);
}

delay(1000); 

//Voltando o servo a posição inicial. 

for( posicao = 180 ; posicao >= 0 ; posicao--){

  servo.write(posicao);

  delay(10);
}

}
