class Object {
  //////////////
  //Class vars//
  //////////////

  int x;
  int y;
  int d;
  color aColor;
  int speed;

  // represents the time we start the stopwatch
  int startTime;
  //represents the time we press the lap button
  int currentTime;
  // repreents the time between timer triggers
  int interval = 2000;

  ////hit box vars
  int circleL;
  int circleR;
  int circleT;
  int circleB;


int imageIndex = int (random(1, 3));

  //////////////
  //Constructor//
  //////////////

  Object () {
    d = int (random (20, 100));
    x = 0;
    y = int (random (d * 2, height -  200));

    aColor = color (int (random (0, 255)), int (random (0, 255)), int (random (0, 255)));
    speed = int (random (1,3));

    circleL = x - d/2;
    circleR = x + d/2;
    circleT = y - d/2;
    circleB = y + d/2;
  }
  //////////////////////
  //function definitions//
  ///////////////////////

  void render() {
    //fill(aColor);
    //circle(x, y, d);
    if (imageIndex == 1){
      image(cowImage, x, y);
    }
    if (imageIndex == 2) {
      image (deerImage, x, y);
    }
       if (imageIndex == 3) {
//skunkAnimation();
    }
  }

  /*
This function takes updates the position the ball according to its speed.
   */
  void move() {
    circleL = x - d/2;
    circleR = x + d/2;
    circleT = y - d/2;
    circleB = y + d/2;

    x += speed;
  }
  void wallDetect() {

    // wall detection for top wall
    if (x + d/2 >= width) {
      x = 0;
    }
  }
}
