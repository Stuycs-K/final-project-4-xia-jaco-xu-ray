Board mainBoard;

void setup() {
  size(880, 880);
  mainBoard = new Board();
}

void draw() {
  mainBoard.draw();
}

void keyPressed(){
  if (key=='z') {
   mainBoard.loseMoney(); 
  }
  
  if (key=='t') {
   mainBoard.teleport();
  }
  
  if (key=='d') {
   mainBoard.disrupt(); 
   mainBoard.speedIncrease();
  }
  
  if (key=='j') {
   mainBoard.jailDisrupt(); 
  }
  
  if (key=='e'){
    mainBoard.taxDisruption();
    mainBoard.speedIncrease();
  }
  
  if(key=='q'){
    mainBoard.speedIncrease();
    mainBoard.onePlayerJail();
    delay(400);
  }
  
  if(key=='w'){
    mainBoard.multipleProperty();

    //delay(400);
  }
  
  if(key=='r'){
    mainBoard = new Board();
  }
  
  if(key=='+'){
    mainBoard.speedIncrease();
  }
  
}
