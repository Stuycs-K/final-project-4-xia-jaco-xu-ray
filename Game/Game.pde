private Player[] playerlist;
private BoardSpace[] spaces;
private int[] buyPrices;
private int[] sellPrices;
private int[][] rentPrices;


void setup(){
  buyPrices = new int[]{60, 107, 147, 187, 227, 267, 307, 375};
  sellPrices = new int[]{30, 54, 74, 94, 114, 134, 154, 188};
  rentPrices = new int[][]{{3, 15, 45, 135, 240, 350}, 
                           {7, 33, 93, 280, 420, 567}, 
                           {11, 53, 160, 467, 650, 800}, 
                           {15, 73, 207, 567, 767, 967}, 
                           {19, 93, 267, 717, 892, 1067}, 
                           {23, 113, 340, 817, 992, 1167}, 
                           {27, 137, 410, 933, 1133, 1317}, 
                           {43, 188, 550, 1250, 1500, 1750}};
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
           lightBlue1,lightBlue2,
           pink1,pink2,pink3,
           orange1,orange2,orange3,
           red1,red2,red3,
           yellow1,yellow2,yellow3,
           green1,green2,green3,
           darkBlue1,darkBlue2,darkBlue3
           ;
   
  ;
  
  
}
