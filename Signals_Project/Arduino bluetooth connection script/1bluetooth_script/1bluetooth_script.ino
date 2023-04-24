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
const byte rxBlue = 11; // rx in bluetooth module .
const byte txBlue = 10; // tx in bluetooth module .
SoftwareSerial cameraSerial(txBlue, rxBlue); // Tx, Rx in bluetooth module .

void setup() {
  // to make pin 11 is output in aurd , input in bluetooth mdoule
  pinMode(rxBlue, OUTPUT); // output in aurdino is input in bluetooth so we put rx with output
  pinMode(txBlue, INPUT);
  /**
  begin my software serial
  */
  cameraSerial.begin(9600);
  Serial.begin(9600);
  ////////// Servo init ///////////
  initServo();
  cameraSerial.println("Start application");
}

void initServo(){
// plastic servo motor in attached on digital pin -> 9
servo_plastic.attach(9);
servo_cans.attach(8);
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
    cameraSerial.println(atoi(tokens[i]));
    delay(100);
  }
  // check the destination of the message .
  if(destination_device == 1) cameraSerial.write("Message Sent to tablet \n");
  else if(destination_device ==2) cameraSerial.write("Message Sent to Camera \n");
  // check plastic and cans signal to open or close .
  if(atoi(tokens[1])==1){
    cameraSerial.write("Open plastic hole \n");
    open_plastic_hole();
     // i make it here wait for 1 second for lower power consumbtion .
   // to not make arduino items power off and need to connect again .
    delay(1000);
  }
  if(atoi(tokens[2])==1){
    cameraSerial.write("open Cans hole \n");
    open_cans_hole();
   // i make it here wait for 1 second for lower power consumbtion .
   // to not make arduino items power off and need to connect again .
    delay(1000);
  }
}


  String recievedMessage="";
  int temp1=0;
 char message_in_char_array[25]={};
void loop() {
 while(cameraSerial.available()>0){
   temp1=1;
   char data = (char) cameraSerial.read();
   message += data;
   recievedMessage += String(data);
   if(data=='\n'){
     for(int i =1;i<message.length()-1;i++){
       message_in_char_array[i-1]=message.charAt(i);
     }
     split_coming_message(message_in_char_array,0); 
   }
 }
 delay(1000);
 if(temp1==1){
   cameraSerial.write("message received successfully\n\n");
   delay(100);
   cameraSerial.println("Recieved Message : "+recievedMessage);
   recievedMessage="";
 }
 message = "";
 message_in_char_array[25]={};
 recievedMessage="";
}


// this method is used to get comming message
// convert it to bytes and send it back again
// to sender .

// unsigned char* comingMessageToBytes(char *str) {
//     // Get the length of the string
//     size_t len = strlen(str);

//     // Allocate memory for the byte array
//     unsigned char *bytes = (unsigned char*) malloc(len * sizeof(unsigned char));

//     // Convert each character in the string to a byte
//     for (size_t i = 0; i < len; i++) {
//         bytes[i] = (unsigned char) str[i];
//     }

//     return bytes;
// }



/**
To Check type of variable in C :
 if(sizeof(tokens[0])==sizeof(char))
    cameraSerial.println("char");
    else if(sizeof(tokens[0])==sizeof(int))
       cameraSerial.println("int");
    else if(sizeof(tokens[0])==sizeof(double))
        cameraSerial.println("double");
***/