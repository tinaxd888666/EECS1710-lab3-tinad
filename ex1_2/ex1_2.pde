int c=0;

void setup(){
  
  size(600,600);
  //background(c);
  frameRate(30);

}
void draw(){
  c++;
  background(c);
    fill(255,0,0);
  ellipse(random(0,500),random(0,500),25,25);
  
  stroke(0,100,0);
  strokeWeight(20);
  fill(255,200,200);
  rect(random(0,600),random(0,600),100,100);
}
