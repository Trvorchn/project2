void intro(){
background (black);
textSize(100);
textFont(plank);
text("ASTEROIDS",400,400);








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



}
