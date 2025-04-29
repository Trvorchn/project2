float shockwaveRadius = 0;
float gameOverFade = 255;
float shakeAmount = 10;
int shakeDuration = 30;
boolean resetReady = false;

void gameover() {
  strokeWeight(5);
  pushMatrix();

  // Screen shake
  if (shakeDuration > 0) {
    float shakeX = random(-shakeAmount, shakeAmount);
    float shakeY = random(-shakeAmount, shakeAmount);
    translate(shakeX, shakeY);
    shakeDuration--;
  }

  background(0, 25);  


  // Fading & pulsing text
  fill(255, gameOverFade);
  textFont(plank);
  textAlign(CENTER, CENTER);
  textSize(64 + sin(frameCount * 0.1) * 5);
  text("YOU LOSE", width / 2, height / 2);

  tactileR(500, 700, 550, 650);
  rect(400, 600, 200, 100);
  fill(white);
  textSize(40);
  text("HOME", 400, 600);





  if (gameOverFade > 0) {
    gameOverFade -= 1;
  } else {
    resetReady = true;
  }

  popMatrix();
}


void resetGameOverEffects() {
  shockwaveRadius = 0;
  gameOverFade = 255;
  shakeDuration = 30;
  resetReady = false;
}
void gameoverClicks() {
}
