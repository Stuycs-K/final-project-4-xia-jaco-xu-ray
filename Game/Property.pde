class Property extends BoardSpace{
  private boolean occupied;
  private Player whoOccupied;
  private int rentPrice;
  private int buyPrice;
  private String type;
  
  public Property(String name, int rentPrice, int buyPrice){
    super(name);
    occupied = false;
    this.rentPrice = rentPrice;
    this.buyPrice = buyPrice;
  }
  
  int getPrice(){
    return rentPrice;
  }
  
  void setPrice(int newPrice){
    rentPrice = newPrice;
  }
  
  int buyPrice(){
    return buyPrice;
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
}
