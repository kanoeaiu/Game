import java.lang.Math;
public class Grid{
  Square[][] boardsquares;
  ArrayList<Square> used;
  public Grid(){
    boardsquares = new Square[6][6];
    for(int i=0; i<6; i++){
      for(int j=0; j<6; j++){
        boardsquares[i][j]= new Square(i,j);
      }
    }
    boardsquares[0][0].Clicked();
    used=new ArrayList<Square>();
    used.add(boardsquares[0][0]);
  }
  
  public void Clicked(Square a){
    Square b=boardsquares[a.column][a.row];
    if(!a.used){
      b.Clicked();
      used.add(b);
    }
  }
  
  public void reset(){
    for(Square s: used){
      if(!s.blacked){
      boardsquares[s.column][s.row].used=false;
      }
    }
    used=new ArrayList<Square>();
    used.add(boardsquares[0][0]);
    
  }
  
  public int lastX(){
    Square s=used.get(used.size()-1);
    return s.getCenterX();
  }
  
  public int lastX(int a){
    Square s=used.get(a-1);
    return s.getCenterX();
  }
  public int lastY(){
    Square s=used.get(used.size()-1);
    return s.getCenterY();
  }
  
  public Square lastSquare(){
    return used.get(used.size()-1);
  }
  
  public boolean inPath(Square a){
    for(Square b: used){
      if(a.isEqual(b)){
        return true;
      }
    }
    return false;
  }
  
  public boolean onGrid(){
    boolean goodX=20<=mouseX&&380>=mouseX;
    boolean goodY=20<=mouseY&&380>=mouseY;
    return goodX&&goodY;
  }
  
  public boolean validMove(Square next, int count){
    Square previous=used.get(used.size()-1);
    int columnChange=java.lang.Math.abs(next.column-previous.column);
    int rowChange=java.lang.Math.abs(next.row-previous.row);
    boolean a=(count==columnChange && 0==rowChange);
    boolean b=(count==rowChange && 0==columnChange);
    boolean c=(count==columnChange && count==rowChange);
    return(board.onGrid()&& (a || b || c)&&!next.used && !board.inPath(next) && !isBlacked(next));
  }
  
  public Square previous(){
    return used.get(used.size()-1);
  }
  
  public int getCount(){
    if((used.size()-1)%3==0){
      return 3;
    }
    else if((used.size()-2)%3==0){
      return 2;
    }
    else{
      return 1;
    }
  }
  
  public void build(){
    if(400<mouseY && 422>mouseY){
      easy();
    }
    if(422<mouseY && 444>mouseY){
      medium();
    }
    if(444<mouseY && 466>mouseY){
      hard();
    }
  }
  
  public void easy(){
    boardsquares[3][3].used=true;
    boardsquares[3][3].blacked=true;
  }
  public void medium(){
      Square a=new Square(0);
      Square b=new Square(0);
    boardsquares[3][3].used=true;
    boardsquares[3][3].blacked=true;
    boardsquares[a.column][a.row]=a;
    boardsquares[b.column][b.row]=b;
  }
  
  public void hard(){
    Square a=new Square(0);
    Square b=new Square(0);
    Square c=new Square(0);
    Square d=new Square(0);
    boardsquares[3][3].used=true;
    boardsquares[3][3].blacked=true;
    boardsquares[a.column][a.row]=a;
    boardsquares[b.column][b.row]=b;
    boardsquares[c.column][c.row]=c;
    boardsquares[d.column][d.row]=d;
  }
  
  public boolean isBlacked(Square s){
    Square b=boardsquares[s.column][s.row];
    return b.blacked;
  }
  }
  

  
  
