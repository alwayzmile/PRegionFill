// dataStructure.pde

class Point
{
  public int x, y;
  
  public Point( int xa, int ya ) {
    x = xa;
    y = ya;
  }
  
  public boolean isEqual( Point a ) {
    return ((x == a.x) && (y == a.y));
  }
  
  public void displayPoint() {
    print( "(" + x + "," + y + ")" );
  }
}
