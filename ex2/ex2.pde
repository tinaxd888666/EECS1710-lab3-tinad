PImage img1, img2;

void setup(){
  
  size(600,600);
  img1 = loadImage("download.jpg");
  img2 = loadImage("download-2.jpg");
  

}
void draw(){
  
 imageMode(CORNER);
 image(img1, 0, 0, width, height);

  imageMode(CENTER);
  image(img2, mouseX, mouseY, 40, 40);
  
}
