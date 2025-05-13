class UFO extends GameObject {
  float part;

  UFO() {

    super(width/2, height/2, 0, 0, 1);
    vel.setMag(1);
    ellipseMode(RADIUS);
    vel.rotate(radians(random(0, 360)));
    dir = new PVector (1, 0);

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
   
  }
