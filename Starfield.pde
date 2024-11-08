Particle[] star = new Particle[151];
void setup()
{
  size(800,800);
  for(int i = 0; i < 150; i++)
  star[i] = new Particle();
  star[150] = new OddballParticle();
}
void draw()
{
  background(#508FC1);
  noStroke();
  for(float i = 0; i<1200; i+=20){
  fill(100-i/10,200-i/10,255);
  ellipse(400,400,1200-i,1200-i);}
  for(int i = 0; i < 151; i++){
  star[i].move();
  star[i].show();
}
}
class Particle
{
  float myX,myY,mySize,myAngle,mySpeed,myOpacity;
  Particle()
  {
    myX = 400;
    myY = 400;
    mySize = 5;
    myAngle = (float)(Math.random()*2*Math.PI);
    mySpeed = (float)(Math.random()*2)+.05;
    myOpacity = 0;
  }
  void move()
  {
   myX+=(float)Math.cos(myAngle)*mySpeed;
   myY+=(float)Math.sin(myAngle)*mySpeed;
   mySize+=mySpeed/15;
   myOpacity+=mySpeed;
   if(myY>800||myY<0||myX>800||myX<0){
    myY=400;
 myX=400; 
 mySize = 5; 
 mySpeed = (float)(Math.random()*2)+.01;
 myOpacity = 0;}
  }
  void show()
  {
      noFill();
    stroke(255,myOpacity);
    ellipse(myX,myY,mySize,mySize);
    noStroke();
    fill(255,myOpacity/4);
    ellipse(myX-mySize/5,myY-mySize/5,mySize/2,mySize/3);
  }
}

class OddballParticle extends Particle
{
  OddballParticle(){
    myX = 400;
    myY = 400;
    mySize = 5;
    myAngle = (float)(Math.random()*2*Math.PI);
    mySpeed = (float)(Math.random()*2)+.05;
    myOpacity = 0;
  }
  void move(){
    mySize+=0.25;
    myOpacity+=2;
  }
  void show(){
     fill(#001b0d,myOpacity/1.5);
    triangle(400,400-mySize/1.4,400-mySize/1.8,400+mySize/4,400+mySize/1.8,400+mySize/4);
    fill(#082C21,myOpacity);
    ellipse(400,400,mySize,mySize);
    fill(#C9B986,myOpacity);
    ellipse(400-mySize/4.4,400-mySize/4.5,mySize/10,mySize/10);
    ellipse(400+mySize/4.4,400-mySize/4.5,mySize/10,mySize/10);
    fill(#00140e,myOpacity/3);
    ellipse(400,400+mySize/10,mySize/1.3,mySize/1.8);
  }
}
