void setup() {
size(500, 500);  //Set the size of the window

//Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);

background(255);  //Draw a white background
frameRate(10);

}

int x = 70;  //zoog1
int y = 170;  //zoog1
int x2 = 200;  //zoog2
int y2 = 200;  //zoog2
int x3 = 300;  //zoog3
int y3 = 300;  //zoog3

//color RGB
float right1_eye,right2_eye,right3_eye = 0;  //Zoog1 eye
float left1_eye,left2_eye,left3_eye = 0;  //Zoog1 eye
float right1_eye2,right2_eye2,right3_eye2 = 0;  //Zoog2
float left1_eye2,left2_eye2,left3_eye2 = 0;  //Zoog2
float right1_eye3,right2_eye3,right3_eye3 = 0; //zoog3
float left1_eye3,left2_eye3,left3_eye3 = 0;  //zoog3

//zoog1
int body_st = 0;
int body_fi = 150;  
int head = 255;
int leg = 0;

//zoog2
int body_st2 = 0;
int body_fi2 = 150;  
int head2 = 255;
int leg2 = 0;

//zoog3
int body_st3 = 0;
int body_fi3 = 150;  
int head3 = 255;
int leg3 = 0;

float limit = 20;  //timer
int live = 3;  //zoog count

//hit point
int hit1_ri = 3;  //zoog1 right
int hit1_le = 3;  //zoog1 left
int hit2_ri = 2;  //zoog2
int hit2_le = 2;  //zoog2
int hit3_ri = 4;  //zoog3
int hit3_le = 4;  //zoog3

