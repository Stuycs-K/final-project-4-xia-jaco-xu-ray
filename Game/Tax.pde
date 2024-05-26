class Tax extends BoardSpace{
  private int taxAmount;
  
  Tax(String type, String name, int taxAmt) {
   super(type, name);
   taxAmount = taxAmt;  
  }
  
  int getTax() {
    return taxAmount;
  }
  
}
