int pot = A3; // Definimos a entrada analogica do nosso circuito.
int valor_pot = 0; // Definimos o valor inicial do potenciometro. 
int serv = 8; // Definimos uma porta para o servo.
int posicao = 0; // Definimos que a posição do servo é 0.

#include <Servo.h> // Incluimos a biblioteca do servo.
Servo servo // Criamos uma variavel do tipo servo.

void setup(){

//O potenciometro vai recebr um valor, por isso ele é uma entrada(INPUT).
pinMode(pot, INPUT); 

//Registrando a porta do servo.
servo.attach(serv);

//Definindo o angulo em que o servo se encontra.
servo.write(posicao);

//Utilizamos o Serial.begin para visualizar o que o potenciometro esta enviando para o arduino
Serial.begin(9600);
}

void loop(){

valor_pot = analogRead(pot);

//Criamos uma variável do tipo "byte" para armazenar valores numéricos de 8-bit sem sinal, de 0 a 255
byte angulo = map(valor_pot, 0, 1023, 0 , 179);
//Limitamos a leitura a 179, pois o servo só consegue atingir ângulos menores que 180 graus

//Imprime o valor do potênciometro
Serial.print("Valor do potênciometro: ")
Serial.println(valor_pot);

//Armazena o valor do angulo, 
servo.write(angulo);

// Imprime na tela em qual ângulo o servo está. 
Serial.print("Angulo: ");
Serial.println(angulo);

}
