class Spaceship  extends GameObject {

  PVector dir;
  PVector pos;
  int cooldown;
  int invTimer = 0;
  float angle = 0;
  float radius;
  float part;
  float d;

  int teleportCooldown = 0;
  final int maxTeleportCooldown = 300;
  boolean canTeleport = true;



  Spaceship() {

    super(width/2, height/2, 0, 0, 1);
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
    drawCooldownBar();
  }













  void drawShip() {



    if ( invTimer > 0) {
      radius = 60 + 15 * sin(angle);
      angle += 0.05;

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

    if (upkey) {
      PVector offset = dir.copy();
      offset.rotate(PI);
      offset.setMag(25);
      objects.add(new ParticleT(loc.x + offset.x, loc.y + offset.y, random(-0.25, 0.25), random(-0.25, 0.25)));
    }
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround();
    invincibleTimer();
    brake();
    teleport();
    if (!canTeleport) {
      teleportCooldown--;
      if (teleportCooldown <= 0) {
        canTeleport = true;
        teleportCooldown = 0;
      }
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
      cooldown = 25;
    }
  }
  void checkForCollisions() {
    if (invTimer > 0) return;

    int i = 0;
    while (i< objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          lives = lives -1;
          obj.lives = 0;
          player1.loc = new PVector(width/2, height/2);
          player1.vel.set(0, 0);
          invTimer = 120;
        }
        if (lives == 0) {
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

  void brake() {
    if (ekey) {
      vel.set(0, 0);
    }
  }
  void teleport() {
    if (qkey && canTeleport) {
      PVector newLoc = new PVector();
      boolean safe = false;

      while (safe == false) {
        float newX = random(0, width);
        float newY = random(0, height);
        newLoc.set(newX, newY);
        safe = true;

        int i = 0;
        while (i < objects.size()) {
          GameObject obj = objects.get(i);
          if (obj instanceof Asteroid) {
            float d = dist(newLoc.x, newLoc.y, obj.loc.x, obj.loc.y);
            if (d < 200) {
              safe = false;
              break; // exit
            }
          }
          i++;
        }
      }

      loc.set(newLoc);
      canTeleport = false;
      teleportCooldown = maxTeleportCooldown;
  
  }
  }

  void drawCooldownBar() {
    float barWidth = 100, barHeight = 10;
    float x = width - barWidth - 20, y = 20;
    float fillBar = (maxTeleportCooldown - teleportCooldown) / (float)maxTeleportCooldown;
    int barColor;


    if (canTeleport) {
      barColor = color(0, 255, 0);
    } else {
      barColor = color(255, 0, 0);
    }

    stroke(255);
    noFill();
    rect(x, y, barWidth, barHeight);

    noStroke();
    fill(barColor);
    rect(x, y, barWidth * fillBar, barHeight);
  }
}
