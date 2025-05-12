float shockwaveRadius = 0;
float gameOverFade = 255;
float shakeAmount = 10;
int shakeDuration = 30;
boolean resetReady = false;

PImage sadface;



void gameover() {
  imageMode(CENTER);
  strokeWeight(5);

  sadface =loadImage ("sadface.png");

  pushMatrix();

  // Screen shake
  if (shakeDuration > 0) {
    float shakeX = random(-shakeAmount, shakeAmount);
    float shakeY = random(-shakeAmount, shakeAmount);
    translate(shakeX, shakeY);
    shakeDuration--;
  }





  background(0, 25);
  image(sadface, 400, 400);
  tactileR(350, 450, 475, 525);
  rect(width/2, height/2+100, 100, 50);

  textSize(20);
  fill(black);
  text("HOME", width/2, height/2+100);
  noStroke();





  // Fading & pulsing text
  fill(255, gameOverFade);
  textFont(plank);
  textAlign(CENTER, CENTER);
  text("YOU LOSE", width / 2, height / 2);





  if (gameOverFade > 0) {
    gameOverFade -= 1;
  } else {
    resetReady = true;
  }

  popMatrix();
  resetGameOverEffects();
}


void resetGameOverEffects() {
  shockwaveRadius = 0;
  gameOverFade = 255;
  shakeDuration = 30;
  resetReady = false;
}
void gameoverClicks() {
  if (mouseX > 350  && mouseX < 450 && mouseY > 475 && mouseY < 525) {
    mode = INTRO;
  }
}
