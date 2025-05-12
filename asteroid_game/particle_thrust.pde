class ParticleT extends GameObject {
  float part;

  ParticleT(float x, float y, float vx, float vy) {
    super(x, y, vx, vy, 1);
    d =5;
    part = 255;
  }
  void show() {

    noStroke();
    fill(orange, part);
    ellipse(loc.x, loc.y, d, d);
  }
  void act() {
    loc.add(vel);
    part = part-5;
    if (part<=0) {
      lives = 0;
    }
  }
}
