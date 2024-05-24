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
  Property brown1,brown2,
           lightBlue1,lightBlue2,lightBlue3,
           pink1,pink2,pink3,
           orange1,orange2,orange3,
           red1,red2,red3,
           yellow1,yellow2,yellow3,
           green1,green2,green3,
           darkBlue1,darkBlue2
           ;
//Street(String name, int rentPrice, int buyPrice, String type, String col, int houses, int hotels){
  brown1 = new Property("Mediterranean Avenue", 3, 60, "Street", "brown", 0, 0);
  brown2 = new Property("Baltic Avenue", 3, 60, "Street", "brown", 0, 0);
  lightBlue1 = new Property("Baltic Avenue", 3, 60, "Street", "brown", 0, 0);
  spaces = new BoardSpace[]{
    
   
  ;
  
  
}
