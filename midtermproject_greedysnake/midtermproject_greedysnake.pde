int backgroundColor = 244;
int snakeLength = 2;    
int snakeHeadX;         
int snakeHeadY;
char snakeDirection = 'R'; 
char snakeDirectionTemp;
int pause = 0;             

int w=20;   

int maxSnakeLength = 400;
int[] x = new int [maxSnakeLength];
int[] y = new int [maxSnakeLength];

boolean foodKey = true;
int foodX;
int foodY;

int bestScore = snakeLength;
boolean gameOverKey = false;

int savedTime; 
int totalTime;
int passedTime;

void setup(){
    size(500,500);
    frameRate(30);
    noStroke();
    savedTime = millis(); 
}

int speed = 5;  

void draw(){
    totalTime = 1000/speed; 
    passedTime = millis()- savedTime;

    if ( snakeDirection!='P' && passedTime > totalTime ) {
        if(isGameOver() ){
            speed = 5;  
            return;
        }

        background(backgroundColor);

        switch(snakeDirection){
            case 'L':
                snakeHeadX -= w;
                break;
            case 'R':
                snakeHeadX += w;
                break;
            case 'D':
                snakeHeadY += w;
                break;
            case 'U':
                snakeHeadY -= w;
                break;

        }

       
        drawFood(width,height);

       
        if( snakeHeadX == foodX && snakeHeadY == foodY){
            snakeLength++;
            
            speed ++;
            speed = min(15,speed);  
            foodKey = true;
        }
        for(int i=snakeLength-1; i>0; i--){
            x[i] = x[i-1];
            y[i] = y[i-1];
        }

        y[0] = snakeHeadY;
        x[0] = snakeHeadX;

        stroke(0);  
        strokeWeight(1);   

        fill(#ED1818);
        rect(x[0],y[0],w,w);

        fill(#7B6DB7);
        for(int i=1; i<snakeLength; i++){
            rect(x[i],y[i],w,w);
        }

        if(snakeDirection!='P' && isSnakeDie()){
            return;
        }

        savedTime = millis();
    }

}
void keyPressed() {
    if(key == 'p' || key == 'P'){
        pause++;
        if(pause%2==1){
            snakeDirectionTemp = snakeDirection;
            snakeDirection = 'P';
        }else{
            snakeDirection = snakeDirectionTemp;
        }

    }
    if(snakeDirection != 'P' && key == CODED){
        switch(keyCode){
            case LEFT:
                snakeDirection = 'L';
                break;
            case RIGHT:
                snakeDirection = 'R';
                break;
            case DOWN:
                snakeDirection = 'D';
                break;
            case UP:
                snakeDirection = 'U';
                break;
        }
    }else if(snakeDirection != 'P'){
        switch(key){
            case 'A':
            case 'a':
                snakeDirection = 'L';
                break;
            case 'D':
            case 'd':
                snakeDirection = 'R';
                break;
            case 'S':
            case 's':
                snakeDirection = 'D';
                break;
            case 'W':
            case 'w':
                snakeDirection = 'U';
                break;
        }
    }else{
        ;
    }
}   

void snakeInit(){
    background(backgroundColor);
    snakeLength = 2;
    gameOverKey = false;
    snakeHeadX = 0;
    snakeHeadY = 0;
    snakeDirection = 'R';
}

void drawFood(int maxWidth, int maxHeight){
    fill(#ED1818);
    if(foodKey){
        foodX = int( random(0, maxWidth)/w ) * w;
        foodY = int( random(0, maxHeight)/w) * w;
    }
    rect(foodX, foodY, w, w);
    foodKey = false;
}

boolean isGameOver(){
    if(gameOverKey && keyPressed && (key=='r'||key=='R') ){
        snakeInit();
    }
    return gameOverKey;
}

boolean isSnakeDie(){
    
    if(snakeHeadX<0 || snakeHeadX>=width || snakeHeadY<0 || snakeHeadY>=height){
        showGameOver();
        return true;
    }

    if(snakeLength>2){
        for(int i=1; i<snakeLength; i++){
            if(snakeHeadX==x[i] && snakeHeadY == y[i]){
                showGameOver();
                return true;
            }
        }
    }

    return false;
}

void showGameOver(){
    pushMatrix();
    gameOverKey = true;
    bestScore = bestScore > snakeLength ? bestScore : snakeLength;

    background(0); 
    translate(width/2, height/2 - 50);
    fill(255); 
    textAlign(CENTER);  
    textSize(84);
    text(snakeLength + "/" + bestScore, 0, 0);

    fill(120);
    textSize(18);
    text("Score / best",0,230);
    text("Game Over, Press 'R' to restart.", 0, 260);

    popMatrix();
}
