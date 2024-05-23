class Street extends Property{
  private String col;
  private int houses;
  private int hotels;
  
  Street(String name, int rentPrice, int buyPrice, String type, String col, int houses, int hotels){
   super(name,rentPrice,buyPrice,type);
   this.col=col;
   this.houses=houses;
   this.hotels=hotels;
  }
  
  int getHouses(){
    return houses;
  }
  int getHotels(){ // need to update the diagram with this method
    return hotels;
  }
  void setHouses(int amount){ // need to update the diagram with these parameters
    houses=amount;
  }
  void setHotels(int amount){
    hotels=amount;
  }
  

  
}
