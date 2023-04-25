import processing.sound.*;

SoundFile honkSound;
SoundFile backgroundMusic;

Player P1;

ParkingSpace space1;
ParkingSpace Fspace;

Button Play;
Button Home;
Button NextLevel;

int state = 0;

int startT = millis();
int endT;
int timer = 5000;


ArrayList<Object> objectList;

PImage cowImage;
PImage deerImage;
PImage skunkImage;
PImage backgroundImage;
PImage playButtonImage;
PImage homeButtonImage;
PImage levelButtonImage;
PImage vanImage;
PImage startImage;
PImage endImage;
PImage winImage;
PImage dieImage;
Animation skunkAnimation;
PImage[] skunkImages = new PImage[2];

void setup () {
  size (1200, 800);

space1 = new ParkingSpace();
Fspace = new ParkingSpace();

      Play = new Button(40, 625, 60, color (200));
      Home = new Button(40, 50, 60, color (200));
      NextLevel = new Button(width - 150, 600, 60, color (200));
      
  P1 = new Player(width/2, height - 100, 100, 70);
  
  objectList= new ArrayList<Object>();
  objectList.add (new Object());
  
  honkSound = new SoundFile(this, "honk.wav");
  backgroundMusic = new SoundFile (this, "background.wav");
  honkSound.rate(1);
  honkSound.amp(0.5);
   backgroundMusic.rate(1);
      backgroundMusic.amp(1);
   if (backgroundMusic.isPlaying() == false) {
     backgroundMusic.play();
   }
   skunkAnimation = new Animation (skunkImages, 0.1, 5);
   
  cowImage = loadImage("cow2.png");
  deerImage = loadImage("deer2.png");
  skunkImage = loadImage( "skunk0.png");
  backgroundImage = loadImage ("background.png");
  vanImage =   loadImage ("vanpicture.png");
  startImage = loadImage("start.png");
   endImage = loadImage("levelcomplete.png");
   winImage = loadImage("winscreen.png");
     dieImage = loadImage("gameover.png");
     playButtonImage = loadImage("playbutton.png");
      homeButtonImage = loadImage("homebutton.png");
      levelButtonImage = loadImage("levelbutton.png");
      
   float animalScale = 0.25;
  
  cowImage.resize(int(cowImage.width * animalScale), int(cowImage.height * animalScale));
   deerImage.resize(int(deerImage.width * animalScale), int(deerImage.height * animalScale));
skunkImage.resize(int(skunkImage.width * animalScale), int(skunkImage.height * animalScale));
backgroundImage.resize (width,height);
startImage.resize (width,height);
endImage.resize (width,height);
winImage.resize (width,height);
dieImage.resize (width,height);
vanImage.resize (200,140);
playButtonImage.resize (Play.size, Play.size);
homeButtonImage.resize (Home.size, Home.size);
  levelButtonImage.resize (NextLevel.size, NextLevel.size);
  ////animation setup
  for (int index = 0; index < 2; index ++)
  {skunkImages[index] = loadImage("skunk" + index + ".png"); }
}

