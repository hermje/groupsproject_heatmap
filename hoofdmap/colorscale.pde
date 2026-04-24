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

  text("1350", textX, y);
  
  text("0", textX, y + 300);
}