/*
Neste exemplo, ao invés de colocar diretamente a porta no pinMode(porta, modo)
será utilizado uma variável para informar a porta utiizada.
*/

//Declara que a variável -buzzer- será responsável por representar a porta 7.
int buzzer = 7; 

void setup(){
  
  /*
  Declaramos que a porta 7 (representada pela variável buzzer)
  estará trabalhando no modo OUTPUT (saída).
  */
  
  pinMode(buzzer, OUTPUT); 

}

void loop(){
  /*
  Função tone(tom) é nativa do arduino.
  Uma função nativa é quando não há necessidade de baixar e importar
  um arquivo novo, como do ultrassom que veremos no futuro.

  Com ela declaramos respectivamente a porta (usando a variável buzzer),
  a frequência em Hertz e o tempo em milisegundos que o som irá durar.
  
  Frequência das notas:
  Dó - 262 Hz
  Ré - 294 Hz
  Mi - 330 Hz
  Fá - 349 Hz
  Sol - 392 Hz
  Lá - 440 Hz
  Si - 494 Hz
  #Dó - 528 Hz
  */
  tone(buzzer, 50, 1000);

  // Espera 3 segundos para o buzzer tocar de novo.
  delay(3000);
}
