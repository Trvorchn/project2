class UFO extends GameObject {

  PVector dir;
  PVector pos;
  int cooldown;
  float d = 50;


  UFO() {
    super(random(0, width), random(0, height), 0, 0, 1);
    vel.setMag(1);
    ellipseMode(RADIUS);
    dir = new PVector (1, 1);
    lives = 1;
  }

  void show() {
    drawUFO();
  }

  void act() {
    move();
    if (frameCount % 100==0);
    changeDir();
    wrapAround();
    checkForCollisions();
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
  }
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d / 2 + obj.d / 2) {

          obj.lives = 0;
            this.lives = 0;

        }
      }
      i++;
    }
  }
}
