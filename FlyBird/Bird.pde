class Bird{
  
  PImage birdImg, birdImg2;
  PVector position;
  boolean sign =false;
  
  Bird(float x, float y){
    position = new PVector(x, y);
  }
  
  void update() {
    birdImg = loadImage("bird.png");
    birdImg2 = loadImage("bird2.png");
    while(true){
      float x = position.x-3;
      float y = position.y;
      if(x < 0){
        x = 1100;
        sign = false;
      }
      if(x > 610 && x <620){
        //image(birdImg, position.x, position.y);
        try{
        Thread.sleep(100);
        }catch(Exception e){
        };
        if(!sign){
          sign = true;
        };
      }
      position = new PVector(x, y);
      //try{
      //  Thread.sleep(1000l);
      //}catch(Exception e){
      //};
      imageMode(CENTER);
      image(sign ? birdImg2:birdImg, position.x, position.y);
      break;
    }
  }
  
  //void draw() {    
  //  ellipseMode(CENTER);
  //  rectMode(CENTER);
  //  imageMode(CENTER);
  //  image(birdImg, position.x, position.y);
  //}
  
   void run() {
    update();
  }
}
