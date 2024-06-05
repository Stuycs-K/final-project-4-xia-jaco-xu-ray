class Utility extends Property{
  Utility(String name, int rentPrice, int buyPrice, String type){
    super(name,rentPrice,buyPrice,type);
  }
  int getPrice(){
   return super.buyPrice; 
  } // note to self, maybe add methods in Property class like update price (for selling purposes) and override thes emethods in property.
}
