void intro() {
  background (black);
  textSize(100);
  textFont(plank);
  text("ASTEROIDS", 400, 400);





  //start button
  tactileR(350, 450, 475, 525);
  rect(width/2, height/2+100, 100, 50);
  textSize(20);
  fill(black);
  text("start", width/2, height/2+100);
  noStroke();






  fill(255, 1);
  rect(width/2, height/2, width, height);
  int i = 0;
  while (i < numstars) {
    theStars[i].show();
    theStars[i].act();
    i++;
  }
}
void introClicks() {
  if (mouseX > 350  && mouseX < 450 && mouseY > 475 && mouseY < 525) {
    mode = GAME;

    reset();
  }
}
void reset() {
  lives = 3;
  objects = new ArrayList();
  player1 = new Spaceship();
  objects.add(player1);
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
}
