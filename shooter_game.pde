//player
Player p;

//count down to new enemy spawning
int newEnemyTimer;

//goes down as enemies spawn
//makes them spawn faster
int newEnemyTime = 100;

//stores bullets
ArrayList<Bullet> bullets;

//stores enemies
ArrayList<Enemy> enemies;

//score
int score = 0;


void setup(){
  //long and skinny game screen
  size(1400,300);
  
  //create player
  p = new Player();
  
  //set up arraylists
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
}

void draw(){
  //if the countdown reaches 0
  if(newEnemyTimer==0){
    //reset the timer depending on the difficulty
    newEnemyTimer=newEnemyTime;
    
    //if enemy spawn time is above the minimum
    if(newEnemyTime>30){
      //decrease enemy spawn time
      newEnemyTime--;
    }
    
    //type of enemy being spawned
    int type;
    
    //if 60 enemies have spawned
    if(newEnemyTime<40){
      //could be any type
      type = (int)random(4);
    }
    //if 30 have spawned
    else if(newEnemyTime<70){
      //first 3 types only
      type = (int)random(3);
    }
    //if 10 have spawned
    else if(newEnemyTime<90){
      //introduce type 2
      type = (int)random(2);
    }
    //otherwise
    else{
      //basic enemy
      type = 0;
    }
    
    //choose left or right side of screen
    if(random(10)<5){
      //left side
      //x = 0
      //y is random
      //moving right
      //moving up
      enemies.add(new Enemy(0,(int)random(height),1,-1,type));
    }
    else{
      //right side
      //x = width
      //y is random
      //moving left
      //moving down
      enemies.add(new Enemy(width,(int)random(height),-1,1,type));
    }
  }
  
  //decrease time until new enemy spawns
  newEnemyTimer--;
  
  //make the background black
  background(0);
  
  //draw player
  p.display();
  
  //for each bullet
  for(int i = 0; i < bullets.size(); i++){
    Bullet B = bullets.get(i);
    
    //draw the bullet
    B.display();
    
    //if the bullet has left the screen
    if(B.x<0 || B.x>width){
      //remove the bullet
      bullets.remove(B);
    }
  }
  
  //for each enemy
  for(int i = 0; i < enemies.size(); i++){
    Enemy E = enemies.get(i);
    
    //draw the enemy
    E.display();
    
    //if it is a type 1 or a type 2 (invincible to bullets)
    //and it has left the screen
    if((E.type == 1 || E.type == 2) && (E.x<0 || E.x>width)){
      //the enemy is dead
      enemies.remove(E);
      //increase score
      score++;
    }
    //if it is not dead
    else{
      //check for each bullet
      for(int b = 0; b < bullets.size(); b++){
        Bullet B = bullets.get(b);
        //if the bullet has hit the enemy
        if(dist(B.x,B.y,E.x,E.y)<E.size+B.size){
          //if the enemy can be killed by bullets (type 0 or type 3)
          if(E.type == 0 || E.type == 3){
            //remove the enemy
            enemies.remove(E);
            //increase the score
            score++;
          }
          //remove the bullet
          bullets.remove(B);
        }
      }
    }
    //if the enemy touches the player
    if(dist(p.x,p.y,E.x,E.y)<E.size+p.size){
      //end the game
      noLoop();
    }
  }
  
  //show the score in the top left
  textSize(50);
  fill(255);
  text("SCORE: "+score,30,70);
  
}

//if a button is pressed
void keyPressed(){
  //move in the direction, or shoot
  p.move(key);
}

//if a button is released
void keyReleased(){
  //stop moving in the direction
  p.noMove(key);
}
