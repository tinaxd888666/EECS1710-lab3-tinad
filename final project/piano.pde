import ddf.minim.*;

Minim minim;
AudioPlayer dao;
AudioPlayer re;
AudioPlayer mi;
AudioPlayer fa;
AudioPlayer so;
AudioPlayer la;
AudioPlayer xi;
AudioPlayer daoo;
AudioPlayer music;

boolean start_flag;
PImage start_background;

ArrayList<SymbolXY> symbolList = new ArrayList<SymbolXY>();
PImage symbol1,symbol2,symbol3,symbol4;

void setup(){
  size(800, 600);
  minim =  new Minim(this);
  dao = minim.loadFile("data/1.mp3", 2048);
  re = minim.loadFile("data/2.mp3", 2048);
  mi = minim.loadFile("data/3.mp3", 2048);
  fa = minim.loadFile("data/4.mp3", 2048);
  so = minim.loadFile("data/5.mp3", 2048);
  la = minim.loadFile("data/6.mp3", 2048);
  xi = minim.loadFile("data/7.mp3", 2048);
  daoo = minim.loadFile("data/1.mp3", 2048);
  
  start_background = loadImage("background.jpg");
  music = minim.loadFile("data/music.mp3");
  
  //音符加载
  symbol1 = loadImage("data/symbol1.png");
  symbol2 = loadImage("data/symbol2.png");
  symbol3 = loadImage("data/symbol3.png");
  symbol4 = loadImage("data/symbol4.png");
  
  //随机生成运动的音符
  symbolList.add(new SymbolXY("symbol1",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
  symbolList.add(new SymbolXY("symbol1",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
  symbolList.add(new SymbolXY("symbol2",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
  symbolList.add(new SymbolXY("symbol2",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
  symbolList.add(new SymbolXY("symbol3",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
  symbolList.add(new SymbolXY("symbol3",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
  symbolList.add(new SymbolXY("symbol4",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
  symbolList.add(new SymbolXY("symbol4",new PVector(random(0.2, 0.8)*width,random(0.2, 0.8)*height),random(0.5,1)));
}

void draw(){
  if(start_flag){
    //music.pause();
    showMain();
  
  }else{
    showStart();
  }
}

void showStart(){
  background(start_background);
  music.play();
  //更新随机运动的音符
  for(SymbolXY xy:symbolList){
    switch(xy.getName()){
      case "symbol1":image(symbol1,xy.getVector().x,xy.getVector().y,65,65);break;
      case "symbol2":image(symbol2,xy.getVector().x,xy.getVector().y,65,65);break;
      case "symbol3":image(symbol3,xy.getVector().x,xy.getVector().y,65,65);break;
      case "symbol4":image(symbol4,xy.getVector().x,xy.getVector().y,65,100);break;
    }
    xy.setVector(new PVector(xy.getVector().x+xy.getX(),xy.getVector().y+xy.getY()));
    //边界检测
    if((xy.getVector().x+xy.getX())<0 || xy.getVector().x+xy.getX()>width){
      xy.setX(-1*xy.getX()); 

    }
    if((xy.getVector().y+xy.getY())<0 || xy.getVector().y+xy.getY()>width){
      xy.setY(-1*xy.getY()); 
    }
  }
}

void showMain(){
  background(#F5DC99);
  
  fill(#000000);
  rect(150, 200, 560, 70);
  
  fill(#FFFFFF);
  rect(150, 270, 560, 160);
  
  fill(#FFFFFF);
  noStroke();
  rect(150, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(190, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(230, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(270, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(310, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(350, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(390, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(430, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(470, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(510, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(550, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(590, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(630, 270, 40, 160);
  fill(#FFFFFF);
  noStroke();
  rect(670, 270, 40, 160);
  
  stroke(#000000);
  line(190, 270, 190, 430);
  stroke(#000000);
  line(230, 270, 230, 430);
  stroke(#000000);
  line(270, 270, 270, 430);
  stroke(#000000);
  line(310, 270, 310, 430);
  stroke(#000000);
  line(350, 270, 350, 430);
  stroke(#000000);
  line(390, 270, 390, 430);
  stroke(#000000);
  line(430, 270, 430, 430);
  stroke(#000000);
  line(470, 270, 470, 430);
  stroke(#000000);
  line(510, 270, 510, 430);
  stroke(#000000);
  line(550, 270, 550, 430);
  stroke(#000000);
  line(590, 270, 590, 430);
  stroke(#000000);
  line(630, 270, 630, 430);
  stroke(#000000);
  line(670, 270, 670, 430);
  
  fill(#000000);
  rect(177, 270, 25, 110);
  fill(#000000);
  rect(217, 270, 25, 110);
  fill(#000000);
  rect(297, 270, 25, 110);
  fill(#000000);
  rect(337, 270, 25, 110);
  fill(#000000);
  rect(377, 270, 25, 110);
  fill(#000000);
  rect(457, 270, 25, 110);
  fill(#000000);
  rect(497, 270, 25, 110);
  fill(#000000);
  rect(577, 270, 25, 110);
  fill(#000000);
  rect(617, 270, 25, 110);
  fill(#000000);
  rect(657, 270, 25, 110);
  
  stroke(#000000);
  strokeWeight(1.1);
  line(150, 90, 710, 90);
  stroke(#000000);
  strokeWeight(1.1);
  line(150, 100, 710, 100);
  stroke(#000000);
  strokeWeight(1.1);
  line(150, 110, 710, 110);
  stroke(#000000);
  strokeWeight(1.1);
  line(150, 120, 710, 120);
  stroke(#000000);
  strokeWeight(1.1);
  line(150, 130, 710, 130);
}

void keyPressed(){
  
  if(key == ENTER){
    start_flag = true;
    music.pause();
  }
  
  if(!start_flag){
    return;
  }

  
  if(key == '1'){
    dao.rewind();
    dao.play();
    fill(#B4B4B4);
    rect(150, 270, 40, 160);
  }
  
  if(key == '2'){
    re.rewind();
    re.play();
    fill(#B4B4B4);
    rect(230, 270, 40, 160);
  }
  
  if(key == '3'){
    mi.rewind();
    mi.play();
    fill(#B4B4B4);
    rect(670, 270, 40, 160);
  }
  
  if(key == '4'){
    fa.rewind();
    fa.play();
    fill(#B4B4B4);
    rect(430, 270, 40, 160);
  }
  
  if(key == '5'){
    so.rewind();
    so.play();
    fill(#B4B4B4);
    rect(350, 270, 40, 160);
  }
  
  if(key == '6'){
    la.rewind();
    la.play();
    fill(#B4B4B4);
    rect(270, 270, 40, 160);
  }
  
  if(key == '7'){
    xi.rewind();
    xi.play();
    fill(#B4B4B4);
    rect(550, 270, 40, 160);
  }
  
  if(key == '8'){
    daoo.rewind();
    daoo.play();
    fill(#B4B4B4);
    rect(390, 270, 40, 160);
  }
}
