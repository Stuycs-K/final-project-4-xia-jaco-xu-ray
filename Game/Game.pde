private Player[] playerlist;
private BoardSpace[] spaces;
private int[] buyPrices;
private int[] sellPrices;
private int[][] rentPrices;
private int distance;
private int activePlayer;
private boolean buyScreen;


void setup() {
  size(880, 880);
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
  
  Property brown1, brown2,
    lightBlue1, lightBlue2, lightBlue3,
    pink1, pink2, pink3,
    orange1, orange2, orange3,
    red1, red2, red3,
    yellow1, yellow2, yellow3,
    green1, green2, green3,
    darkBlue1, darkBlue2
    ;
  brown1 = new Street("Property", "Med  Ave", rentPrices[0][0], buyPrices[0], "Street", "brown", 0, 0);
  brown2 = new Street("Property", "Baltic Ave", rentPrices[0][0], buyPrices[0], "Street", "brown", 0, 0);

  lightBlue1 = new Street("Property", "Oriental Ave", rentPrices[1][0], buyPrices[1], "Street", "lightBlue", 0, 0);
  lightBlue2 = new Street("Property", "Vermont Ave", rentPrices[1][0], buyPrices[1], "Street", "lightBlue", 0, 0);
  lightBlue3 = new Street("Property", "Conn Ave", rentPrices[1][0], buyPrices[1], "Street", "lightBlue", 0, 0);

  pink1 = new Street("Property", "St. Charles Pl", rentPrices[2][0],buyPrices[2], "Street", "pink", 0, 0);
  pink2 = new Street("Property", "States Ave", rentPrices[2][0], buyPrices[2], "Street", "pink", 0, 0);
  pink3 = new Street("Property", "Virginia Ave", rentPrices[2][0], buyPrices[2], "Street", "pink", 0, 0);

  orange1 = new Street("Property", "St. James Pl", rentPrices[3][0], buyPrices[3], "Street", "orange", 0, 0);
  orange2 = new Street("Property", "Tenn Ave", rentPrices[3][0], buyPrices[3], "Street", "orange", 0, 0);
  orange3 = new Street("Property", "New York Ave", rentPrices[3][0], buyPrices[3], "Street", "orange", 0, 0);

  red1 = new Street("Property", "Kentucky Ave", rentPrices[4][0], buyPrices[4], "Street", "red", 0, 0);
  red2 = new Street("Property", "Indiana Ave", rentPrices[4][0], buyPrices[4], "Street", "red", 0, 0);
  red3 = new Street("Property", "Illinois Ave", rentPrices[4][0], buyPrices[4], "Street", "red", 0, 0);

  yellow1 = new Street("Property", "Atlantic Ave", rentPrices[5][0], buyPrices[5], "Street", "yellow", 0, 0);
  yellow2 = new Street("Property", "Ventnor Ave", rentPrices[5][0], buyPrices[5], "Street", "yellow", 0, 0);
  yellow3 = new Street("Property", "Marvin Gardens", rentPrices[5][0], buyPrices[5], "Street", "yellow", 0, 0);

  green1 = new Street("Property", "Pacific Ave", rentPrices[6][0], buyPrices[6], "Street", "green", 0, 0);
  green2 = new Street("Property", "NC Ave", rentPrices[6][0], buyPrices[6], "Street", "green", 0, 0);
  green3 = new Street("Property", "Penn Ave", rentPrices[6][0], buyPrices[6], "Street", "green", 0, 0);

  darkBlue1 = new Street("Property", "Park Place", rentPrices[7][0], buyPrices[7], "Street", "darkBlue", 0, 0);
  darkBlue2 = new Street("Property", "Boardwalk", rentPrices[7][0], buyPrices[7], "Street", "darkBlue", 0, 0);
  //public Property(String name, int rentPrice, int buyPrice, String type){
  spaces = new BoardSpace[]{ // total 40 spaces
    new BoardSpace("Go","Go"), brown1, empty(), brown2, new Tax("Tax","incomeTax", 200), empty(), lightBlue1, empty(), lightBlue2, lightBlue3,
    empty(), pink1, empty(), pink2, pink3, empty(), orange1, empty(), orange2, orange3,
    empty(), red1, empty(), red2, red3, empty(), yellow1, yellow2, empty(), yellow3,
    new BoardSpace("Jail","Jail"), green1, green2, empty(), green3, empty(), empty(), darkBlue1, new Tax("Tax","luxuryTax", 100), darkBlue2
  };
  drawBoard();
  //testing right now with 4 players
  playerlist = new Player[]{new Player("bob", false),new Player("timmy", false),new Player("billy", false),new Player("sd", false)};
  playerlist[0].setPos(1);
  playerlist[1].setPos(5);
  playerlist[2].setPos(6);
  playerlist[3].setPos(12);
  //drawPlayer();
  activePlayer = 0;
  distance = 0;
  buyScreen = true;
}

