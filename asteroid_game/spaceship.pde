class Spaceship  extends GameObject {

  PVector dir;
  PVector pos;
  int cooldown;
  int invTimer = 0;
  float angle = 0;
  float radius;


  Spaceship() {
    super(width/2, height/2, 0, 0);
    vel.setMag(1);
    ellipseMode(RADIUS);

    //vel.rotate(radians(random(0, 360)));
    dir = new PVector (1, 0);
    invTimer =200;
    cooldown = 0;
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();
    popMatrix();
  }


  void drawShip() {

    if(upkey) {
    
    
    }
    
    
    
    
    if ( invTimer > 0) {
      radius = 60 + 15 * sin(angle);
      angle += 0.05;  // increase angle for next frame

      // Draw ellipse in center
      strokeWeight(2);
      stroke(blue);
      fill(lightBlue, 50);
      ellipse(0, 0, radius, radius);
    }



    fill(black);
    stroke(white);
    strokeWeight(1);
    triangle(20, 0, -15, -20, -15, 20);
    rect(10, 0, 25, 10);
    triangle(20, 0, -20, -10, -20, 10);
    line(20, 0, -20, 0);
    line(-15, 20, 0, 20);
    line(-15, -20, 0, -20);
    circle(0, 0, 5);
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround();
    invincibleTimer();
    superhot();
    
    
  if (vel.mag() > 0.1) {
    timeShouldMove = true;
  }
    
    
  }

  void move() {
    loc.add(vel);
    float topSpeed = 1;

    if (vel.mag() > topSpeed) {
      vel.setMag(topSpeed);
    }

    if (upkey)vel.add(dir);
    if (leftkey)dir.rotate(-radians(3));
    if (rightkey)dir.rotate(radians(3));
        if (downkey)vel.sub(dir);

  }
  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 30;
    }
  }
  void checkForCollisions() {
    if (invTimer > 0) return;

    int i = 0;
    while (i< objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          lives = lives - 1;
          obj.lives = 0;
          player1.loc = new PVector(width/2, height/2);
           player1.vel.set(0,0);
        }
        if (lives == 0){
       mode = GAMEOVER;
        
        }
      }
      i++;
    }
  }
  void invincibleTimer() {
    if (invTimer > 0) {
      invTimer--;
    }
  }
}
