class Particle extends GameObject {
  float part;

  Particle(float x, float y, float vx, float vy) {
 super(x,y,vx,vy,1);
  d =5;
  part = 255;
  
  
  }
  void show(){
  noStroke();
  fill(white,part);
  ellipse(loc.x,loc.y,d,d);
  triangle(loc.x,loc.y,loc.x-2,loc.y-2,loc.x+2,loc.y+2);
  }
  void act(){
  loc.add(vel);
  part = part-5;
  if(part<=0){
  lives = 0;
  }
  
  
  
  }
  
}
