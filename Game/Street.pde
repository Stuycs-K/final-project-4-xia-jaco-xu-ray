class Street extends Property{
  private String col; //color
  private int houses;
  private int hotels;
  
  Street(String type, String name, int rentPrice, int buyPrice, String type, String col, int houses, int hotels){
   super(type, name,rentPrice,buyPrice,type);
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
  String getColor() {
    return col;
  }

  
}
