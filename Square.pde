import java.lang.Math;
public class Square
{
  private boolean used;
  private int row;
  private int column;
  private boolean blacked;
  
  public Square(int column, int row)
  {
    used=false;
    this.row=row;
    this.column=column;
  }
 
  public Square ()
  {
    int tempcolumn=0;
    int temprow=0;
       int j=0;
    for(int i=20;i<400; i=i+60){
        if(i<mouseX && i+60>=mouseX)
        {
          tempcolumn=j;
        }
        if(i<mouseY && i+60>=mouseY)
        {
          temprow=j;
        }
        j++;
    }
    used=false;
    row=temprow;
    column=tempcolumn;
  }
  
  public Square(int i){
    int roww=(int)(Math.random()*6);
    int columnn=(int)(Math.random()*6);
    Square bad1=new Square(6,6);
    Square bad2=new Square(1,1);
    Square bad3=new Square(3,3);
    Square s=new Square(columnn,roww);
    boolean ok=!(s.isEqual(bad1) || s.isEqual(bad2) || s.isEqual(bad3));
    if(ok){
      row =roww;
      column=columnn;
      used=true;
      blacked=true;
    }
    else{
      Square b=new Square(1);
      row=b.row;
      column=b.column;
      used=true;
      blacked=true;
    }
  }
  
  public void Clicked()
  {
    if(used==true){
      used=false;
    }
    else{
      used=true;
    }
  }
 
  public int getCenterX()
  {
    int centx=20+60*column+30;
    return centx;
    
  }
  
  public int getCenterY()
  {
    int centy=20+60*row+30;
    return centy;
  }
  
  public int getCornerX(){
    int cornX=20+60*column;
    return cornX;
  }
  
  public int getCornerY(){
    int cornY=20+60*row;
    return cornY;
  }
  
  public Square getSquare()
  {
    int tempcolumn=0;
    int temprow=0;
    for(int i=20;i<400; i=i+60){
       int j=1;
        if(i>mouseX && i+60>=mouseX)
        {
          tempcolumn=j;
        }
        if(i>mouseY && i+60>=mouseY)
        {
          temprow=j;
        }
    }
    return new Square(tempcolumn, temprow);
  }
  
  public boolean isEqual(Square sqr1){
    return (sqr1.row==this.row && sqr1.column==this.column);
  }  
}
