class Player {
  //player vars
int X;
int Y;
int W;
int H;


boolean isMovingUp ;
boolean isMovingDown ;
boolean isMovingLeft;
boolean isMovingRight;


//movement
int Speed;

//square hit box
int sB;
int sT;
int sL;
int sR;

//constructor

Player(int playerX, int playerY, int playerW, int playerH){
  X = playerX;
   Y = playerY;
    W = playerW;
     H = playerH;
     
     //collision hit boxes
  sB = playerY + playerH/2;
  sT = playerY - playerH/2;
  sL = playerX - playerW/2;
  sR = playerX + playerW/2;
  
   isMovingUp = false;
isMovingDown = false;
isMovingLeft = false;
 isMovingRight = false;
 Speed = 10;
 
}

void render (){
image(vanImage, X, Y);
  
}
  
  void move() {
    
 sB = Y + H/2;
  sT = Y - H/2;
  sL = X - W/2;
  sR = X + W/2;
  
  if (isMovingUp ==true) {
    Y = Y - Speed;
  }
  if (isMovingDown ==true) {
     Y =Y + Speed;
  }
  if (isMovingLeft ==true) {
     X = X - Speed;
  }
  if (isMovingRight ==true) {
     X =X + Speed;
  }
  }
  
  void hitObject (Object anObject) {
  if (sT <= anObject.circleB &&
  sB >= anObject.circleT &&
  sL <= anObject.circleR && 
  sR >= anObject.circleL) 
  {
    println("hit");
  
    state =1;
  }
} 
   void parked () {
  if (sT < space1.spaceB - 15 &&
  sB > space1.spaceT + 20 &&
  sL < space1.spaceR - 15 && 
  sR > space1.spaceL + 20) 
  {
    println("parked");
    state ++;
  }
} 
}
