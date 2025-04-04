void tactileR(float xa, float xb, float ya, float yb) {
  if (mouseX>xa && mouseX<xb && mouseY >ya && mouseY < yb) {
    stroke (white);
    strokeWeight(10);
  } else {
    stroke(black);
  }
}
