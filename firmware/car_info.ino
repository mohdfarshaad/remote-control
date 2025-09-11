// L298N Motor Driver Pins
int motor1_in1 = 8;   // Right motor A
int motor1_in2 = 9;
int motor2_in3 = 10;  // Left motor B
int motor2_in4 = 11;

void setup() {
  pinMode(motor1_in1, OUTPUT);
  pinMode(motor1_in2, OUTPUT);
  pinMode(motor2_in3, OUTPUT);
  pinMode(motor2_in4, OUTPUT);

  Serial.begin(9600); // HC-05 Bluetooth serial
}

void loop() {
  if (Serial.available()) {
    char cmd = Serial.read();

    switch (cmd) {
      case 'F': forward(); break;
      case 'B': backward(); break;
      case 'L': left(); break;
      case 'R': right(); break;
      case 'S': stopMotors(); break;
    }
  }
}

void forward() {
  digitalWrite(motor1_in1, HIGH);
  digitalWrite(motor1_in2, LOW);
  digitalWrite(motor2_in3, HIGH);
  digitalWrite(motor2_in4, LOW);
}

void backward() {
  digitalWrite(motor1_in1, LOW);
  digitalWrite(motor1_in2, HIGH);
  digitalWrite(motor2_in3, LOW);
  digitalWrite(motor2_in4, HIGH);
}

void left() {
  digitalWrite(motor1_in1, LOW);
  digitalWrite(motor1_in2, HIGH);
  digitalWrite(motor2_in3, HIGH);
  digitalWrite(motor2_in4, LOW);
}

void right() {
  digitalWrite(motor1_in1, HIGH);
  digitalWrite(motor1_in2, LOW);
  digitalWrite(motor2_in3, LOW);
  digitalWrite(motor2_in4, HIGH);
}

void stopMotors() {
  digitalWrite(motor1_in1, LOW);
  digitalWrite(motor1_in2, LOW);
  digitalWrite(motor2_in3, LOW);
  digitalWrite(motor2_in4, LOW);
}
