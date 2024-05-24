class Tax extends BoardSpace{
  private int taxAmount;
  
  Tax(String name, int taxAmt) {
   super(name);
   taxAmount = taxAmt;  
  }
  
  int getTax() {
    return taxAmount;
  }
  
}
