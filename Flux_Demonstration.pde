int rotatex = 0;
int rotatey = 0;
float xtheta = 0;
float ytheta = 0;
float rotateSpeed = 0.05;
int fieldSpacing = 100;
int fieldAlpha = 20;

void setup(){
  size(800, 800, P3D);
}

void draw(){
  
  xtheta += rotateSpeed*rotatex;
  ytheta += rotateSpeed*rotatey;
  translate(width/2, height/2);
  rotateX(xtheta);
  rotateY(ytheta);
  
  background(100, 100, 100);
  stroke(0);
  //box(40);
  
  
  //draw ground
  fill(255);
  pushMatrix();
  translate(0, 300, 0);
  rotateX(PI/2);
  rect(-300, -300, 600, 600);
  popMatrix();
  
  //draw wire
  fill(0);
  strokeWeight(3);
  line(-300, 0, 300, 0);
  
  //draw boxes through which magnetic field is going
  noFill();
  pushMatrix();
  translate(-100, 0, 100);
  rotateX(PI/2);
  rect(0, 0, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(0, 0, 100);
  rotateX(PI/2);
  rect(0, 0, 100, 50);
  popMatrix();
  
  
  //draw many circle outlines
  pushMatrix();
  
  //translate to start of wire (left side)
  translate(-300, 0, 0);
  rotateY(PI/2);
  for(int i = 0; i < 6; i++){
    noFill();
    
    //red inner
    stroke(255, 0, 0, fieldAlpha);
    ellipse(0, 0, fieldSpacing, fieldSpacing);
    
    //orange 2nd
    stroke(255, 165, 0, fieldAlpha);
    ellipse(0, 0, fieldSpacing*2, fieldSpacing*2);
    
    //green 3rd
    stroke(0, 255, 0, fieldAlpha);
    ellipse(0, 0, fieldSpacing*3, fieldSpacing*3);
    
    //blue 4th
    stroke(0, 0, 255, fieldAlpha);
    ellipse(0, 0, fieldSpacing*4, fieldSpacing*4);
    
    //translate along wire
    translate(0, 0, 600/5);
  }
  
  
  popMatrix();
}

void keyPressed(){
  if(key == 'a'){
    rotatey = -1;
  } else if(key == 'd'){
    rotatey = 1;
  } else if(key == 'w'){
    rotatex = 1;
  } else if(key == 's'){
    rotatex = -1;
  } else if(key == 'r'){
    fieldAlpha = 150;
  }
}

void keyReleased(){
  if(key == 'a'){
    rotatey = 0;
  } else if(key == 'd'){
    rotatey = 0;
  } else if(key == 'w'){
    rotatex = 0;
  } else if(key == 's'){
    rotatex = 0;
  } else if(key == 'r'){
    fieldAlpha = 20;
  }
}