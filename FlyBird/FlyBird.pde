int window_height = 600;
int window_width  = 1200;
int game_status=0;
Bird bird = new Bird(window_width-100, window_height/2-70);
void settings(){
  //fullScreen();
  size(window_width,window_height);
}
void setup() {
  
}

void draw() {
  background(#2980b9);
  //gameRun();
  switch(game_status) {
  case 0:
    initialScreen();
    break; 
  case 1:
    gameRun();
    break;
  }
}

void initialScreen() {
  textSize(60);
  text("Fly Bird", width/3 + 100, height/2-100);
  textSize(30);
  text("Press <SPACE> to play!", width/3+50, height/2+100);
  
}

void gameRun() {
  PImage smallBird = loadImage("small.png");
  image(smallBird, width/3 + 100, height/2+50);
  bird.run();
}



void keyPressed() {
  if (game_status == 0) {
    game_status++;
  }else{
    game_status = 0;
  }
}
