class Player{
  private int balance;
  private Property[] ownedProperty; //This may be better as an arraylist, what do you think?
  private String name;
  private boolean turnStatus;
  private boolean jail;
  private int position;
  private boolean bankrupt;
  
  Player(String tname, boolean turnStat) {
   balance = 1500; //This is monopoly's default starting money, can be changed
   //ownedProperty = new int
   name = tname;
   turnStatus = turnStat;
   jail = false;
   position = 0;
   bankrupt = false;
  }
  
  int getBalance() {
    return balance;
  }
  
  void setBalance(int amount) { //This may be better as changeBalance() so you can just add the amount to existing balance (i.e. do calculation within method) instead of doing calculation in Game class - Ray
    balance = amount;
  }
  
  /*
  String viewProperty() {
  }
  
  Property sellProperty(int index) { 
  }
  */
  
  String getName() {
    return name;
  }
  
  void setPosition(int index) {
    position = index;
  }
  
  void setJail(boolean inJail) {
    jail = inJail;
  }
  
  boolean isBankrupt(){
    return bankrupt;
  }
  
  int getPos(){
    return position; 
  }
  
  void setPos(int pos){
    position = pos;
  }
  
}
