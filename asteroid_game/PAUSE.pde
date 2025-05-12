void pause() {
  fill(white);
  stroke(white);
  textSize(100);
  text("PAUSED", 400, 400);


  fill(white);
  rect(width/2, height/2+100, 100, 50);
  textSize(20);
  fill(black);
  text("HOME", width/2, height/2+100);
  noStroke();
}
void pauseClicks() {

  if (mouseX > 730 && mouseX < 770 && mouseY > 730 && mouseY < 770) mode = GAME;
  if (mouseX > 350  && mouseX < 450 && mouseY > 475 && mouseY < 525) mode = INTRO;
}
