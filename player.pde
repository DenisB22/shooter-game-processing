//player class

class Player {
  //image
  PImage img;
  //velocity
  int xv;
  int yv;
  //position
  int x;
  int y;
  //speed
  int step = 5;
  //size
  int size = 30;

  // constructor
  public Player() {
    //put player in the middle of the screen
    x = width/2;
    y = height/2;
    
    //load image
    img = loadImage("player.png");
  }

  public void display() {
    //move by velocity
    x = x+xv;
    y = y+yv;
    
    //if you are go past the left of the screen
    if(x<(2*size)){
      //move back into the screen
      x=(2*size);
      //stop moving left
      xv = 0;
    }
    //if you go above the top of the screen
    if(y<size){
      //move back into the screen
      y=size;
      //stop moving vertically
      yv = 0;
    }
    //if you leave to the right
    if(x>width-(2*size)){
      //come back
      x=width-(2*size);
      xv = 0;
    }
    
    //if you leave the bottom
    if(y>height-size){
      //come back in
      y=height-size;
      //stop trying to leave
      yv = 0;
    }
    //draw the player image
    imageMode(CENTER);
    image(img,x,y,size*4,size*3);
  }

  //if a key is pressed
  public void move(char k) {
    //set velocity to left
    if ( k == 'a') {
      xv = -step;
    }
    //set velocity to right
    if ( k == 'd') {
      xv = step;  
    }
    //set velocity to up
    if( k == 'w') {
      yv = -step; 
    }
    //set velocity to down
    if (k == 's') {
      yv = step; 
    }
    //shoot
    if(k == ' '){
      //add a new bullet on each side
      //with opposite velocities
      bullets.add(new Bullet(x+(size*2),y,1));
      bullets.add(new Bullet(x-(size*2),y,-1));
    }
  }
  
  //key is released
  public void noMove(char k) {
    //stop moving left
    if ( k == 'a' && xv<0) {
      xv = 0;
    }
    //stop moving right
    if ( k == 'd' && xv >  0) {
      xv = 0;  
    }
    //stop moving up
    if ( k == 'w' && yv<0) {
      yv = 0;
    }
    //stop moving down
    if ( k == 's' && yv >  0) {
      yv = 0;  
    }
  }
}
