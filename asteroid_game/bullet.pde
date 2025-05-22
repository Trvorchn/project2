class Bullet extends GameObject {
  int timer;
  boolean good;
  Bullet() {
    super (player1.loc.copy(), player1.dir.copy());
    vel.setMag(35);
    timer = 500;
    d = 5;
    good = true;
  }
Bullet(UFO ufo) {
  super(ufo.loc.copy(), ufo.dir.copy());
  vel.setMag(35);
  timer = 500;
  d = 5;
  good = false;
  stroke(red);
}

  
  
  

  void show() {
fill(black);  
    strokeWeight(2);
    circle(loc.x, loc.y, d);
      if (good) {
      stroke(white); 
    } else if(!good){
      stroke(red);  
    }
  }
  void act() {

    loc.add(vel);
    wrapAround();
    timer--;
    if (timer == 0) lives = 0;
  }
}
