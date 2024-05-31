import java.util.*;
class Player{
  private int balance;
  private ArrayList<Property> ownedProperty; //This may be better as an arraylist, what do you think?
  private String name;
  private boolean turnStatus;
  private boolean jail;
  private int position;
  private boolean bankrupt;
  
  Player(String tname, boolean turnStat) {
   balance = 1500; //This is monopoly's default starting money, can be changed
   ownedProperty = new ArrayList<Property>();
   name = tname;
   turnStatus = turnStat;
   jail = false;
   position = 0;
   bankrupt = false;
  }
  
  int getBalance() {
    return balance;
  }
  
  void changeBalance(int amount) { 
    balance = balance + amount;
  }
  
  
  ArrayList<Property> getProperty() { // should be String
    return ownedProperty;
  }
  
  void addProperty(Property p){
    ownedProperty.add(p);
  }
  
  void sellProperty(BoardSpace space) { 
    ownedProperty.remove(space);
  }

  
  String getName() {
    return name;
  }
  
  void setPosition(int index) {
    position = index;
  }
  
  void setJail(boolean inJail) {
    jail = inJail;
  }
  
  boolean inJail() {
     return jail; 
  }
  
  boolean isBankrupt(){
    return bankrupt;
  }
  
  int getPos(){
    return position; 
  }
  
  void setStatus(boolean state){
    turnStatus = state;
  }
  boolean getStatus(){
    return turnStatus;
  }
  
  
  
  
}
