  import java.util.*;
  class Board {
  private ArrayList<Player> playerlist;
  private BoardSpace[] spaces;
  private int[] buyPrices;
  private int[][] rentPrices;
  private int distance;
  private int sdist;
  private int activePlayer;
  private boolean buyScreen;
  private boolean startScreen;
  private boolean disruption;
  private boolean jailDisruption;
  private boolean taxDisruption;
  private int speed;
  private int page;
  private int jailDice;
  private int chestIndex;
  private int chanceIndex;
  private boolean receivingInput;
  
  Board() {
    //Initialize prices of the properties
    buyPrices = new int[]{60, 107, 147, 187, 227, 267, 307, 375};
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
    brown1 = new Street("Med Ave", rentPrices[0][0], buyPrices[0], "Street", color(139, 69, 19), 0, 0, 0);
    brown2 = new Street("Baltic Ave", rentPrices[0][0], buyPrices[0], "Street", color(139, 69, 19), 0, 0, 0);

    lightBlue1 = new Street("Oriental Ave", rentPrices[1][0], buyPrices[1], "Street", color(173, 216, 230), 1, 0, 0);
    lightBlue2 = new Street("Vermont Ave", rentPrices[1][0], buyPrices[1], "Street", color(173, 216, 230), 1, 0, 0);
    lightBlue3 = new Street("Conn Ave", rentPrices[1][0], buyPrices[1], "Street", color(173, 216, 230), 1, 0, 0);

    pink1 = new Street("St. Charles Pl", rentPrices[2][0], buyPrices[2], "Street", color(199, 21, 133), 2, 0, 0);
    pink2 = new Street("States Ave", rentPrices[2][0], buyPrices[2], "Street", color(199, 21, 133), 2, 0, 0);
    pink3 = new Street("Virginia Ave", rentPrices[2][0], buyPrices[2], "Street", color(199, 21, 133), 2, 0, 0);

    orange1 = new Street("St. James Pl", rentPrices[3][0], buyPrices[3], "Street", color(255, 140, 0), 3, 0, 0);
    orange2 = new Street("Tenn Ave", rentPrices[3][0], buyPrices[3], "Street", color(255, 140, 0), 3, 0, 0);
    orange3 = new Street("New York Ave", rentPrices[3][0], buyPrices[3], "Street", color(255, 140, 0), 3, 0, 0);

    red1 = new Street("Kentucky Ave", rentPrices[4][0], buyPrices[4], "Street", color(255, 0, 0), 4, 0, 0);
    red2 = new Street("Indiana Ave", rentPrices[4][0], buyPrices[4], "Street", color(255, 0, 0), 4, 0, 0);
    red3 = new Street("Illinois Ave", rentPrices[4][0], buyPrices[4], "Street", color(255, 0, 0), 4, 0, 0);

    yellow1 = new Street("Atlantic Ave", rentPrices[5][0], buyPrices[5], "Street", color(255, 255, 0), 5, 0, 0);
    yellow2 = new Street("Ventnor Ave", rentPrices[5][0], buyPrices[5], "Street", color(255, 255, 0), 5, 0, 0);
    yellow3 = new Street("Marvin Gardens", rentPrices[5][0], buyPrices[5], "Street", color(255, 255, 0), 5, 0, 0);

    green1 = new Street("Pacific Ave", rentPrices[6][0], buyPrices[6], "Street", color(60, 179, 113), 6, 0, 0);
    green2 = new Street("NC Ave", rentPrices[6][0], buyPrices[6], "Street", color(60, 179, 113), 6, 0, 0);
    green3 = new Street("Penn Ave", rentPrices[6][0], buyPrices[6], "Street", color(60, 179, 113), 6, 0, 0);

    darkBlue1 = new Street("Park Place", rentPrices[7][0], buyPrices[7], "Street", color(65, 105, 225), 7, 0, 0);
    darkBlue2 = new Street("Boardwalk", rentPrices[7][0], buyPrices[7], "Street", color(65, 105, 225), 7, 0, 0);

    //spaces array intialization
    spaces = new BoardSpace[]{ // total 40 spaces
      new BoardSpace("Go", "Go"), brown1, new Chest("Chest","Chest"), brown2, new Tax("Tax", "Income Tax", 200), empty(), lightBlue1, new Chance("Chance","Chance"), lightBlue2, lightBlue3,
      empty(), pink1, new Utility("Elec. Co.", 0, 150, "Utility"), pink2, pink3, empty(), orange1, new Chest("Chest","Chest"), orange2, orange3,
      empty(), red1, new Chance("Chance","Chance"), red2, red3, empty(), yellow1, yellow2, new Utility("Water Works", 0, 150, "Utility"), yellow3,
      new BoardSpace("Jail", "Jail"), green1, green2, new Chest("Chest","Chest"), green3, empty(), new Chance("Chance","Chance"), darkBlue1, new Tax("Tax", "Luxury Tax", 100), darkBlue2
    };    

    // Initialize other fields
    drawBoard();
    playerlist = new ArrayList<Player>();
    activePlayer = 0;
    distance = 0;
    buyScreen = false;
    startScreen = true;
    disruption = false;
    jailDisruption = false;
    taxDisruption = false;
    speed = 250;
    page = 0;
    jailDice = 0;
    chestIndex = (int)(Math.random() * 16);
    chanceIndex = (int) (Math.random() * 11);
  }

  void draw() {
    if (startScreen&&!keyPressed) {
      String startPrompt = "How many players do you want? (2-4)";
      textSize(30);
      fill(0);
      text(startPrompt, (width-startPrompt.length()*19.5), 200);
      return;
    } else if (startScreen&&keyPressed) {
      if (key=='2') {
        playerlist.add(new Player("Player 1", false));
        playerlist.add(new Player("Player 2", false));
        startScreen = false;
      } else if (key=='3') {
        playerlist.add(new Player("Player 1", false));
        playerlist.add(new Player("Player 2", false));
        playerlist.add(new Player("Player 3", false));
        startScreen = false;
      } else if (key=='4') {
        playerlist.add(new Player("Player 1", false));
        playerlist.add(new Player("Player 2", false));
        playerlist.add(new Player("Player 3", false));
        playerlist.add(new Player("Player 4", false));
        startScreen = false;
      }
      return;
    }
    if (playerlist.size()==1) {
      //win sequence!
      return;
    } else {
      if (activePlayer>=playerlist.size()) {
        activePlayer=0;
      }
      Player player = playerlist.get(activePlayer);
      drawBoard();
      run(buyScreen, player);
      drawPlayer();
    }
  }

  void run(boolean showBuyScreen, Player player) {
    if (disruption) {
      for (int i = 0; i<playerlist.size(); i++) {
        playerlist.get(1).setPosition(1); //FOR MEDITERRANEAN AVENUE
      }
    }
    if (jailDisruption) {
      for (int i = 0; i<playerlist.size(); i++) {
        playerlist.get(i).setPosition(30);
      }
    }
    if(taxDisruption){
      playerlist.get(1).setPosition(4);
    }
    if (!showBuyScreen && !player.inJail() && player.getBalance()>=0) {
      player.setStatus(true);
      if (distance==0) {
        distance = dice();
        sdist = distance;
        return;
      }
      if(distance!=0){
       textSize(20);
       fill(0);
       text(player.getName()+" rolled a "+sdist, width/11+20, height - (height/11) - 10);
       player.setStatus(false);
       player.setPosition(player.getPos()+1);
       if(!(player.getPos()<40)){
         player.setPosition(0); 
         player.changeBalance(200);
       }
       delay(speed);
       distance--;
      }
      if (distance==0 && !player.getStatus()) {
        buyScreen = true;
        key = 0; // before determine prompt is called, the key is reset to prevent early input
      }
    } else {
      BoardSpace landedSpace = spaces[player.getPos()];
      if (landedSpace.toString().equals("empty")||landedSpace.toString().equals("Go")) {
         buyScreen = false;
         activePlayer++;
         return;
      }
      determinePrompt(landedSpace, player);
      
    }
  }
  
  void changeInputStatus(boolean status){
    receivingInput = status;
  }


  void determinePrompt(BoardSpace landedSpace, Player player) {
    if (player.getBalance()>=0) {
      if (landedSpace.getType().equals("Street")) {
        Street lanSpace = (Street) landedSpace;
        if (!lanSpace.isOccupied()) {
          String body1 = "Purchase for $"+lanSpace.buyPrice()+"?";
          String body2 = "Press y for yes, n for no.";
          cardPrompt(landedSpace.toString(), 225, body1, body2, "", player.getName()+"'s balance: $"+player.getBalance());
          if(receivingInput && (key=='y' || key=='Y') && player.getBalance()<lanSpace.buyPrice()){
            cardPrompt(landedSpace.toString(), 225, "No money!", "", "", player.getName()+"'s balance: $"+player.getBalance());
          }
          if (!receivingInput && key=='y' || key=='Y') {
            key = 0;
            if (player.getBalance()>=lanSpace.buyPrice()) {
              player.changeBalance(-lanSpace.buyPrice());
              player.addProperty(lanSpace);
              buyScreen = !buyScreen;
              activePlayer++;
              lanSpace.setOccupied(true);
              lanSpace.setOccupied(player);
              lanSpace.updateRent();
              lanSpace.updateBuyPrice(); 
            }
          } else if (!receivingInput && key=='n' || key=='N') {
            buyScreen = !buyScreen;
            activePlayer++;
            key = 0;
          }
        }
        else {
            if (lanSpace.getOccupier()!=player) {
              String body1 = player.getName()+" pays $"+lanSpace.getPrice()+" to "+lanSpace.getOccupier().getName();
              String body2 = "Press y to confirm";
              cardPrompt(landedSpace.toString(), 225, body1, body2, "", "");
              if (!receivingInput && key=='y' || key=='Y') {
                key = 0;
                player.changeBalance(-1*lanSpace.getPrice());
                lanSpace.getOccupier().changeBalance(lanSpace.getPrice());
                if (player.getBalance()<0) {
                  return; // so it doesnt go to the next player just yet
                }
                buyScreen = !buyScreen;
                activePlayer++;
              }
            }
            else {
            String body1 = "Sell(s) for half price or Upgrade(u)?";
            String body2 = "Cost of Upgrade: "+lanSpace.buyPrice();
            String body3 = "Current Houses (max 4): "+lanSpace.getHouses();
            String body4 = "Current Hotels (max 1): "+lanSpace.getHotels();
            String body5 = "Cancel (n)";
            cardPrompt(landedSpace.toString(), 225, body1, body2, body3, "");
            textAlign(CENTER);
            text(body4, width/2, height/2-40);
            text(body5, width/2, height/2+175);
            textAlign(BASELINE);
            if (!receivingInput && key=='s' || key=='S') {
              key = 0;
              lanSpace.sellUpdatePrice();
              buyScreen = !buyScreen;
              activePlayer++;
            }
            if (receivingInput && key=='u' || key=='U') {
              if(lanSpace.getHotels()==1){
                textAlign(CENTER);
                text("You cannot upgrade anymore!", width/2, height/2+135);
                textAlign(BASELINE);  
              }
              else if(player.getBalance()<lanSpace.buyPrice()){
                cardPrompt(landedSpace.toString(), 225, "No money!", "", "", player.getName()+"'s balance: $"+player.getBalance());
              }
            }
            
            if (!receivingInput && key=='u' || key=='U') {
              key = 0;
              if (lanSpace.getHotels()!=1) {
                if (player.getBalance()>=lanSpace.buyPrice()) {
                  player.changeBalance(-1*lanSpace.buyPrice());
                  lanSpace.setHouses(lanSpace.getHouses()+1);
                  if (lanSpace.getHouses()==5) {
                    lanSpace.setHouses(0);
                    lanSpace.setHotels(1);
                  }
                  lanSpace.updateRent();
                  buyScreen = !buyScreen;
                  activePlayer++;}
              }
            }
            if (!receivingInput && key=='n' || key=='N') {
              key = 0;
              buyScreen = !buyScreen;
              activePlayer++;
            }
          }
        }
      } else if (landedSpace.getType().equals("Tax")) {
        Tax lanSpace = (Tax)landedSpace;
        String body1 = player.getName()+" must pay $"+lanSpace.getTax();
        String body2 = "Press y to confirm";
        cardPrompt(landedSpace.toString(), 225, body1, body2, "", "");
        if (!receivingInput && key=='y' || key=='Y') {
          key = 0;
          player.changeBalance(-lanSpace.getTax());
          if (player.getBalance()<0) {
            return; // so it doesnt go to the next player just yet
          }
          buyScreen = !buyScreen;
          activePlayer++;
        }
      }
      else if(landedSpace.getType().equals("Jail")){
        buyScreen = true;
         jail(player);
      }
      else if (landedSpace.getType().equals("Chance")){
        Chance lanSpace = (Chance) landedSpace;
        String body1 = player.getName();
        if (chanceIndex==0) {
          body1+=" advances to Go";
          String body2 = "and receives $200.";
          String body3 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body2, body3, "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.setPosition(0);
            player.changeBalance(200);
            buyScreen = !buyScreen;
            chanceIndex = (int) (Math.random() * 11);
            activePlayer++;
          }
        }
        else if (chanceIndex==1) {
          body1+=" goes to Illinois Ave";
          String body3 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body3, "", "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            if (player.getPos()>24) {
             player.changeBalance(200); 
            }
            player.setPosition(24);
            chanceIndex = (int)(Math.random() * 11);
            return;
          }
        }
        else if (chanceIndex==2) {
          body1+=" goes to St Charles Pl";
          String body3 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body3, "", "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            if (player.getPos()>11) {
             player.changeBalance(200); 
            }
            player.setPosition(11);
            chanceIndex = (int)(Math.random() * 11);
            return;
          }
        }
        else if (chanceIndex==8) {
          body1+=" goes to Boardwalk";
          String body3 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body3, "", "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.setPosition(39);
            chanceIndex = (int)(Math.random() * 11);
            return;
          }
        }
        else if (chanceIndex==9) {
          body1+=" is now Chairman!";
          String body2 = "Pay $50 to each player";
          String body3 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body2, body3, "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.changeBalance(-50*(playerlist.size()-1));
            for (int i  = 0; i<playerlist.size(); i++) {
              if (i!=activePlayer) {
                playerlist.get(i).changeBalance(50);
              }
            }
            chanceIndex = (int)(Math.random() * 11);
            if(player.getBalance()<0){
              return;
            }
            buyScreen = !buyScreen;
            activePlayer++;
          }
        }
        else if (chanceIndex==6) {
          body1+=" pays $25 for every house,";
          String body2 = "$100 for every hotel owned.";
          String body3 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body2, body3, "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            int tsum = 0;
            for (int i = 0; i<player.getProperty().size(); i++) {
              if (player.getProperty().get(i).getType().equals("Street")) {
               Street cspace = (Street) player.getProperty().get(i);
               tsum += cspace.getHouses()*25;
               tsum += cspace.getHotels()*100;
              }
            }
            player.changeBalance(-tsum);
            chanceIndex = (int)(Math.random() * 11);
            if(player.getBalance()<0){
              return;
            }
            buyScreen = !buyScreen;
            activePlayer++;
          }
        }
        else if (chanceIndex==4) {
          body1+=" goes back 3 spaces";
          String body3 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body3, "", "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.setPosition(player.getPos()-3);
            chanceIndex = (int)(Math.random() * 11);
            return;
          }
        }
        else if (chanceIndex==5) {
          body1+=" is in Jail!";
          String body2 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body2, "", "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.setPosition(30);
            jail(player);
            chanceIndex = (int)(Math.random() * 11);
            return;
          }
        }
        else {
          if (lanSpace.getOutcomeMoney(chanceIndex)<0) {
           body1+=" must pay $"+(-lanSpace.getOutcomeMoney(chanceIndex));
          }
          else {
            body1+=" earns $"+lanSpace.getOutcomeMoney(chanceIndex);
          }
          String body2 = "Press c to confirm";
          cardPrompt("Chance: "+lanSpace.getOutcome(chanceIndex), 225, body1, body2, "", "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.changeBalance(lanSpace.getOutcomeMoney(chanceIndex));
            if (player.getBalance()<0) {
              return; 
            }
            buyScreen = !buyScreen;
            chanceIndex = (int)(Math.random() * 11);
            activePlayer++;
          }
        }
      }
      else if (landedSpace.getType().equals("Chest")) {
        Chest lanSpace = (Chest)landedSpace;
        String body1 = player.getName();
        if (chestIndex==0) { 
          body1+=" advances to Go";
          String body2 = "and receives $200.";
          String body3 = "Press c to confirm";
          cardPrompt("Chest: "+lanSpace.getOutcome(chestIndex), 225, body1, body2, body3, "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.setPosition(0);
            player.changeBalance(200);
            buyScreen = !buyScreen;
            chestIndex = (int)(Math.random() * 16);
            activePlayer++;
          }
        }
        else if (lanSpace.getOutcome(chestIndex).equals("Street Repairs")) {
          body1+=" pays $40 for every house,";
          String body2 = "$115 for every hotel owned.";
          String body3 = "Press c to confirm";
          cardPrompt("Chest: "+lanSpace.getOutcome(chestIndex), 225, body1, body2, body3, "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            int tsum = 0;
            for (int i = 0; i<player.getProperty().size(); i++) {
              if (player.getProperty().get(i).getType().equals("Street")) {
               Street cspace = (Street) player.getProperty().get(i);
               tsum += cspace.getHouses()*40;
               tsum += cspace.getHotels()*115;
              }
            }
            chestIndex = (int)(Math.random() * 16);
            player.changeBalance(-tsum);
            if(player.getBalance()<0){
              return;
            }
            buyScreen = !buyScreen;
            activePlayer++;
          }
        }
        else if (lanSpace.getOutcome(chestIndex).equals("Birthday")){
          body1+=" collects $10";
          String body2 = "from every player.";
          String body3 = "Press c to confirm";
          cardPrompt("Chest: "+lanSpace.getOutcome(chestIndex), 225, body1, body2, body3, "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.changeBalance(10*(playerlist.size()-1));
            for (int i  = 0; i<playerlist.size(); i++) {
              if (i!=activePlayer) {
                playerlist.get(i).changeBalance(-10);
              }
            }
            buyScreen = !buyScreen;
            chestIndex = (int)(Math.random() * 16);
            activePlayer++;
          }
        }
        else if (lanSpace.getOutcome(chestIndex).equals("Opera Night")) {
          body1+=" collects $50";
          String body2 = "from every player.";
          String body3 = "Press c to confirm";
          cardPrompt("Chest: "+lanSpace.getOutcome(chestIndex), 225, body1, body2, body3, "");

          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.changeBalance(50*(playerlist.size()-1));
            for (int i  = 0; i<playerlist.size(); i++) {
              if (i!=activePlayer) {
                playerlist.get(i).changeBalance(-50);
              }
            }
            buyScreen = !buyScreen;
            chestIndex = (int)(Math.random() * 16);
            activePlayer++;
          }
        }
        else if (lanSpace.getOutcome(chestIndex).equals("Go to Jail")) {
          body1+=" is in Jail!";
          String body2 = "Press c to confirm";
          cardPrompt("Chest: "+lanSpace.getOutcome(chestIndex), 225, body1, body2, "", "");
          if (!receivingInput && key=='c' || key=='C') {
            key = 0;
            player.setPosition(30);
            jail(player);
            chestIndex = (int)(Math.random() * 16);
            return;
          }
        }
        else {
          if (lanSpace.getOutcomeMoney(chestIndex)<0) {
           body1+=" must pay $"+(-lanSpace.getOutcomeMoney(chestIndex));
          }
          else {
            body1+=" earns $"+lanSpace.getOutcomeMoney(chestIndex);
          }
          String body2 = "Press c to confirm";
          cardPrompt("Chest: "+lanSpace.getOutcome(chestIndex), 225, body1, body2, "", "");

          if (!receivingInput && key=='c' || key=='C') {
            key = 0;

            player.changeBalance(lanSpace.getOutcomeMoney(chestIndex));
            if (player.getBalance()<0) {
              return; // so it doesnt go to the next player just yet
            }
            buyScreen = !buyScreen;
            chestIndex = (int)(Math.random() * 16);
            activePlayer++;
          }
        }
      }
      else if (landedSpace.getType().equals("Utility")) {
        Utility lanSpace = (Utility)landedSpace;
        if (!lanSpace.isOccupied()) {
          String body1 = "Purchase for $"+lanSpace.buyPrice()+"?";
          String body2 = "Press y for yes, n for no.";
          cardPrompt(landedSpace.toString(), 225, body1, body2, "", player.getName()+"'s balance: $"+player.getBalance());
          if (receivingInput && (key=='y' || key=='Y') && player.getBalance()<lanSpace.buyPrice()){
            cardPrompt(landedSpace.toString(), 225, "No money!", "", "", player.getName()+"'s balance: $"+player.getBalance());
          }
          if (!receivingInput && key=='y' || key=='Y') {
            key = 0;
            if (player.getBalance()>=lanSpace.buyPrice()) {
              player.changeBalance(-lanSpace.buyPrice());
              player.addProperty(lanSpace);
              buyScreen = false;
              activePlayer++;
              lanSpace.setOccupied(true);
              lanSpace.setOccupied(player);}
          } else if (!receivingInput && key=='n' || key=='N') {
            key = 0;
            buyScreen = false;
            activePlayer++;
          }
        }
        else{
          if (lanSpace.getOccupier()!=player) {
              int price = lanSpace.getPrice();
              String body1 = player.getName()+" pays $"+price+" to "+lanSpace.getOccupier().getName();
              String body2 = "Press y to confirm";
              cardPrompt(landedSpace.toString(), 225, body1, body2, "", "");
              if (!receivingInput && key=='y' || key=='Y') {
                key = 0;
                player.changeBalance(-1*price);
                lanSpace.getOccupier().changeBalance(price);
                lanSpace.stopRandomizing(true);
                if (player.getBalance()<0) {
                  return; // so it doesnt go to the next player just yet
                }
                buyScreen = false;
                activePlayer++;
              }
           }
           else{
            String body1 = "Sell(s) for half price?";
            String body2 = "Cancel (n)";
            cardPrompt(landedSpace.toString(), 225, body1, body2, "", "");
            if (!receivingInput && key=='s' || key=='S') {
              key = 0;
              lanSpace.sellUtility();
              buyScreen = false;
              activePlayer++;
            }
            else if (!receivingInput && key=='n' || key=='N'){
              key = 0;
              buyScreen = false;
              activePlayer++;
            }
           }
        }
      }
    }
    else{
        ArrayList<Property> playerProperty = player.getProperty();
          if(player.getProperty().size()>0){
            String body1 = "You must sell property!";
            String body2 = "Houses/Hotels will be sold first";
            cardPrompt(player.getName(),225,body1,body2,"","");
            if(playerProperty.size()>10&&page==0){
              String arrows = "Next(.)";
              textAlign(CENTER);
              text(arrows,width/2,height/2+175);
              textAlign(BASELINE);
            }
            else if(page>0){
              String arrows = "(,)Prev   Next(.)";
              textAlign(CENTER);
              text(arrows,width/2,height/2+175);
              textAlign(BASELINE);
            }
            if(10+(10*page)<playerProperty.size()&&(page==0||page==1)&&!receivingInput && key=='.'){
              key = 0;
              page++;
            }
            else if((page==1||page==2)&& !receivingInput && key==','){
              key = 0;
              page--;
            }
            for (int i = 0; i<10&&i+(page*10)<playerProperty.size(); i++) { // change bounds of loop to work with the pages implementation
              textAlign(CENTER);
              textSize(20);
              text(playerProperty.get(i+(page*10)).toString()+" ["+i+"]", width/2, height/2-(70-(20*i)));
              textAlign(BASELINE);
            }
            if (!receivingInput && Character.isDigit(key) && key-48<playerProperty.size()) { // character 0 is 48 in ascii
              if(playerProperty.get((page*10)+key-48).getType().equals("Street")){
                Street temp = (Street)playerProperty.get((page*10)+key-48);
                temp.sellUpdatePrice();
              }
              else if(playerProperty.get((page*10)+key-48).getType().equals("Utility")){
                Utility temp = (Utility)playerProperty.get((page*10)+key-48);
                temp.sellUtility();
              }
              key = 0; 
              textAlign(CENTER);
              fill(7, 200, 7);
              textSize(50);
              text("Sold!", width/2, height/2+175);
              fill(0);
              textAlign(BASELINE);
            }
    
            if (player.getBalance()>0) {
              buyScreen = !buyScreen;
              activePlayer++;
            }
          }
         else {
          String body1 = "You have no more property to sell";
          String body2 = player.getName()+" is bankrupt!";
          String body3 = "Press y to continue";
          if (playerlist.size()==2) {
            if (activePlayer==0) {
              body3 =  playerlist.get(1).getName()+" won!";
            }
            else {
             body3 =  playerlist.get(0).getName()+" won!"; 
            }
            playerlist.remove(player);
            cardPrompt(player.getName(), 225, body1, body2, body3, "");
          }
          else {
            cardPrompt(player.getName(), 225, body1, body2, body3, "");
            if (!receivingInput && key=='y' || key=='Y') {
              key = 0;
              if (activePlayer==playerlist.size()-1) { // if activePlayer was index 3 (out of four players) then the next index/player should be 0
                activePlayer = 0; // if activePlayer is 0,1,2 (out of four players/indices 0,1,2,3), removing the player will be fine because everything is shifted down
              }
              playerlist.remove(player);
              buyScreen = !buyScreen;
            }
          }
        }
      }
  }

  void cardPrompt(String title, color titleColor, String body1, String body2, String body3, String bottom) {
    //card shape
    int w = 300;
    int l = 400;
    strokeWeight(2);
    fill(titleColor);
    rect((width-w)/2, (height-l)/2, w, l, 20);
    fill(255);
    rect((width-w)/2, (height-l+80)/2, w, l-40, 0, 0, 20, 20);
    fill(0);
    stroke(0);
    //text
    textAlign(CENTER);
    textSize(30);
    text(title, width/2, (height/2-165));
    textSize(20);
    text(body1, width/2, (height/2-130));
    text(body2, width/2, height/2 - 100);
    text(body3, width/2, height/2-70);
    textAlign(LEFT);
    text(bottom, (width-(bottom.length()*11))/2, (height/2+175));
    strokeWeight(1);
  }

  int dice() {
    return (int)(Math.random() * 6) + (int)(Math.random() * 6) + 2;
  }

  void drawPlayer() {
    strokeWeight(1);
    for (int i = 0; i<playerlist.size(); i++) {
      Player player = playerlist.get(i);
      if (!player.isBankrupt()) {
        int sqLength = width/11;
        int pos = player.getPos();
        int x;
        int y;
        if (pos < 11) {
          x = width/22 + (pos * sqLength);
          y = width/22;
        } else if (pos < 21) {
          x = width - (sqLength/2);
          y = (sqLength/2) + (sqLength * (pos - 10));
        } else if (pos < 31) {
          x = (width - (sqLength/2)) - (sqLength * (pos - 20));
          y = height - (sqLength/2);
        } else if (pos < 40) {
          x = (sqLength/2);
          y = (height - (sqLength/2)) - (sqLength * (pos - 30));
        } else {
          System.out.println("not in bounds"); 
          return;
        }
        if (player.getName().equals("Player 1")) { // set the color for the player
          fill(255, 0, 0);
          x-=5;
          y-=5;
          textSize(20);
          fill(255, 0, 0);
          text(player.getName()+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
        }
        if (player.getName().equals("Player 2")) {
          fill(255, 140, 0);
          x+=5;
          y-=5;
          textSize(20);
          fill(255, 140, 0);
          text(player.getName()+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
        }
        if (player.getName().equals("Player 3")) {
          fill(0, 0, 255);
          x+=5;
          y+=5;
          textSize(20);
          fill(0, 0, 255);
          text(player.getName()+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
        }
        if (player.getName().equals("Player 4")) {
          fill(252, 142, 172);
          x-=5;
          y+=5;
          textSize(20);
          fill(252, 142, 172);
          text(player.getName()+" balance: $"+player.getBalance(), width/11+20, ((height/11)+30)+(i*20));
        }
        circle(x, y, 10); 
      }
    }
  }

  void drawBoard() {
    background(205, 230, 208); 
    int spaceCounter = 0;
    for (int i = 0; i<width; i+=width/11) {
      fill(205, 230, 208);
      strokeWeight(2);
      rect(i, 0, width/11, width/11);
      rect(0, i, width/11, width/11);
      rect(i, height-(width/11), width/11, width/11);
      rect(width-(width/11), i, width/11, width/11);
      //noStroke();
      int pos = i/(width/11);
      if (spaces[pos].getType()=="Street") {
        Street landedSpace = (Street)spaces[pos];
        fill(landedSpace.getColor());
        rect(i, 100-40, width/11, 20);
        if (landedSpace.isOccupied()) {
          fill(0);
          textSize(10);
          textAlign(CENTER);
          text(landedSpace.getOccupier().getName(), i+40, 35);
          textAlign(CENTER);
          textSize(8);
          text("Houses: "+landedSpace.getHouses()+"  Hotels: "+landedSpace.getHotels(), i+40, 45);
          textAlign(BASELINE);
        }
      }
      if (spaces[pos+10].getType()=="Street") {
        Street landedSpace = (Street)spaces[pos+10];
        fill(landedSpace.getColor());
        rect(800, i, 20, width/11);
        if (landedSpace.isOccupied()) {
          fill(0);
          textSize(10);
          textAlign(CENTER);
          text(landedSpace.getOccupier().getName(), 880-30, i+40);
          textAlign(CENTER);
          textSize(8);
          text("Houses: "+landedSpace.getHouses()+"\nHotels: "+landedSpace.getHotels(), 880-30, i+55);
          textAlign(BASELINE);
        }
      }
      if (spaces[30-pos].getType()=="Street") {
        Street landedSpace = (Street)spaces[30-pos];
        fill(landedSpace.getColor());
        rect(i, 800, width/11, 20);
        if (landedSpace.isOccupied()) {
          fill(0);
          textSize(10);
          textAlign(CENTER);
          text(landedSpace.getOccupier().getName(), i+40, height-35);
          textAlign(CENTER);
          textSize(8);
          text("Houses: "+landedSpace.getHouses()+"  Hotels: "+landedSpace.getHotels(), i+40, height-25);
          textAlign(BASELINE);
        }
      }
      if (pos>0&&spaces[40-pos].getType()=="Street") {
        Street landedSpace = (Street)spaces[40-pos];
        fill(landedSpace.getColor());
        rect(100-40, i, 20, width/11);
        if (landedSpace.isOccupied()) {
          fill(0);
          textSize(10);
          textAlign(CENTER);
          text(landedSpace.getOccupier().getName(), 30, i+40);
          textAlign(CENTER);
          textSize(8);
          text("Houses: "+landedSpace.getHouses()+"\nHotels: "+landedSpace.getHotels(), 30, i+55);
          textAlign(BASELINE);
        }
      }
    }
    for (int i = 0; i<width; i+=width/11) {
      textSize(10);
      fill(0);
      textAlign(CENTER);
      text(spaces[spaceCounter].toString(), i+40, 15);
      if (spaceCounter>0&&spaceCounter<10) {
        text(spaces[spaceCounter+10].toString(), width-30, i+15);
      }
      textAlign(BASELINE);
      //}
      spaceCounter++;
    }
    spaceCounter=0;
    for (int i = width; i>0; i-=width/11) {
      textSize(10);
      fill(0);
      textAlign(CENTER);
      text(spaces[spaceCounter+19].toString(), i+40, height-10);
      text(spaces[spaceCounter+29].toString(), 30, i+15);
      textAlign(BASELINE);
      //}
      spaceCounter++;
    }
    
    Utility u1 = (Utility)spaces[12];
    Utility u2 = (Utility)spaces[28];
    if(u1.isOccupied()){
          fill(0);
          textSize(10);
          textAlign(CENTER);
          text(u1.getOccupier().getName(), 880-30, 80*2+40);
          textAlign(BASELINE);
    }
    if(u2.isOccupied()){
          fill(0);
          textSize(10);
          textAlign(CENTER);
          text(u2.getOccupier().getName(), 80*2+40, height-35);
          textAlign(BASELINE);
    }
    image(loadImage("logo.png"), width/2-250, height/2-100, 500, 200);
  }
  
  void jail(Player player){
      if (player.jailCount()<3){
        if (player.jailScreen()) {
          String body1 = player.getName()+" is in jail!";
          String body2 = "Press y to pay $50 to bail"; 
          String body3 = "Press n to try rolling a 4 to bail";
          player.setJail(true);
          cardPrompt("Jail",225,body1,body2,body3,"");
          if (!receivingInput && key=='y' || key=='Y') {
            key = 0;
            player.changeBalance(-50);
            player.setJail(false);
            player.setJS(true);
            buyScreen = false;
            activePlayer++;
            return;
          } 
          else if (!receivingInput && (key=='n' || key=='N')) {
           key = 0;
           player.setJS(false); 
           jailDice = dice();
          }
        }
        else {
          if (jailDice==4) {
            cardPrompt("Jail",225,"You rolled a 4","You're out of jail!","Press y to continue","");
            if (!receivingInput && key=='y' || key=='Y') {
              key = 0;
              player.setJail(false);
              player.setJC(0);
              jailDice = dice();
              player.setJS(true);
              buyScreen = false;
              activePlayer++;
            }
          }
          else {
            cardPrompt("Jail",225,"You didn't roll a 4. You rolled a "+jailDice+".","You're still in jail","Press y to continue","");
            if (!receivingInput && key=='y' || key=='Y') {
              key = 0;
              player.setJail(true);
              player.setJC(player.jailCount()+1);
              buyScreen = false;
              player.setJS(true);
              jailDice = dice();
              activePlayer++;
            }
          }
        }
      } 
      else {
        cardPrompt("Jail",225,player.getName()+", you're out of jail", "You've been here for 3 rounds","Press y to continue","");
        if (!receivingInput && key=='y' || key=='Y') {
          key = 0;
          player.setJS(true);
          player.setJail(false);
          player.setJC(0);
          buyScreen = false;
          activePlayer++;
          return;
        }
      }
  }

  BoardSpace empty() {
    return new BoardSpace("empty", "empty");
  }

  
  void loseMoney(){
     for (int i = 0; i<playerlist.size(); i++) {
        int cbal = -200;
        playerlist.get(i).changeBalance(cbal);
     }

  }

  void teleport() {
    if (!buyScreen && !startScreen) {
      int temp = (int) (Math.random()*40);
      for (int i = 0; i<playerlist.size(); i++) {
        playerlist.get(i).setPosition(temp);
      }
      draw();
    }
  }

  void disrupt() {
    disruption = !disruption;
    if (disruption && jailDisruption) {
     jailDisruption = !jailDisruption; 
    }
  }
  
  void jailDisrupt(){
    jailDisruption = !jailDisruption;
    if (disruption && jailDisruption) {
     disruption = !disruption; 
    }
  }
  
  void taxDisruption(){
    taxDisruption = true;
  }
  
  void speedIncrease(){
    speed = 5;
  }
  
  void onePlayerJail(){
    buyScreen = true;
    Player p = playerlist.get(activePlayer);
    p.setPosition(30);
    return;
  }
  
  void multipleProperty(){
    Player p = playerlist.get(activePlayer);
    for(int i = 0; i<spaces.length; i++){
     if(spaces[i].getType().equals("Street")){
      Street s = (Street)spaces[i];
      p.addProperty(s); 
      s.setOccupied(p);
      s.setOccupied(true);
     }
    }
    p.changeBalance(-1*p.getBalance()-10000);
    run(true,p);
  }
  
  void util1(){
    buyScreen = true;
    Player p = playerlist.get(activePlayer);
    p.setPosition(12);
  }
  
 void util2(){
    buyScreen = true;
    Player p = playerlist.get(activePlayer);
    p.setPosition(28);
  }
  
  void tpChance(){
    buyScreen = true;
    Player p = playerlist.get(activePlayer);
    p.setPosition(7);
  }
  
  void tpChest(){
    buyScreen = true;
    Player p = playerlist.get(activePlayer);
    p.setPosition(2);
  }
  
}
