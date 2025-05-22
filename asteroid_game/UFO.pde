class UFO extends GameObject {

  PVector dir;
  PVector pos;
  int cooldown;
  float d = 50;
  int dirCooldown;

  UFO() {
    super(random(0, width), random(0, height), 0, 0, 1);
    vel.setMag(1);
    ellipseMode(RADIUS);
    dir = new PVector (1, 1);
    lives = 1;
  }

  void show() {
    drawUFO();

    stroke(white);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
  }

  void act() {
    move();
    if (frameCount % 100==0);

    if (dirCooldown <= 0) {
      changeDir();
      dirCooldown = 120;
    } else {
      dirCooldown--;
    }
    wrapAround();
    checkForCollisions();
    shoot();
  }

  void drawUFO() {
    fill(200);
    stroke(255);
    noFill();
    stroke(255, 255, 0, 100);
    ellipse(loc.x, loc.y + 20, 100, 35);
    ellipse(loc.x, loc.y, 90, 30);
    fill(255);
    ellipse(loc.x, loc.y - 15, 70, 25);

    fill(255, 0, 0, 150);
    ellipse(loc.x - 30, loc.y + 25, 15, 8);
    ellipse(loc.x + 30, loc.y + 25, 15, 8);

    stroke(255, 255, 0, 150);
    strokeWeight(2);

    fill(0);
    ellipse(loc.x - 20, loc.y - 5, 6, 6);
    ellipse(loc.x + 20, loc.y - 5, 6, 6);

    noFill();
    stroke(255, 255, 0, 100);
    ellipse(loc.x, loc.y + 20, 100, 35);
  }
  void move() {
    loc.add(vel);
    vel.add(dir);
  }
  void changeDir() {
    float newX= random(-4, 4);
    float newY= random(-4, 4);
    dir = new PVector(newX, newY);
    dir.normalize();
    dir.mult(0.5);
  }
  void shoot() {
    cooldown--;
    if (cooldown <= 0) {
      PVector bulletDir = new PVector(random(-1, 1), random(-1, 1));
      bulletDir.normalize();
      bulletDir.mult(5);

      Bullet ufoBullet = new Bullet(this);
      ufoBullet.vel = bulletDir;

      objects.add(ufoBullet);

      cooldown = 35;
    }
  }


  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        Bullet b = (Bullet) obj;


        if (b.good && dist(loc.x, loc.y, b.loc.x, b.loc.y) < d*1.5 + b.d*1.5) {
          b.lives = 0;
          this.lives = 0;
        }
      }
      i++;
    }
  }
}
