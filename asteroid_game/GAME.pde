void game() {
  background(black);

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
}
