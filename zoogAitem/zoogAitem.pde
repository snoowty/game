abstract class Zoog {
  int x, y;
  boolean isLeftEyeBroken = false;
  boolean isRightEyeBroken = false;
  
  Zoog(int x0, int y0) {
    x = x0;
    y = y0;
  }
  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    stroke(0);
    fill(175);
    rect(x, y, 20, 100);
    stroke(0);
    fill(255);  
    ellipse(x, y-30, 60, 60);
    fill(0);
    if(isLeftEyeBroken == false){
    ellipse(x-19, y-30, 16, 32);
    }
    if(isRightEyeBroken == false){
    ellipse(x+19, y-30, 16, 32);
    }
    stroke(0);
    line(x-10, y+50, x-20, y+60);
    line(x+10, y+50, x+20, y+60);
  }
  
  abstract void move();
  
  void hit(int hx, int hy) {
    if((hx-x+19)*(hx-x+19)/64+(hy-y+30)*(hy-y+30)/256 <= 1){
      isLeftEyeBroken = true;
    }
    if((hx-x-19)*(hx-x-19)/64+(hy-y+30)*(hy-y+30)/256 <= 1){
      isRightEyeBroken = true;
    }   
  }
  
  boolean isDead() {
    if(isLeftEyeBroken == true && isRightEyeBroken == true){
      return true;
    }else if(isLeftEyeBroken == false || isRightEyeBroken == false){
      return false;
    }
    return false;
  }
  
}

class NormalZoog extends Zoog{
  NormalZoog(int x0, int y0) {
    super(x0, y0);
  }
  
  void move(){
    x += 1;
    y += 1;
  }
}

class StoppingZoog extends Zoog {
  StoppingZoog(int x0, int y0) {
    super(x0, y0);
  }
  
  void move(){
  }
  
}

class SmartZoog extends Zoog{
  SmartZoog(int x0, int y0) {
    super(x0, y0);
  }
  
  void move(){
    if(dist(x, y, mouseX, mouseY) <= 50){
      x = x + int(random(-20,20));
      y = y + int(random(-20,20));
    }
  }
  
  void secondmove() {
  }
}

NormalZoog zoog1;
SmartZoog zoog2;
StoppingZoog zoog3;

StoppingAitem aitem;

void setup() {
  size(600, 400);
  frameRate(50);
  
  zoog1 = new NormalZoog(100, 100);
  zoog2 = new SmartZoog(200, 100);
  zoog3 = new StoppingZoog(300, 100);
  
  aitem = new StoppingAitem();
  
}

void showTimer() {
   text(nf(limit,1,1), 20, 20);
   limit = limit - 0.02;
   if(limit < 0.0){
     noLoop();
   }
}

void showWinningMessage(){
    background(0);
    
    textSize(32);
    textAlign(CENTER);
    fill( random(255), random(255), random(255));
    text("You won!", width/2, height/2);
}

float limit = 20;
void draw() {
  background(128);
     
  showTimer();
     
  if(zoog1.isDead() == false){
    zoog1.display();
    zoog1.move();
  }
  if(zoog2.isDead() == false){
    zoog2.display();
    if(aitem.click() == false){
    zoog2.move();
    }else{
    zoog2.secondmove();
    }
  }
  if(zoog3.isDead() == false){
  zoog3.display();
  zoog3.move();
  }
  if(zoog1.isDead() == true && zoog2.isDead() == true && zoog3.isDead() == true){
    showWinningMessage();
    noLoop();
  }
  
  
}

void mouseClicked() {
  zoog1.hit(mouseX, mouseY);
  zoog2.hit(mouseX, mouseY);
  zoog3.hit(mouseX, mouseY);
}
