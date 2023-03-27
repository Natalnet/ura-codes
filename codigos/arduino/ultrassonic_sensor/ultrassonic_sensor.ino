#include <NewPing.h>

#define tiggo 10
#define echo 9

NewPing sonar(tiggo, echo);

void setup() {
  Serial.begin(9600);
}

void loop() {
  int distInCentimeter = sonar.ping_cm();

  Serial.print(distInCentimeter);
  Serial.println("cm");

  delay(1000);
}
