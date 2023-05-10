#include <L9110H.h>
#include <Arduino.h>

L9110H robot;

void setup() {

  Serial.begin(9600);
}

void loop() {
  
  robot.forward(255, 1000, false);

  delay(5000);

  robot.right(255, 50, false);

  delay(30);;

  robot.forward(255, 1000, false);

  delay(5000);

  robot.right(255, 50, false);

  delay(30);

  robot.forward(255, 1000, false);

  delay(30);

  robot.right(255, 50, false);

  robot.stop();
}

