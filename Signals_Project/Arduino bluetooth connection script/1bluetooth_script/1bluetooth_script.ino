/**
in aurdino uno , there is physical serial
which is 0 , 1 which you can access Directly through Serial class .

but sometimes we need to create our software serial port , so we will use :
**********
#include<SoftwareSerial.h>
const byte rxBlue = 11; // rx in bluetooth module .
const byte txBlue = 10; // tx in bluetooth module .
SoftwareSerial mySerial(txBlue, rxBlue); // Tx, Rx in bluetooth module .
**********
and inside setup we will use : 
**********
 // to make pin 11 is output in aurd , input in bluetooth mdoule
  pinMode(rxBlue, OUTPUT); // output in aurdino is input in bluetooth so we put rx with output
  pinMode(txBlue, INPUT);
**********
*/

#include<SoftwareSerial.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <Servo.h>


Servo servo_plastic;
Servo servo_cans;
  // create servo object to control a servo

// Serial3 Serial3(txCamera, rxCamera); // Tx, Rx in bluetooth module .
// const byte rxCamera = 39; // rx in bluetooth module .
// const byte txCamera = 38; // tx in bluetooth module .

void setup() {
  // to make pin 11 is output in aurd , input in bluetooth mdoule
  // pinMode(rxCamera, OUTPUT); // output in aurdino is input in bluetooth so we put rx with output
  // pinMode(txCamera, INPUT);
  /**
  begin my software serial
  */
  // Camera bluetooth on Serial 3 .
  Serial3.begin(9600);
  // Screen Bluetooth on Serial 2.
  Serial2.begin(9600);
  ////////// Servo init ///////////
  initServo();
  Serial3.println(F("Arduino here, command me!"));
}

void initServo(){
// plastic servo motor in attached on digital pin -> 3 .
servo_plastic.attach(3);
// cans servo motor in attached on digital pin -> 4 .
servo_cans.attach(4);
servo_plastic.write(0);
servo_cans.write(0);
}

String message="";

void open_plastic_hole(){
servo_plastic.write(90);                  // sets the servo position according to the scaled value
  delay(3000); 
  servo_plastic.write(0);    
}

void open_cans_hole(){
servo_cans.write(90);                  // sets the servo position according to the scaled value
delay(3000); 
servo_cans.write(0);  
}

// this method is used to get data in message and analyze it .
void split_coming_message(char* message, int* numTokens) {
  char** tokens = NULL;
  char* token = strtok(message, ",");
  int count = 0;
  while (token != NULL) {
    tokens = realloc(tokens, sizeof(char*) * (count + 1));
    tokens[count] = token;
    count++;
    token = strtok(NULL, ",");
  }
  *numTokens = count;
  /**
  *********************************
  *********************************
    * tokens is char[] that hold all variables that sent in message .
    ********************************
    ********************************
      atoi(tokens[0]) can be 1 / 2 
      1 mean this message sent to tablet .
      2 mean this message sent to camera .
      ********************************
    ********************************
    atoi(tokens[1]) can be only 1 :
    this mean camera detect plastic and open plastic hole .
      ********************************
    ********************************
    atoi(tokens[2]) can be only 1 :
    this mean camera detect cans and open cans hole .
  */
  int destination_device =atoi(tokens[0]);
  for(int i=0;i<3;i++){
    Serial3.println(tokens[i]);
  }
  // check the destination of the message .
  if(destination_device == 1) Serial3.println("Message Sent to tablet");
  else if(destination_device ==2) Serial3.println("Message Sent to Camera");
  // check plastic and cans signal to open or close .
  if(atoi(tokens[1])==1){
    Serial3.println("Open plastic hole");
    open_plastic_hole();
     // i make it here wait for 1 second for lower power consumbtion .
   // to not make arduino items power off and need to connect again .
    delay(1000);
  }
  if(atoi(tokens[2])==1){
    Serial3.println("open Cans hole");
    open_cans_hole();
   // i make it here wait for 1 second for lower power consumbtion .
   // to not make arduino items power off and need to connect again .
    delay(1000);
  }
}

void loop() { 
 while(Serial3.available()>0){  
   char message_in_char_array[25];
   char data = (char) Serial3.read();
   message +=data;
   if(data=='\n'){
     Serial2.println(message);
     for(int i =1;i<message.length()-1;i++){
       // to remove first double quotes from the message "1,0,1";
       message_in_char_array[i-1]=message.charAt(i);
     }
     split_coming_message(message_in_char_array,0);
     message="";
   }
 }
}

/**

To Check type of variable in C :

 if(sizeof(tokens[0])==sizeof(char))
    Serial3.println("char");
    else if(sizeof(tokens[0])==sizeof(int))
       Serial3.println("int");
    else if(sizeof(tokens[0])==sizeof(double))
        Serial3.println("double");

***/