// yellow: low --> (255,255,0)
// red: high --> (255,0,0)

void colorscale() {
  int x = int(getGridEndX() + 20);
  int y = 350;
  int w = 40;
  int h = 300;
  float textX = x + w + 12;

  stroke(0);
  noFill();
  rect(x, y, w, h);

  for (int i = 0; i < h; i++) {
    float inter = map(i, 0, h - 1, 0, 1);
    color c = lerpColor(color(255, 0, 0), color(255, 255, 0), inter);
    stroke(c);
    line(x, y + i, x + w, y + i);
  }

  fill(0);
  textSize(12);
  textAlign(LEFT, CENTER);

  text(">750", textX, y);
  text("700", textX, y + 20);
  text("650", textX, y + 40);
  text("600", textX, y + 60);
  text("550", textX, y + 80);
  text("500", textX, y + 100);
  text("450", textX, y + 120);
  text("400", textX, y + 140);
  text("350", textX, y + 160);
  text("300", textX, y + 180);
  text("250", textX, y + 200);
  text("200", textX, y + 220);
  text("150", textX, y + 240);
  text("100", textX, y + 260);
  text("50", textX, y + 280);
  text("<20", textX, y + 300);
}
