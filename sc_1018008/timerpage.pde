int t0 = 0;

void timer() {
  pushMatrix();
  scale(3);
  mousePressed();
  int t = millis()-t0;
  float t_left =180  - t / 1000.0;
  if (page != 0&&page0 != 3) {
    t = 0;
  }
  show_button();

  if (t_left > 0) {
    text(t_left, 20, 40);
  } else {
    text("time is up!", 20, 40);
  }
  popMatrix();
}


void mousePressed() {
  // rect area
  if ((mouseX > 120 && mouseX < 2180) &&
    (mouseY > 60 && mouseY < 240)&&(mousePressed == true)) {
    t0 = millis();
  }
}

void show_button() {
  fill(255, 0, 0);
  rect(40, 60, 50, 20);
  fill(255);
  text("reset", 50, 75);
}
