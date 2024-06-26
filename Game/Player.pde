import java.util.*;
class Player{
  private int balance;
  private ArrayList<Property> ownedProperty; 
  private String name;
  private boolean turnStatus;
  private boolean jail;
  private boolean jailScreen;
  private int jailCount;
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
   jailScreen = true;
  }
  
  int getBalance() {
    return balance;
  }
  
  void changeBalance(int amount) { 
    balance = balance + amount;
  }
  
  
  ArrayList<Property> getProperty() {
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
  
  void setJS(boolean stat){
   jailScreen = stat;
  }
  
  boolean jailScreen(){
    return jailScreen;
  }
  
  void setJC(int count) {
    jailCount = count;
  }
  
  int jailCount(){
    return jailCount;
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
