Zhen [] zhens = new Zhen[100];
int num = 1;
float rspeed = 1.5;
int level = 20,need = level;
boolean gameBegin = false,win = false , lose = false,gameOver = false;
int count =0;
void setup()
{
  size(500,800);
  zhens[0]=new Zhen(num);
}
void draw()
{
  translate(width/2,height/2.5);
  if(keyPressed && key == 'r' && gameBegin ==false)
  {
    gameBegin = true;
  }
  if(gameBegin ==false)
  {
    showBegin();
    return;
  }
  if(win)
  {
    count+=1;
    if(count>10)
    {
    showWin();gameOver=true;
    }
  }
  if(lose)
  {
    count+=1;
    if(count >10){
    showLose();gameOver=true;
    }
  }
  if(keyPressed && key == 'r')
  {
    gameOver = false;
  }
  if(gameOver)
  {
    return;
  }
  
  background(255);
  zhens[0].display();
  for(int i = 1;i<num-1;i++)
  {
    zhens[i].display();
  }
 if(num>1 && zhens[num-2].xuanzhuan())
 {
   need = level-num+1;
   zhens[num-1].display();
 }
  if(num>1 && zhens[num-2].xuanzhuan())
  {
    for(int i = 0;i<num-2;i++)
   {
     if(abs(zhens[i].Zhen_angle-zhens[num-2].Zhen_angle)<8)
     {
       zhens[i].c=#FF0000;
       zhens[num-2].c=#FF0000;
       lose = true;
     }
   }
    if(need <= 0 && !lose)
    {
      win = true;
    }
  }
  
  
  noStroke();
  fill(0);
  ellipse(0,0,160,160);
  
  textAlign(CENTER);
  textSize(50);
  fill(255);
  need = level-num+1;
  text(need,0,23);
  textAlign(LEFT);
  textSize(50);
  fill(0);
  text("Level:"+level,-width/5,-height/4);
}
void mouseClicked()
{
  zhens[num-1].speed = 30;
  num++;
  zhens[num-1] = new Zhen(num);
 
}
class Zhen
{
  int num;
  float x,y;
  int w=2,l=120,r=20;
  int c = #000000;
  float speed,Zhen_angle=0;
  Zhen(int num)
  {
    x = 0;
    y = 350;
    this.num = num;
    speed = 0;
  }
  void display()
  {
    if( !xuanzhuan())
    {
    
      noStroke();
      fill(c);
      rectMode(CENTER);
      rect(x,y,w,l);
      ellipse(x,y+l/2,r,r);
      textAlign(CENTER);
      fill(255);
      textSize(15);
      text(num,x,y+l/2+5);
      y-=speed;
    }else
    {
      pushMatrix();
      rotate(radians(Zhen_angle));
      noStroke();
      fill(c);
      rectMode(CENTER);
      rect(x,y,w,l);
      ellipse(x,y+l/2,r,r);
      textAlign(CENTER);
      fill(255);
      textSize(15);
      text(num,x,y+l/2+5);
      popMatrix();
      Zhen_angle+=rspeed;
      Zhen_angle=Zhen_angle%360;
    }
  }
  boolean xuanzhuan()
  {
    if(y<=70+l/2)return true;
    else return false;
  }
}
void showBegin()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(35);
  text("Amazing Circle",0,-50);
  text("level "+level,0,0);
  textSize(20);
  text("Press r to start",0,50);
}
void showWin()
{
  win = false;
  fill(0,0,255,80);
  rect(0,0,width,2*height);
  textAlign(CENTER);
  fill(255);
  textSize(35);
  text("YOU WIN!",0,0);
  level +=1;
  text("Press r to continue level "+ level,0,50);
  num = 1;
  need = level;
  zhens = new Zhen[100];
  zhens[0]=new Zhen(num);
  count = 0;
}
void showLose()
{
  lose = false;
  fill(255,0,0,80);
  rect(0,0,width,2*height);
  textAlign(CENTER);
  fill(255,0,0);
  textSize(35);
  text("You lost!",0,0);
  text("Press r to continue Level "+ level,0,50);
  num=1;
  zhens = new Zhen[100];
  zhens[0]=new Zhen(num);
  count=0;
}
