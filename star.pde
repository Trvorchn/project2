class star {

  // instance variables or fields
  float x, y, vx, vy, size;
  int r, g, b;
  //constructor : special funciton that defines how a object  of this clas is born, defines initial values for fields
  star() {
    x = random(0,width);
    y = random(0, height);
    vx = (5);
    vy = random(1, 4);
    size = vy;
    r = 255;
    g = 255;
    b = 255;
  }

  // define what the star does
  void show() {
    fill(r, g, b);
    square(x, y, size);
  }

  void act() {

     x = x - vx;
    if ( x < -size) {
      size = vx;
      x = width-size;
    }
       y = y - vy;
    if ( y < -size) {
      size = vy;
      y = height-size;
    }
    }
  }
