private Player[] playerlist;
private BoardSpace[] spaces;
private int[] buyPrices;
private int[] sellPrices;
private int[][] rentPrices;


void setup(){
  buyPrices = new int[]{60, 107, 147, 187, 227, 267, 307, 375};
  sellPrices = new int[]{30, 54, 74, 94, 114, 134, 154, 188};
  rentPrices = new int[][]{{3, 15, 45, 135, 240, 350}};
}

void draw(){

}

void run(){
  
}

int dice(){
  //return (int)(Math.random() * 11) + 2; // arent the chances for each number different because there are various ways of getting like 7 but little chance of getting 2?
  return (int)(Math.random() * 6) + (int)(Math.random() * 6) + 2;
}

void drawPlayer(){
  
}

void drawBoard(){
  
}
