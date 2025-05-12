class UFO extends GameObject {
  float part;

  UFO(float x, float y, float vx, float vy) {
    super(x, y, vx, vy, 1);
    d =5;
    part = 255;
  }
  void show() {
  // Beam or light
  fill(#FFFF90);
  noStroke();
  triangle(400, 400, 375, 450, 425, 450);

  // Spaceship body (bottom part)
  stroke(2);
  fill(#DBDBD2);
  ellipse(400, 410, 100, 50);
  
   //alien body  
  fill(#7FFF00); // light green color
  ellipse(400, 410, 10, 15);

  // Cockpit glass dome
  fill(255, 100);
  ellipse(400, 400, 50, 35);

  // Alien head
  fill(#7FFF00); // light green color
  ellipse(400, 395, 20, 25);
  // Alien eyes
  fill(0);
  ellipse(394, 395, 4, 6);
  ellipse(406, 395, 4, 6);
  }
  
  
  
  void act() {
    loc.add(vel);
    part = part-5;
    if (part<=0) {
      lives = 0;
    }
  }
}
