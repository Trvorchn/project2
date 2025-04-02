int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

boolean upkey, downkey, leftkey, rightkey;

PVector loc;
PVector vel;

//game objects
Spaceship player1;


void setup() {
  mode = GAME;
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

player1 = new Spaceship();



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
