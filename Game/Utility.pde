class Utility extends Property{
  Utility(String name, int rentPrice, int buyPrice, String type){
    super(name,rentPrice,buyPrice,type);
  }
  int getPrice(){
    int multiplier = 4;
    if(this.isOccupied()){
     ArrayList<Property> ownedProperty = this.getOccupier().getProperty();
     int counter = 0;
     for(int i = 0; i<ownedProperty.size(); i++){
       if(ownedProperty.get(i).getType().equals("Utility")){
        counter++; 
       }
     }
     if(counter==2){ // both utilities are owned
      multiplier = 10; 
     }
    }
    int dice = ((int)(Math.random() * 6) + (int)(Math.random() * 6) + 2);
    return dice * multiplier;
  } // note to self, maybe add methods in Property class like update price (for selling purposes) and override thes emethods in property.
  
  void sellUtility(){ // sells utility
       super.whoOccupied.sellProperty(this);
       setOccupied(false);
       super.whoOccupied.changeBalance(buyPrice()/2);
       setOccupied(null);
  }
}