void draw () {
  
  switch (state){
//////////////////////////////////////////////////////////////////////  OPEN SCREEN 
    case 0: 
    background(startImage);
    Play.renderPlay();
    if (Play.isPressed() == true)
{
 state = 2;
}
break;
 ////////////////////////////////////////////////////////////////////// GAME OVER SCREEN
   case 1: 
   background (dieImage);
   honkSound.play();
   Home.renderHome();
    if (Home.isPressed() == true)
{
   honkSound.stop();
 state = 0;
  P1.X = width/2;
 P1.Y =  height - 100;
objectList= new ArrayList<Object>();
 objectList.add (new Object());
}
break;
//////////////////////////////////////////////////////////////////////  PLAY LEVEL 1
    case 2: 
  endT = millis();

  background (backgroundImage);
   //backgroundMusic.play();

     println("level 1");

  if(endT - startT >= timer){
    objectList.add (new Object());
    objectList.add (new Object());
    startT = millis();
  }
  for (Object aObject : objectList) {
    aObject.render ();
    aObject.move();
    aObject.wallDetect(); }
 
  P1.render();
  P1.move();
  
  space1.render();
  textSize (50);
  text("F/S" ,Fspace.x + Fspace.w/4 , Fspace.y + Fspace.h/2 + 10);
  Fspace.render();

  for (Object aObject : objectList) {
   P1.hitObject ( aObject);
 }
   
 P1.parked();
   break;
  
   ////////////////////////////////////////////////////////////////////// LEVEL COMPLETE SCREEN
   case 3: 
   background (endImage);
   NextLevel.renderLevel();
   if (NextLevel.isPressed() == true)
{
state++;
 P1.X = width/2;
 P1.Y =  height - 100;
 
 space1.x = random( 50, width - space1.w*2);
    space1.y = random(space1.w, 500); 
     space1.spaceL = space1.x - space1.w/2;
    space1.spaceR = space1.x + space1.w/2;
    space1.spaceT = space1.y - space1.h/2;
    space1.spaceB = space1.y + space1.h/2;
 
} 
   break;
   ////////////////////////////////////////////////////////////////////// PLAY LEVEL 2
   case 4:
    endT = millis();
timer = 3500;
   println("level 2");

//space1.x = random ( 50, width - space1.w*2);
  background (backgroundImage);
   //backgroundMusic.play();
  
  if(endT - startT >= timer){
    objectList.add (new Object());
     objectList.add (new Object());
    startT = millis();
  }
  for (Object aObject : objectList) {
    aObject.render ();
    aObject.move();
    aObject.wallDetect(); 
   aObject.speed = int (random (4,6));}
 
  P1.render();
  P1.move();
  
  space1.render();
  textSize (50);
  text("F/S" ,Fspace.x + Fspace.w/4 , Fspace.y + Fspace.h/2 + 10);
  Fspace.render();


  for (Object aObject : objectList) {
   P1.hitObject ( aObject);
 }
   
 P1.parked();
   break;
      ////////////////////////////////////////////////////////////////////// LEVEL COMPLETE SCREEN
   case 5: 
   background (endImage);
   NextLevel.renderLevel();
   if (NextLevel.isPressed() == true)
{
state++;
 P1.X = width/2;
 P1.Y =  height - 100;
 
 space1.x = random( 50, width - space1.w*2);
    space1.y = random(space1.w, 500); 
     space1.spaceL = space1.x - space1.w/2;
    space1.spaceR = space1.x + space1.w/2;
    space1.spaceT = space1.y - space1.h/2;
    space1.spaceB = space1.y + space1.h/2;
 
} 
   break;
   ////////////////////////////////////////////////////////////////////// PLAY LEVEL 3
    case 6:
    endT = millis();
timer = 2700;
   println("level 3");


  background (backgroundImage);
   //backgroundMusic.play();
  
  if(endT - startT >= timer){
    objectList.add (new Object());
     objectList.add (new Object());
    startT = millis();
  }
  for (Object aObject : objectList) {
    aObject.render ();
    aObject.move();
    aObject.wallDetect(); 
   aObject.speed = int (random (7,10));}
 
  P1.render();
  P1.move();
  
  space1.render();
  textSize (50);
  text("F/S" ,Fspace.x + Fspace.w/4 , Fspace.y + Fspace.h/2 + 10);
  Fspace.render();


  for (Object aObject : objectList) {
   P1.hitObject ( aObject);
 }
   
 P1.parked();
   break;
      ////////////////////////////////////////////////////////////////////// LEVEL COMPLETE SCREEN
   case 7: 
   background (endImage);
   NextLevel.renderLevel();
   if (NextLevel.isPressed() == true)
{
state++;
 P1.X = width/2;
 P1.Y =  height - 100;
 
 space1.x = random( 50, width - space1.w*2);
    space1.y = random(space1.w, 500); 
     space1.spaceL = space1.x - space1.w/2;
    space1.spaceR = space1.x + space1.w/2;
    space1.spaceT = space1.y - space1.h/2;
    space1.spaceB = space1.y + space1.h/2;
 
} 
   break;
   ////////////////////////////////////////////////////////////////////// PLAY LEVEL 4
    case 8:
    endT = millis();
timer = 2700;
   println("level 4");

  background (backgroundImage);
   //backgroundMusic.play();
  
  if(endT - startT >= timer){
    objectList.add (new Object());
     objectList.add (new Object());
    startT = millis();
  }
  for (Object aObject : objectList) {
    aObject.render ();
    aObject.move();
    aObject.wallDetect(); 
   aObject.speed = int (random (10,15));}
 
  P1.render();
  P1.move();
  
  space1.render();
  textSize (50);
  text("F/S" ,Fspace.x + Fspace.w/4 , Fspace.y + Fspace.h/2 + 10);
  Fspace.render();


  for (Object aObject : objectList) {
   P1.hitObject ( aObject);
 }
   
 P1.parked();
   break;
      ////////////////////////////////////////////////////////////////////// LEVEL COMPLETE SCREEN
   case 9: 
   background (endImage);
   NextLevel.renderLevel();
   if (NextLevel.isPressed() == true)
{
state++;
 P1.X = width/2;
 P1.Y =  height - 100;
 
 space1.x = random( 50, width - space1.w*2);
    space1.y = random(space1.w, 500); 
     space1.spaceL = space1.x - space1.w/2;
    space1.spaceR = space1.x + space1.w/2;
    space1.spaceT = space1.y - space1.h/2;
    space1.spaceB = space1.y + space1.h/2;
 
} 
   break;
////////////////////////////////////////////////////////////////////// PLAY LEVEL 5
   case 10:
    endT = millis();
timer = 2000;
   println("level 5");

  background (backgroundImage);
   //backgroundMusic.play();
  
  if(endT - startT >= timer){
    objectList.add (new Object());
     objectList.add (new Object());
    startT = millis();
  }
  for (Object aObject : objectList) {
    aObject.render ();
    aObject.move();
    aObject.wallDetect(); 
   aObject.speed = int (random (15,17));}
 
  P1.render();
  P1.move();
  
  space1.render();
  textSize (50);
  text("F/S" ,Fspace.x + Fspace.w/4 , Fspace.y + Fspace.h/2 + 10);
  Fspace.render();


  for (Object aObject : objectList) {
   P1.hitObject ( aObject);
 }
   
 P1.parked();
   break;
   ////////////////////////////////////////////////////////////////////// WIN SCREEN
   case 11: 
   background (winImage);
   stop();
   break;
  }
  
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      P1.isMovingUp = false;
    }
    if (keyCode == DOWN) {
      P1.isMovingDown = false;
    }
    if (keyCode == LEFT) {
      P1.isMovingLeft = false;
    }
    if (keyCode == RIGHT) {
      P1.isMovingRight = false;
    }
  }
}


void keyPressed () {
  if (key ==CODED) {
    if (keyCode == UP) {
      P1.isMovingUp= true;
    }
    if (keyCode == DOWN) {
      P1.isMovingDown = true;
    }
    if (keyCode == LEFT) {
      P1.isMovingLeft = true;
    }
    if (keyCode == RIGHT) {
      P1.isMovingRight = true;
    }
  }
  if (key == 'r'){
    state = 0;
  }
}
