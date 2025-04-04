void intro(){
background (black);
textSize(100);
textFont(plank);
text("ASTEROIDS",400,400);





  //start button
tactileR(350, 450, 475, 525);
  rect(width/2, height/2+100, 100, 50);
  textSize(20);
  fill(black);
  text("start", width/2, height/2+100);
noStroke();
  
  
  
  
  
  
    fill(0,20);
  rect(width/2,height/2,width,height);
   int i = 0;
  while (i < numstars) {
    theStars[i].show();
    theStars[i].act();
    i++;
  }



}
void introClicks(){
//  if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY > height/2+25 && mouseY < height/2+100) {
 if (mouseX > 350  && mouseX < 450 && mouseY > 475 && mouseY < 525) {
    mode = GAME;

  }
}
