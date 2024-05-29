class Board{
  private ArrayList<Player> playerlist;
  private BoardSpace[] spaces;
  private int[] buyPrices;
  private int[] sellPrices;
  private int[][] rentPrices;
  private int distance;
  private int sdist;
  private int activePlayer;
  private boolean buyScreen;
  private boolean startScreen;
  
  Board(){
    //Initialize prices of the properties
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
    
    //Initialize properties
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

    //spaces array intialization
    spaces = new BoardSpace[]{ // total 40 spaces
      new BoardSpace("Go","Go"), brown1, empty(), brown2, new Tax("Tax","Income Tax", 200), empty(), lightBlue1, empty(), lightBlue2, lightBlue3,
      empty(), pink1, empty(), pink2, pink3, empty(), orange1, empty(), orange2, orange3,
      empty(), red1, empty(), red2, red3, empty(), yellow1, yellow2, empty(), yellow3,
      new BoardSpace("Jail","Jail"), green1, green2, empty(), green3, empty(), empty(), darkBlue1, new Tax("Tax","Luxury Tax", 100), darkBlue2
    };
    
    // Initialize other fields
    drawBoard();
    playerlist = new ArrayList<Player>();
    activePlayer = 0;
    distance = 0;
    buyScreen = false;
    startScreen = true;
  }
  
  void draw() {
    if(startScreen&&!keyPressed){
     String startPrompt = "How many players do you want? (2-4)";
     textSize(30);
     fill(0);
     text(startPrompt,(width-startPrompt.length()*19.5),200);
     return;
    }
    else if(startScreen&&keyPressed){
      if(key=='2'){
          playerlist.add(new Player("Player 1", false));
          playerlist.add(new Player("Player 2", false));
          startScreen = false;
      }
      else if(key=='3'){
          playerlist.add(new Player("Player 1", false));
          playerlist.add(new Player("Player 2", false));
          playerlist.add(new Player("Player 3", false));
          startScreen = false;
      }
      else if(key=='4'){
          playerlist.add(new Player("Player 1", false));
          playerlist.add(new Player("Player 2", false));
          playerlist.add(new Player("Player 3", false));
          playerlist.add(new Player("Player 4", false));
          startScreen = false;
      }
      return;
    }
    
    if(activePlayer>=playerlist.size()){
      activePlayer=0;
    }
    Player player = playerlist.get(activePlayer);
    drawBoard();
    run(buyScreen, player);
    drawPlayer();
  }
  
  void run(boolean showBuyScreen, Player player) {
    if (!showBuyScreen) {
      player.setStatus(true);
      if(distance==0){
        distance = dice();
        sdist = distance;
        return;
      }
      if(distance!=0){
       textSize(20);
       fill(0);
       text(player.getName()+" rolled a "+sdist, width/11+20, height - (height/11) - 10);
       player.setStatus(false);
       player.setPos(player.getPos()+1);
       if(!(player.getPos()<40)){
         player.setPos(0); 
         player.changeBalance(200);
       }
       delay(500);
       distance--;
      }
      if(distance==0 && !player.getStatus()){
        buyScreen = true;
      }
    }
    else {
      BoardSpace landedSpace = spaces[player.getPos()];
      boolean selected = false;
      if(selected||landedSpace.toString().equals("empty")){
        buyScreen = false;
        activePlayer++;
        return; //is this necessary since void function - ray [DELETE COMMENT IF SEEN]
      }
      determinePrompt(landedSpace,player);
      
    }
  }
  
  void determinePrompt(BoardSpace landedSpace, Player player){
     if (landedSpace.getType().equals("Street")) {
        Street lanSpace = (Street) landedSpace;
        if (!lanSpace.isOccupied()) {
          String body1 = "Purchase for $"+lanSpace.buyPrice()+"?";
          String body2 = "Press y for yes, n for no.";
          cardPrompt(landedSpace.toString(),225,body1,body2,player.getName()+"'s balance: "+player.getBalance());
          if (keyPressed && key=='y' || key=='Y') {
            player.changeBalance(-lanSpace.buyPrice());
            buyScreen = !buyScreen;
            activePlayer++;
            lanSpace.setOccupied(true);
            lanSpace.setOccupied(player);
          }
          else if (keyPressed && key=='n' || key=='N') {
            buyScreen = !buyScreen; 
            activePlayer++;
          }
        } 
        else{
         String body1 = "You must pay $"+lanSpace.getPrice()+" to "+lanSpace.getOccupier().getName();
         String body2 = "Press y to confirm"; 
         cardPrompt(landedSpace.toString(),225,body1,body2,"");
         if (keyPressed && key=='y' || key=='Y') {
            player.changeBalance(lanSpace.getPrice());
            lanSpace.getOccupier().changeBalance(lanSpace.getPrice());
            buyScreen = !buyScreen;
            activePlayer++;
         }
        }
      }
      else if(landedSpace.getType().equals("Tax")){
        Tax lanSpace = (Tax)landedSpace; 
        textSize(20);
        text("You must pay $"+lanSpace.getTax(),(width/2)-75,(height/2-130));
        text("Press y to confirm.", width/2 - 80, height/2 - 100);
        if (keyPressed && key=='y' || key=='Y') {
            player.changeBalance(-lanSpace.getTax());
            buyScreen = !buyScreen;
            activePlayer++;
        }
      }
  }
  
  void cardPrompt(String title, color titleColor, String body1, String body2, String bottom){ // need to adjust parameters to be able to fix position of texts
    //card shape
    int w = 300;
    int l = 400;
    noStroke();
    fill(titleColor);
    rect((width-w)/2,(height-l)/2,w,l,20);
    fill(255);
    rect((width-w)/2,(height-l+80)/2,w,l-40,0,0,20,20);
    fill(0);
    stroke(0);
    //text
    textSize(30);
    text(title,(width-(title.length()*14))/2,(height/2-165));
    textSize(20);
    text(body1,(width/2)-75,(height/2-130));
    text(body2, width/2 - 97, height/2 - 100);
    //body3 text
    text(bottom,(width-(bottom.length()*12))/2,(height/2+175));
  }
  
  int dice() {
    return (int)(Math.random() * 6) + (int)(Math.random() * 6) + 2;
  }
  
  void drawPlayer() {
    //drawBoard();
    for(int i = 0; i<playerlist.size(); i++){    
      Player player = playerlist.get(i);
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
          textSize(20);
          fill(255,0,0);
          text("Player "+(i+1)+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
        }
        if(i == 1){
          fill(255,140,0);
          x+=5;
          y-=5;
          textSize(20);
          fill(255,140,0);
          text("Player "+(i+1)+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
  
        }
        if(i == 2){
          fill(0,0,255);
          x+=5;
          y+=5;
          textSize(20);
          fill(0,0,255);
          text("Player "+(i+1)+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
  
        }
        if(i == 3){
          fill(252,142,172);
          x-=5;
          y+=5;
          textSize(20);
          fill(252,142,172);
          text("Player "+(i+1)+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
        }
        //add more colors for more players
        circle(x,y,10); // CAN EDIT LATER FOR DIFFERENT DESIGN "peg"
      }
    }
  }
  
  void drawBoard() {
    background(240,240,255); // change to whatever looks good
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
}