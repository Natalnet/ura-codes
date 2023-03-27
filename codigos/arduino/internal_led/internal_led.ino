/*
Void setup() apenas executará o código nele uma única vez ao ligar,
normalmente utilizado para declarar as portas.
Dica: O Arduino executa os comandos de cima pra baixo, quem vem acima é
executado primeiro
*/
void setup(){
  /* Determina a porta conectada e o modo de operação pros LEDs
     pinMode(Porta, modo);
     Define a porta 11 do led como saída
     modo --> IMPUT = entrada de dados | OUTPUT = saída de dados */
  pinMode(13, OUTPUT);
}//Fecha a função setup()

//void loop() irá executar em repetição infinita após a função void setup()
void loop(){
  //digitalWrite(porta, sinal);
  //Acende o led vermelho (sinal HIGH liga, LOW desliga)
  digitalWrite(13, HIGH);
    
  //Aguarda intervalo de tempo em milissegundos para a luz continuar ligada
  //delay(milisegundos);
  delay(1000);
    
  //Apaga o led
  //Acende o led (sinal HIGH liga, LOW desliga)
  //digitalWrite(porta, sinal);
  digitalWrite(13, LOW);
    
  //Aguarda intervalo de tempo em milissegundos
  //delay(milisegundos);
  delay(1000);
}//Fecha a função void loop()
