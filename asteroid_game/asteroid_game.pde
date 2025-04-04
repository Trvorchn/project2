int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;


boolean upkey, downkey, leftkey, rightkey;

PVector loc;
PVector vel;

star[] theStars;
int numstars;

//game objects
Spaceship player1;

PFont plank;


void setup() {
  mode = INTRO;
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  player1 = new Spaceship();



  numstars = 100;
  theStars = new star[numstars]; //contructor
  int i = 0;
  while (i < numstars) {
    theStars[i] = new star();
    i++;
  }

  plank = createFont("PLANK___.TTF", 100);
}






void draw() {


  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode ==  GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
