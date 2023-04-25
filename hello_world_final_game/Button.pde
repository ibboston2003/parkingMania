class Button{
   //////////////
  //Class vars//
  //////////////
  
  int x;
  int y;
  int size;
  color c;
  boolean isPressed = false;
   //////////////
  //Constructor//
  //////////////
  
  Button(int startingX, int startingY, int startingSize, 
  color startingC)
  {
    x = startingX;
    y = startingY;
    size = startingSize;
    c = startingC;
   }
    //////////////////////
  //function definitions//
  ///////////////////////
  
    void renderPlay() {
   image (playButtonImage, x, y);
  }
  
    void renderHome() {
   image (homeButtonImage, x, y);
  }
      void renderLevel() {
   image (levelButtonImage, x, y);
  }

boolean isPressed (){
  if (mouseX >= x && mouseX <= x + size && 
  mouseY >= y && mouseY <= y + size && mousePressed) {
    return true;
    
}
else {
return false;
}
}

}
 
