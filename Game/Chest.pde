class Chest extends BoardSpace{
  
  private ArrayList<String> outcomes = new ArrayList<String>();
  private ArrayList<Integer> outcomeMoney = new ArrayList<Integer>();
  
  Chest(String type, String name) {
   super(type, name);
   //outcomes.add("Go to Go");
   outcomes.add("Bank Error");
   outcomes.add("Doctor's Fees");
   outcomes.add("Stock Sale");
   //outcomes.add("Free Jail Bail");
   //outcomes.add("Go to Jail");
   //outcomes.add("Opera Night");
   outcomes.add("Christmas");
   outcomes.add("Tax Refund");
   //outcomes.add("Birthday");
   outcomes.add("Insurance End");
   outcomes.add("Hospital Fees");
   outcomes.add("School Fees");
   outcomes.add("Consultancy Fee");
   //outcomes.add("Street Repairs");
   outcomes.add("Beauty Contest");
   outcomes.add("Inheritance");
    
   //GO CARD;
   outcomeMoney.add(200);
   outcomeMoney.add(-50);
   outcomeMoney.add(50);
   //JAIL CARD
   //JAIL CARD
   //collect 50 from every player outcomeMoney.add();
   outcomeMoney.add(100);
   outcomeMoney.add(20);
   //collect 10 from every player
   outcomeMoney.add(100);
   outcomeMoney.add(-50);
   outcomeMoney.add(-50);
   outcomeMoney.add(25);
   //40 per house 115 per hotel
   outcomeMoney.add(10);
   outcomeMoney.add(100);
  }
  
  String getOutcome(int index){
    return outcomes.get(index);
  }
  
  int getOutcomeMoney(int index) {
   return outcomeMoney.get(index); 
  }
 
  
}
