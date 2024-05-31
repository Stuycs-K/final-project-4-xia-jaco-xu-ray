class Street extends Property{
  private color col; //color
  private int houses;
  private int hotels;
  private int c;
  
  Street(String name, int rentPrice, int buyPrice, String type, color col, int c, int houses, int hotels){
   super(name,rentPrice,buyPrice,type);
   this.col=col;
   this.houses=houses;
   this.hotels=hotels;
   this.c = c;
  }
  
  int getHouses(){
    return houses;
  }
  int getHotels(){ // Updated the diagram with this method - Ray [DELETE AFTER SEEN]
    return hotels;
  }
  void setHouses(int amount){ // Updated the diagram with these parameters - Ray [DELETE AFTER SEEN]
    houses=amount;
  }
  void setHotels(int amount){
    hotels=amount;
  }
  color getColor() {
    return col;
  }
  
  void updateRent(){  // havent updated the diagram for the three following methods - Jaco
    super.setPrice(determineNextRent());
  }
  
  void sellUpdatePrice(){ // sells house and updates price accordingly
    if(getHotels()==1){
       super.whoOccupied.changeBalance(buyPrice()/2);
       setHotels(0);
       setHouses(4);
       updateRent();
    }
    else if(getHouses()!=0){
       super.whoOccupied.changeBalance(buyPrice()/2);
       setHouses(getHouses()-1);
       updateRent();
    }
    else if(getHouses()==0){
       super.whoOccupied.sellProperty(this);
       setOccupied(false);
       updateBuyPrice();
       setHouses(0);
       setHotels(0);
       updateRent();
       super.whoOccupied.changeBalance(buyPrice()/2);
       setOccupied(null);
     }
  }
  
  void updateBuyPrice(){
    int[] buyPrices = new int[]{60, 107, 147, 187, 227, 267, 307, 375};
    int newBuyPrice = 0;
    if(isOccupied()){
      if(c==0||c==1){
        newBuyPrice = 50;
      }
      if(c==2||c==3){
        newBuyPrice = 100;
      }
      if(c==4||c==5){
        newBuyPrice = 150;
      }
      if(c==6||c==7){
        newBuyPrice = 200;
      }
    }
    else{
      newBuyPrice = buyPrices[c];
    }
    super.setBuyPrice(newBuyPrice);
    
  }
  
  int determineNextRent(){
     int[][] rentPrices = new int[][]{{3, 15, 45, 135, 240, 350},
      {7, 33, 93, 280, 420, 567},
      {11, 53, 160, 467, 650, 800},
      {15, 73, 207, 567, 767, 967},
      {19, 93, 267, 717, 892, 1067},
      {23, 113, 340, 817, 992, 1167},
      {27, 137, 410, 933, 1133, 1317},
      {43, 188, 550, 1250, 1500, 1750}};
      
    int nextCost = 0;
    if(getHotels()==1){
      nextCost = rentPrices[c][5];
    }
    else{
      nextCost = rentPrices[c][getHouses()];
    }
    return nextCost;
  }
  
  

  
}