void draw() {
  drawBoard();
  drawPlayer();
  Player player = playerlist[activePlayer];
  if(!buyScreen){
    player.setStatus(true);
    run();
  }
  else{
    BoardSpace landedSpace = spaces[player.getPos()];
    boolean selected = false;
    if(selected||landedSpace.toString().equals("empty")){
      buyScreen = false;
      return;
    }
    int w = 300;
    int l = 400;
    noStroke();
    fill(255,255,255);
    rect((width-w)/2,(height-l)/2,w,l,20);
    String name = landedSpace.toString();
    fill(0);
    textSize(30);
    text(name,(width-(name.length()*14))/2,(height/2-165));
    stroke(0);
  }
}

void run() {
  Player player = playerlist[activePlayer];
  if(distance==0 && player.getStatus()){
    distance = dice();
  }
  if(distance!=0){
   player.setStatus(false);
   player.setPos(player.getPos()+1);
   if(!(player.getPos()<40)){
     player.setPos(0); 
   }
   delay(500);
   distance--;
  }
  if(distance==0 && !player.getStatus()){
    //do the action
    //activePlayer++;
    if(activePlayer>=playerlist.length){
      activePlayer=0;
    }
  }
}

int dice() {
  return (int)(Math.random() * 6) + (int)(Math.random() * 6) + 2;
}


void drawPlayer() {
  drawBoard();
  for(int i = 0; i<playerlist.length; i++){    
    Player player = playerlist[i];
    if(!player.isBankrupt()){ // is the player bankrupt?
      int sqLength = width/11;
      int pos = player.getPos();
      int x;
      int y;
      if(pos < 11){ // these if statements will just find the x and y pos on the board
        x = width/22 + (pos * sqLength);
        y = width/22;
      }
      else if(pos < 21){
        x = width - (sqLength/2);
        y = (sqLength/2) + (sqLength * (pos - 10));
      }
      else if(pos < 31){
        x = (width - (sqLength/2)) - (sqLength * (pos - 20));
        y = height - (sqLength/2);
      }
      else if(pos < 40){
        x = (sqLength/2);
        y = (height - (sqLength/2)) - (sqLength * (pos - 30));
      }
      else{
        System.out.println("not in bounds"); // just to run through for errors; can delete later or can keep
        return;
      }
      if(i == 0){ // set the color for the player
        fill(255,0,0);
        x-=5;
        y-=5;
      }
      if(i == 1){
        fill(0,255,0);
        x+=5;
        y-=5;
      }
      if(i == 2){
        fill(0,0,255);
        x+=5;
        y+=5;
      }
      if(i == 3){
        fill(255,255,0);
        x-=5;
        y+=5;
      }
      //add more colors for more players
      circle(x,y,10); // CAN EDIT LATER FOR DIFFERENT DESIGN "peg"
    }
  }
}

void drawBoard() {
  int spaceCounter = 0;
  for (int i = 0; i<width; i+=width/11) {
    fill(225);
    rect(i, 0, width/11, width/11);
    rect(0, i, width/11, width/11);
    rect(i, height-(width/11), width/11, width/11);
    rect(width-(width/11), i, width/11, width/11);
  }
  for (int i = 0; i<width; i+=width/11) {
    //if (!spaces[spaceCounter].toString().equals("empty")) {
      textSize(10);
      fill(0);
      text(spaces[spaceCounter].toString(), i+3, 15);
      text(spaces[spaceCounter+10].toString(), width-77, i+15);
    //}
    spaceCounter++;
  }
  spaceCounter=0;
  for (int i = width; i>0; i-=width/11) {
    //if (!spaces[spaceCounter].toString().equals("empty")) {
      textSize(10);
      fill(0);
      text(spaces[spaceCounter+19].toString(), i+3, height-65);
      text(spaces[spaceCounter+29].toString(), 3, i+15);
    //}
    spaceCounter++;
  }
  image(loadImage("logo.png"), width/2-250, height/2-100, 500, 200);

}

BoardSpace empty() {
  return new BoardSpace("empty","empty");
}
