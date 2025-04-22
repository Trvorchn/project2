class GameObject {
  PVector loc;
  PVector vel;
  int lives;
 float d;

  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector ( lx, ly);
    vel = new PVector (vx, vy);
    lives = 1;
  }
  GameObject(PVector l, PVector v) {
    loc = l;
    vel = v;
    lives = 1;
  }
  GameObject(PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv;
  }
  GameObject(int lv) {
    lives = lv;
  }



  void act() {
  }


  void show() {
  }
  void wrapAround() {
     if (loc.x > width+100) {
      loc.x = -50;
    } else if (loc.x < -100) {
      loc.x = width+50;
    }

    if (loc.y > height+100) {
      loc.y = -50;
    } else if (loc.y < -100) {
      loc.y = height+50;
    }
  }
}
