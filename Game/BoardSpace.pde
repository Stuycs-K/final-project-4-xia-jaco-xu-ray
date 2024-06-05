class BoardSpace{
  private String name;
  private String type;
  public String toString(){return name;};
  public String getType(){return type;};
  ////public int getPrice(){return 0;};
  //public void setPrice(int newPrice){};
  //public int buyPrice(){return 0;};
  ////public boolean isOccupied(){return false;};
  //public Player getOccupier(){return new Player("",false);};
  //public void setOccupied(Player occupier){};
  //public void setOccupied(boolean status){};
  //public int getHouses(){return 0;};
  //public int getHotels(){return 0;};
  //public void setHouses(int amount){};
  //public void setHotels(int amount){};
  //public color getColor(){return color(255);};
  public int getTax(){return 0;}; // delete all of these? except until getType() and maybe also keep getColor() with the "" returned - Jaco
  
  BoardSpace(String type, String name){
    this.type = type;
    this.name = name;
  }
  
}
