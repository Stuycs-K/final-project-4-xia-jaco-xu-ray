class Property extends BoardSpace{
  private boolean occupied;
  private Player whoOccupied;
  private int rentPrice;
  private int buyPrice;

  
  public Property(String name, int rentPrice, int buyPrice, String type){
    super(type,name);
    occupied = false;
    this.rentPrice = rentPrice;
    this.buyPrice = buyPrice;
  }
  
  int getPrice(){
    return rentPrice;
  }
  
  void setPrice(int newPrice){  // havent updated the diagram for the following method - Jaco
    rentPrice = newPrice;
  }
  
  int buyPrice(){
    return buyPrice;
  }
  
  void setBuyPrice(int price){ // have not updated the diagram yet -- Jaco
    buyPrice = price;
  }
  
  boolean isOccupied(){
    return occupied;
  }
  
  Player getOccupier(){
    return whoOccupied;
  }
  
  void setOccupied(Player occupier){
    whoOccupied = occupier;
  }
  
  void setOccupied(boolean status){
    occupied = status;
  }
  
  //String getType(){ //Added this method and added it to diagram - Ray [DELETE AFTER SEEN] keep it in boardspace - Jaco
  //  return type;
  //}
}
