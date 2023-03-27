int buzzer = 6;
int button = 7;

int estado_botao = 0;

void setup(){
  
  pinMode(buzzer, OUTPUT);
  pinMode(button, INPUT);
  
}

void loop(){
  
  estado_botao = digitalRead(button);
  
  /* 
  
  Enquanto o botão estiver sendo pressionado, o buzzer mudará o som
  Que ele emitirá.
  
  */
  
  if(estado_botao == HIGH) {
  
  /* 
  
  Usando a estrutura de repetição for() conseguimos mudar a frequência
  constantemente, assim podemos fazer muita variações de sons.
  
  Podemos mudar a frequência inicial ou o aumento que está terá a cada loop.
  
  */
    
  
  for(int freq = 20; freq < 2000; freq += 10) {
   
    tone(buzzer, freq, 50);
    
  }
  /* 
     O som do buzzer começou com uma frequência de 20hertz
     E foi aumentando de 10 em 10, até atingir uma frequência de 2000   
  */
    
         }
}
