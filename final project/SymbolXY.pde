class SymbolXY{

  private PVector vector;
  private String name;
  private float x;
  private float y;

  public PVector getVector() {
      return vector;
  }

  public void setVector(PVector vector) {
      this.vector = vector;
  }

  public String getName() {
      return name;
  }

  public void setName(String name) {
      this.name = name;
  }

  public SymbolXY(String name,PVector vector,float y) {
      this.name = name;
      this.vector = vector;
      this.x = random(0.5,1);
      this.y = y;
       
  }

  public float getX() {
      return x;
  }

  public void setX(float x) {
      this.x = x;
  }

  public float getY() {
      return y;
  }

  public void setY(float y) {
      this.y = y;
  }



}