void draw(){
  background(255);
  PFont f;
  f = createFont("Helvetica", 16, true);
  
  text(nf(limit,1,1), 20, 20);  //limit time
  limit = limit - 0.1;
  if(limit < 0.0){
    exit();
  }
  
  text(live, 260, 20);  //zoog count
  
  //Zoog1
//Draw Zoog`s body
stroke(body_st);
fill(body_fi);
rect(x, y, 20, 100);

//Draw Zoog`s head
fill(head);
ellipse(x, y-30, 60, 60);

//Draw Zoog`s eyes

fill(left1_eye,left2_eye,left3_eye);
ellipse(x-19, y-30, 16, 32);
fill(right1_eye,right2_eye,right3_eye);
ellipse(x+19, y-30, 16, 32);

//Draw Zoog`s legs
fill(leg);
stroke(leg);
line(x-10, y+50, x-20, y+60);
line(x+10, y+50, x+20, y+60);

  //Zoog2
//Draw Zoog`s body
stroke(body_st2);
fill(body_fi2);
rect(x2, y2, 20, 100);

//Draw Zoog`s head
fill(head2);
ellipse(x2, y2-30, 60, 60);

//Draw Zoog`s eyes

fill(left1_eye2,left2_eye2,left3_eye2);
ellipse(x2-19, y2-30, 16, 32);
fill(right1_eye2,right2_eye2,right3_eye2);
ellipse(x2+19, y2-30, 16, 32);

//Draw Zoog`s legs
fill(leg2);
stroke(leg2);
line(x2-10, y2+50, x2-20, y2+60);
line(x2+10, y2+50, x2+20, y2+60);

 //Zoog3
//Draw Zoog`s body
stroke(body_st3);
fill(body_fi3);
rect(x3, y3, 20, 100);

//Draw Zoog`s head
fill(head3);
ellipse(x3, y3-30, 60, 60);

//Draw Zoog`s eyes

fill(left1_eye3,left2_eye3,left3_eye3);
ellipse(x3-19, y3-30, 16, 32);
fill(right1_eye3,right2_eye3,right3_eye3);
ellipse(x3+19, y3-30, 16, 32);

//Draw Zoog`s legs
fill(leg3);
stroke(leg3);
line(x3-10, y3+50, x3-20, y3+60);
line(x3+10, y3+50, x3+20, y3+60);

//zoog1 move
if(limit >10){
x = x + 3;
y = y + 3;
}else{
  y = y-3;
}

//zoog2 move
if(limit > 17.0){
x2++;
y2--;
}else if(limit > 14.0){
  x2--;
  y2--;
}else if(limit > 12.0){
  x2 = 60;
  y2 = 160;
  x2++;
  y2++;
}else if(limit > 10.0){
  x2 = x2 + 4;
  y2 = y2 + 4;
}else if(limit > 8.0){
  x2 = x2 + 8;
  y2 = y2 + 7;
}else{
  x2--;
  y2--;;
}

//zoog3 move
x3++;
y3++;

//kill zoog1
if(hit1_ri == 0 && hit1_le == 0){
   body_st = 255;
   body_fi = 255;
   head = 255;
   leg = 255;
   x = 1000;
   y = 1000;
}

//kill zoog2
if(hit2_ri == 0 && hit2_le == 0){
   body_st2 = 255;
   body_fi2 = 255;
   head2 = 255;
   leg2 = 255;
   x2 = 1000;
   y2 = 1000;
}

//kill zoog3
if(hit3_ri == 0 && hit3_le == 0){
   body_st3 = 255;
   body_fi3 = 255;
   head3 = 255;
   leg3 = 255;
   x3 = 1000;
   y3 = 1000;
}
//you win
if(hit1_ri ==0 && hit1_le == 0 && hit2_ri == 0 && hit2_le <= 0 && hit3_ri == 0 && hit3_le == 0){
    background(255);
    textFont(f, 18);
    fill(#00ff00);
    
    text("You won!", 100, 100);
    limit = 100;  //limit stop
    
  }
}

void mouseClicked(){
  //zoog1
  if(dist(x+19, y-30, mouseX, mouseY) <= 20){  //Erase left eye
    if(hit1_ri == 0){
      right1_eye = 255;
      right2_eye = 255;
      right3_eye = 255;
    }else{
      right1_eye = random(255);
      right2_eye = random(255);
      right3_eye = random(255);
      hit1_ri--;
    }
    
  }
  if(dist(x-19, y-30, mouseX, mouseY) <= 20){  //Erase right eye
    if(hit1_le == 0){
      left1_eye = 255;
      left2_eye = 255;
      left3_eye = 255;
    }else{
      left1_eye = random(255);
      left2_eye = random(255);
      left3_eye = random(255);
      hit1_le--;
    }
  }
  
  //zoog2
   if(dist(x2+19, y2-30, mouseX, mouseY) <= 20){  //Erase left eye
    if(hit2_ri == 0){
      right1_eye2 = 255;
      right2_eye2 = 255;
      right3_eye2 = 255;
    }else{
      right1_eye2 = random(255);
      right2_eye2 = random(255);
      right3_eye2 = random(255);
      hit2_ri--;
    }
  }
  if(dist(x2-19, y2-30, mouseX, mouseY) <= 20){  //Erase right eye
    if(hit2_le == 0){
      left1_eye2 = 255;
      left2_eye2 = 255;
      left3_eye2 = 255;
    }else{
      left1_eye2 = random(255);
      left2_eye2 = random(255);
      left3_eye2 = random(255);
      hit2_le--;
    }
  }
  
  //zoog3
   if(dist(x3+19, y3-30, mouseX, mouseY) <= 20){  //Erase left eye
    if(hit3_ri == 0){
      right1_eye3 = 255;
      right2_eye3 = 255;
      right3_eye3 = 255;
    }else{
      right1_eye3 = random(255);
      right2_eye3 = random(255);
      right3_eye3 = random(255);
      hit3_ri--;
    }
  }
  if(dist(x3-19, y3-30, mouseX, mouseY) <= 20){  //Erase right eye
      
    if(hit3_le == 0){
      left1_eye3 = 255;
      left2_eye3 = 255;
      left3_eye3 = 255;
    }else{
      left1_eye3 = random(255);
      left2_eye3 = random(255);
      left3_eye3 = random(255);
      hit3_le--;
    }
  }
  
  //zoog count
  //kill zoog1
  /*
  if(left_eye == 255 && right_eye == 255){
    if(live == 3){
      live = 2;
    }else if(live == 2){
      live = 1;
    }else{
      live = 0;
    }
    
        
  }
  
  //kill zoog2
  if(left_eye2 == 255 && right_eye2 == 255){
     if(live == 3){
      live = 2;
    }else if(live==2){
      live = 1;
    }else{
      live = 0;
    }
  }
  
   //kill zoog3
  if(left_eye3 == 255 && right_eye3 == 255){
     if(live == 3){
      live = 2;
    }else if(live==2){
      live = 1;
    }else{
      live = 0;
    }
  }
  */
}