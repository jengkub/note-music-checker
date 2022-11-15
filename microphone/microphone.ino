#define analogMin 521
#define analogMax 525
int analogAverage = (analogMin+analogMax)/2; //ไม่เอาทศนิยม

void setup() {
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  int sensorValue = analogRead(A0);
  
  if(sensorValue >= analogMin && sensorValue <= analogMax){
    sensorValue = analogAverage;
  }
  
  Serial.println(sensorValue);
}
