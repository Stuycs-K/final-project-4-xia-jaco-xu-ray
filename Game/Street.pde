class Street extends Property{
  private color col; //color
  private int houses;
  private int hotels;
  
  Street(String type, String name, int rentPrice, int buyPrice, String type2, color col, int houses, int hotels){
   super(type, name,rentPrice,buyPrice,type2);
   this.col=col;
   this.houses=houses;
   this.hotels=hotels;
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

  
}
