class Utility extends Property{
  private boolean preventOverload;
  Utility(String name, int rentPrice, int buyPrice, String type){
    super(name,rentPrice,buyPrice,type);
    preventOverload = true;
  }
  int getPrice(){
    if(preventOverload){
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
      super.setPrice(dice * multiplier);
      preventOverload = false;
    }
    return super.getPrice();
  } 
  
  void stopRandomizing(boolean status){
   preventOverload = status; 
  }
  
  void sellUtility(){ // sells utility
       super.whoOccupied.sellProperty(this);
       setOccupied(false);
       super.whoOccupied.changeBalance(buyPrice()/2);
       setOccupied(null);
  }
}
