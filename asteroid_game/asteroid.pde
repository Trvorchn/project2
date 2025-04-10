class Asteroid extends GameObject {

  float rotSpeed, angle;

  Asteroid() {
    super(random(0, width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*20;
    rotSpeed = random(-2, 2);
    angle = 0;
  }
  //Asteroid() {
  //  objects.add(new Asteroid(loc.x, loc.y, lives-1));
  //}

  void show() {
    fill(black);
    stroke(white);
    strokeWeight(3);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(angle));
    circle(0, 0, d);
    line(0, 0, lives*10/2, 0);
    popMatrix();
    angle = angle + rotSpeed;
  }

  void act() {
    loc.add(vel);
    wrapAround();
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i< objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)< d/2 +obj.d/2) {

          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
