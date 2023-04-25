class ParkingSpace {
   float x;
  float y;
  float w;
  float h;
  
   float spaceL ;
   float spaceR ;
   float spaceT ;
    float spaceB;
  
  ParkingSpace(){
    x = random( 50, width - w*2);
    y = random(w, 500); 
    w = 125;
    h = 70;
    
        spaceL = x - w/2;
    spaceR = x + w/2;
    spaceT = y - h/2;
    spaceB = y + h/2;

  }
    void render(){
    stroke (255);
    strokeWeight (20);
    noFill();
    rect (x,y, w, h);
    strokeWeight (5);
  }
  
  
}
