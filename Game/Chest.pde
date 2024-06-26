import java.util.*;
class Chest extends BoardSpace{
  
  private ArrayList<String> outcomes = new ArrayList<String>();
  private ArrayList<Integer> outcomeMoney = new ArrayList<Integer>();
  
  Chest(String type, String name) {
   super(type, name);
   outcomes.add("Go to Go");
   outcomes.add("Bank Error");
   outcomes.add("Doctor's Fees");
   outcomes.add("Stock Sale");
   outcomes.add("Go to Jail");
   outcomes.add("Opera Night");
   outcomes.add("Christmas");
   outcomes.add("Tax Refund");
   outcomes.add("Birthday");
   outcomes.add("Insurance End");
   outcomes.add("Hospital Fees");
   outcomes.add("School Fees");
   outcomes.add("Consultancy Fee");
   outcomes.add("Street Repairs");
   outcomes.add("Beauty Contest");
   outcomes.add("Inheritance");
    
   outcomeMoney.add(200);
   outcomeMoney.add(200);
   outcomeMoney.add(-50);
   outcomeMoney.add(50);
   outcomeMoney.add(0); 
   outcomeMoney.add(50);
   outcomeMoney.add(100);
   outcomeMoney.add(20);
   outcomeMoney.add(10);
   outcomeMoney.add(100);
   outcomeMoney.add(-50);
   outcomeMoney.add(-50);
   outcomeMoney.add(25);
   outcomeMoney.add(40);
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
