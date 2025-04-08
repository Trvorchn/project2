class Spaceship  extends GameObject {

  PVector dir;
  PVector pos;


  Spaceship() {
    super(width/2,height/2,0,0);
    vel.setMag(1);

    //vel.rotate(radians(random(0, 360)));
    dir = new PVector (1, 0);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();
    popMatrix();
  }


  void drawShip() {

    fill(black);
    stroke(white);
    strokeWeight(1);
    triangle(20, 0, -15, -20, -15, 20);
    rect(10, 0, 25, 10);
    triangle(20, 0, -20, -10, -20, 10);
    line(20, 0, -20, 0);
    line(-15, 20, 0, 20);
    line(-15, -20, 0, -20);
    circle(0, 0, 10);
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround();
  }

  void move() {
    loc.add(vel);
    float topSpeed = 5;


    if (vel.mag() > topSpeed) {
      vel.normalize();
      vel.mult(topSpeed);
    }


    if (upkey)vel.add(dir);
    if (leftkey)dir.rotate(-radians(3));
    if (rightkey)dir.rotate(radians(3));
  }
  void shoot() {
    if (spacekey) {
      objects.add(new Bullet());
      println("?");
    }
  }
  void checkForCollisions() {
  }
  void wrapAround() {
    if (loc.x > 825) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = 825;
    }

    if (loc.y > 825) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = 825;
    }
  }
}
