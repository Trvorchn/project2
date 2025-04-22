class Asteroid extends GameObject {

  float rotSpeed, angle;

  Asteroid() {
    super(random(0, width), random(height), 1, 1 );
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 2;
    d = lives*60;
    rotSpeed = random(-2, 2);
    angle = 0;
  }
  
  Asteroid( int lives) {
  super(random(0, width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    d = lives*60;
this.lives = lives;

  }


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
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d / 2 + obj.d / 2) {

          obj.lives = 0;
          
          
          
          if (lives > 1) {
            Asteroid asteroid1 = new Asteroid(lives -1);
            Asteroid asteroid2 = new Asteroid(lives -1);
            asteroid1.d = d * 0.5;
            asteroid2.d = d * 0.5;

            asteroid1.loc = new PVector(loc.x + random(-10, 10), loc.y + random(-10, 10));
            asteroid2.loc = new PVector(loc.x + random(-10, 10), loc.y + random(-10, 10));

            // velocities
            asteroid1.vel.setMag(random(1, 3));
            asteroid2.vel.setMag(random(1, 3));
            asteroid1.vel.rotate(random(TWO_PI));
            asteroid2.vel.rotate(random(TWO_PI));


            objects.add(asteroid1);
            objects.add(asteroid2);
 

          }

          
          lives =0;

        }
      }
      i++;
    }
  }
}
