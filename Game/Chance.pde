import java.util.*;
class Chance extends BoardSpace{
  
  private ArrayList<String> outcomes = new ArrayList<String>();
  private ArrayList<Integer> outcomeMoney = new ArrayList<Integer>();
  
  Chance(String type, String name) {
   super(type, name);
   outcomes.add("Go to Go");
   outcomes.add("Illinois Ave");
   outcomes.add("St Charles Pl");
   outcomes.add("Bank Dividend");
   outcomes.add("Back 3 Spaces");
   outcomes.add("Go to Jail");
   outcomes.add("Repairs");
   outcomes.add("Poor Tax");
   outcomes.add("Boardwalk");
   outcomes.add("Chairman");
   outcomes.add("Loan Matures");
    
   outcomeMoney.add(200);
   outcomeMoney.add(0);
   outcomeMoney.add(0);
   outcomeMoney.add(50);
   outcomeMoney.add(0);
   outcomeMoney.add(0);
   outcomeMoney.add(-25);
   outcomeMoney.add(-15);
   outcomeMoney.add(0);
   outcomeMoney.add(-50);
   outcomeMoney.add(150);

  }
  
  String getOutcome(int index){
    return outcomes.get(index);
  }
  
  int getOutcomeMoney(int index) {
   return outcomeMoney.get(index); 
  }
 
  
}
