class Property extends BoardSpace{
  private boolean occupied;
  private Player whoOccupied;
  private int rentPrice;
  private int buyPrice;
  private String type2; //either street or utility
  
  public Property(String type, String name, int rentPrice, int buyPrice, String type2){
    super(type,name);
    occupied = false;
    this.rentPrice = rentPrice;
    this.buyPrice = buyPrice;
    this.type2 = type2;
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
  
  String getType(){ //Added this method and added it to diagram - Ray [DELETE AFTER SEEN]
    return type2;
  }
}
