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
  }
}
