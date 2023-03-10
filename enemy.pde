//enemy class

class Enemy{
  //image
  PImage img;
  //position
  int x;
  int y;
  //velocity
  int vx;
  int vy;
  //speed
  int step = 3;
  //size
  int size = 20;
  //type of enemy
  int type;
  
  //set up using position, velocity, and type
  Enemy(int x_, int y_, int vx_, int vy_, int type_){
    //set up position
    x = x_;
    y = y_;
    //set up velocity
    vx = vx_;
    vy = vy_;
    //set up type
    type = type_;
    
    //if they are type two
    if(type == 2){
      //do not move up or down
      vy = 0;
    }
    //if they are type 3
    if(type == 3){
      //move twice as fast
      vx*=2;
      vy*=2;
    }
    
    //load image
    img = loadImage("alien.png");
  }
  
  void display(){
    //different colour for each type
    switch(type){
      //enemy 0
      case 0:
        //no colour
        noTint();
        break;
      //enemy 1
      case 1:
        //pink
        tint(255,20,150);
        break;
      //enemy 2
      case 2:
        //blue
        tint(0,0,255);
        break;
      //enemy 3
      case 3:
        //green
        tint(0,255,0);
        break;
    }
    //move in the direction, by the speed
    x = x+(vx*step);
    y = y+(vy*step);
    
    //if you leave the left of the screen
    //and you are able to turn around (not type 1 or 2)
    if(x<0 && type!=1 && type != 2){
      //move back into the screen
      x = 0;
      //change direction
      vx = vx*-1;
    }
    //if you leave the right of the screen
    //and you are able to turn around (not type 1 or 2)
    if(x>width && type!=1 && type != 2){
      //move back into the screen
      x = width;
      //change direction
      vx = vx *-1;
    }
    //if you leave the top of the screen
    if(y<0){
      //move back into the screen
      y = 0;
      //change direction
      vy = vy*-1;
    }
    //if you leave the bottom of the screen
    if(y>height){
      //move back into the screen
      y = height;
      //change direction
      vy = vy *-1;
    }
    //center the image on the position
    imageMode(CENTER);
    //draw enemy
    image(img,x,y,size*2,size*2);
    //remove any colour tint
    noTint();
  }
}
