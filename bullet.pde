//bullet class

class Bullet{
  //immage
  PImage img;
  //position
  int x;
  int y;
  //velocity, left or right
  int v;
  //speed
  int step = 10;
  //size
  int size = 5;
  
  // set up using position and velocity
  Bullet(int x_,int y_,int v_){
    x = x_;
    y = y_;
    v = v_;
    //load image of bullet
    img = loadImage("bullet.png");
  }
  
  void display(){
    //move the right distance in the right direction
    x = x+(v*step);
    
    //draw bullet
    imageMode(CENTER);
    image(img,x,y,size*2,size*2);
  }
  
  
}
