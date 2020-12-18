
int count;
int lastX;
int lastY;
Grid board;
PImage img;
PImage reset;
PImage finale;
boolean go;
boolean pause;
   

void setup(){
  img = loadImage("GameEntry.jpg");
  reset=loadImage("reset.PNG");
  finale=loadImage("finalcs.jpg");
  
  size(400,600);
  background(255,0);
  fill(0,255);
  
  image(img,0,0, width, height);
  
  line(150,400,230,400);
  line(150,422,230,422);
  line(150,444,230,444);
  line(150,466,230,466);
  line(150,400,150,466);
  line(230,400,230,466);
   
  loop();
}  
  
void go(){
  for(int i=20;i<400; i=i+60){ 
    rect(i,20,1,360);
    rect(20,i,360,1);
    ellipse(50,50,4,4);
  }
  board=new Grid();
  
  fill(255,0,0);
  rect(21,21,58,58);
  rect(321,321,58,58);
  board.build();
  for(int i=0;i<6;i++){
    for(int j=0;j<6;j++){
      Square s=board.boardsquares[i][j];
        if(s.used){
          fill(0,255);
            rect(s.getCornerX()+1, s.getCornerY()+1, 58,58);
      }
    }
  }
  go=true;
  image(reset,100,400,width,height);
}

void draw(){
  if(!go){
  image(img,0,0, width, height);
  }
  
  if(mousePressed && !go){
    go();
  }
  if(go){
    int lastX=board.lastX();
    int lastY=board.lastY();
    
    if(mouseX!=lastX || mouseY!=lastY){
      background(255,0);
      fill(0,255);
      
      for(int i=20;i<400; i=i+60){ 
        rect(i,20,1,360);
        rect(20,i,360,1);
      }
      
      image(reset,125,400,width/3,height/10);
    }
    
    for(Square s:board.used){
      fill(230,230,250);
      rect(21+60*s.column,21+60*s.row,58,58);
      fill(0,255);
      ellipse(s.getCenterX(), s.getCenterY(),4,4);
    }
    for(int i=0;i<6;i++){
      for(int j=0;j<6;j++){
        if(board.validMove(board.boardsquares[i][j],count)){
          fill(250,250,210);
          rect(21+60*i,21+60*j,58,58);
        }
      }
    }
    for(int i=0;i<6;i++){
    for(int j=0;j<6;j++){
      Square s=board.boardsquares[i][j];
        if(s.blacked){
          fill(0,255);
            rect(s.getCornerX()+1, s.getCornerY()+1, 58,58);
      }
    }
  }
    for(int i=0; i<board.used.size()-1; i++){
       Square s=board.used.get(i);
       Square b=board.used.get(i+1);
       line(s.getCenterX(), s.getCenterY(),b.getCenterX(),b.getCenterY());
    }
    
    fill(255,0,0);
    rect(21,21,58,58);
    rect(321,321,58,58);
    line(lastX,lastY,mouseX,mouseY);
  }
}
void mouseClicked(){
  pause=false;
  if(go){
    count=board.getCount();
    Square isOn=new Square();
    boolean goodMove=board.validMove(isOn,count);
    count=board.getCount();
    if(!board.inPath(isOn) && goodMove){
      board.Clicked(isOn);
    }
    else if(100<mouseX&& 230>mouseX && 400<mouseY && 480>mouseY){
      board.reset();
    }
    count=board.getCount();
    if(board.lastSquare().isEqual(new Square(5,5))){
      background(0,255);
      image(finale,0,0,width,height/2);
      System.out.println("end");
      go=false;
      noLoop();
      pause=true;
    }
  }
  if(!go && !pause){
  image(img,0,0, width, height);
  
  line(150,400,230,400);
  line(150,422,230,422);
  line(150,444,230,444);
  line(150,466,230,466);
  line(150,400,150,466);
  line(230,400,230,466);
   
  System.out.println("exit");
  loop();
  }
}

/*in last image: yay! you solved the puzzle... click to restart game--figure out why it keeps printing the last page
black out squares

*/

    
    
