class Spaceship {
  PVector loc;
  PVector vel;
  PVector dir;

  Spaceship() {

    loc = new PVector (width/2, height/2);
    vel = new PVector (1, 0);
    vel.setMag(random(1, 5));
    vel.rotate(radians(random(0, 360)));
    dir = new PVector (1, 0);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
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
  }



  void move() {
  }
  void shoot() {
  }
  void checkForCollisions() {
  }
}
