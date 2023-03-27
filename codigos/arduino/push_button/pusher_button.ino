//Declaramos as variável -botao- e -led- para referenciar as portas 7 e 10.
int botao = 7;
int led = 10;

/*
Nessa váriavel faremos a leitura do estado do botão. Isto é, se está 
sendo pressionado ou não. Declaramos e damos início a ela (damos um 
valor inícial).
*/
int estado_botao = 0;

void setup(){
  //Declaramos que o botão irá ser do tipo entrada.
  pinMode(botao, INPUT);
  //Led usará a porta do tipo saída. 
  pinMode(led, OUTPUT);
}

void loop(){
  /* 
  Usando o digitalRead fazemos uma leitura binária do botão.
  Ele retornará 1 (HIGH, sinal alto, verdade) se o botão estiver
  sendo pressionado e 0 (LOW, sinal baixo, falso) se não estiver. 
  */
  estado_botao = digitalRead(botao);
  
  //Usando a condição if verificamos se o botão está sendo apertado
  //Se estiver sendo apertado ele acende o led
  if(estado_botao == HIGH){
    digitalWrite(led, HIGH);
  }
  //Senão ele manterá o LED apagado
  else{
    digitalWrite(led, LOW);   
  }
}
