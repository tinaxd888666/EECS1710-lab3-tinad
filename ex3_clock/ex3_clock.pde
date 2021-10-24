Boolean flag = true;

void setup () {
  size(500, 500);
  background(186,165,237);
}

class Time {
  int currentSecond; 
  int currentMinute; 
  int currentHour;  
  float currentMinuteFloat; 
  float currentHourFloat; 

  Time(int s, int m, int h, float mf, float hf) {
    currentSecond = s;
    currentMinute = m;
    currentHour = h;
    currentMinuteFloat = mf;
    currentHourFloat = hf;
  }

}

void draw () {
  int s = second();
  int m = minute();
  int y = hour();
  float mf = minute() + s / 60.0;
  float hf = hour() + mf / 60.0;
  Time time = new Time(s, m, y, mf, hf);

  drawClock();
  showDate();  
  hourPointer(time);
  minutePointer(time);  
  secondPointer(time);
}

void drawClock() {
  ellipseMode(CENTER);
  strokeWeight(10);
  stroke(0);
  fill(255);
  ellipse(width/2, height/2, 270, 270); 

  for (int i = 1; i <= 60; i++) {
    pushMatrix(); 
    translate(width/2, height/2);  
    rotate(radians(i * 6));
    if (i % 5 == 0) { 
      strokeWeight(3);
      line(120, 0, 130, 0);
    } else { 
      strokeWeight(1);
      line(125, 0, 130, 0);
    }
    popMatrix(); 
  }

  textSize(25);
  fill(0);
  stroke(255);
  strokeWeight(1);
  text(12, 235, 155); 
  text(3, 350, 260) ;
  text(9, 135, 260) ;
  text(6, 245, 365) ;
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    flag = true;
  } else if (key=='t' || key=='T') {
    flag = false;
  }
}

void showDate() {
  String currentDate = year() + "-" + month() + "-" + day();
  textSize(25);
  text(currentDate, width - 310, 80);
}

void hourPointer(Time time) {
  pushMatrix();
  translate(width/2, height/2);
  float angleHour = radians(270);
  if ((time.currentHourFloat >= 3 && time.currentHourFloat <= 12) || (time.currentHourFloat >= 15 && time.currentHourFloat <= 24)) {
    angleHour = radians(30 * (time.currentHourFloat - 3));
  } else {
    angleHour = radians(30 * (time.currentHourFloat - 1) + 300);
  }
  if (flag) { 
    rotate(angleHour);
  } else {
    rotate(radians(270));
  }
  stroke(0);
  strokeWeight(6.5);
  line(0, 0, 70, 0);
  popMatrix();
}


void minutePointer(Time time) {
  pushMatrix();
  translate(width/2, height/2);
  float angleMinute = radians(270);
  if ((time.currentMinuteFloat >= 0 && time.currentMinute <= 15)) {
    angleMinute = radians(270 + 6 * time.currentMinuteFloat);
  } else {
    angleMinute = radians(6 * (time.currentMinuteFloat - 15));
  }
  if (flag) { 
    rotate(angleMinute);
  } else {
    rotate(radians(0));
  }
  stroke(0);
  strokeWeight(4);
  line(0, 0, 90, 0);
  popMatrix();
}

void secondPointer(Time time) {
  pushMatrix();
  translate(width/2, height/2);
  float angleSecond = radians(270);
  if ((time.currentSecond >= 0 && time.currentSecond <= 15)) {
    angleSecond = radians(270 + 6 * time.currentSecond);
  } else {
    angleSecond = radians(6 * (time.currentSecond - 15));
  }
  if (flag) { 
    rotate(angleSecond);
  } else {
    rotate(radians(180));
  }
  stroke(0, 0, 0);
  strokeWeight(1.5);
  line(0, 0, 115, 0);
  fill(255, 0, 0);
  popMatrix();
}
