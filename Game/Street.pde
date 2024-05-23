class Street extends Property{
  private String col;
  private int houses;
  private int hotels;
  
  Street(boolean occupied)
  
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
