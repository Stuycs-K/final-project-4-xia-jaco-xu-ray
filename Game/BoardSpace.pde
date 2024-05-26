class BoardSpace{
  private String name;
  private String type;
  public String toString(){return name;};
  
  BoardSpace(String type, String name){
    this.type = type;
    this.name = name;
  }
}
