
int lives;


void game() {
  background(black);
  lives = 3;
  strokeWeight(2);
  fill(white);
  rect(750, 750, 20, 20);
  textSize(20);
  text("PAUSE", 750, 775);






  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject= objects.get(i);
    currentObject.act();
    currentObject.show();
    println(mouseX/100);
    currentObject.vel.setMag(max(player1.vel.mag(), 0.001));
    if (currentObject.lives == 0) {
      objects.remove(i);
    } else
      i++;
  }
}




void gameClicks() {
  if (mouseX > 730 && mouseX < 770 && mouseY > 730 && mouseY < 770) mode = PAUSE;
}
