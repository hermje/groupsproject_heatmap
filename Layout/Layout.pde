void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  drawGrid(7, 30);  // 7 ages on X-axis, 30 countries on Y-axis
}

void drawGrid(int numAges, int numCountries) {
  stroke(0);      // Black lines
  strokeWeight(1); // Thin lines
  
  float xSpacing = width / (float)numAges;
  float ySpacing = height / (float)numCountries;
  
  // Draw vertical lines for ages (X-axis)
  for (int i = 0; i <= numAges; i++) {
    float x = i * xSpacing;
    line(x, 0, x, height);
  }
  
  // Draw horizontal lines for countries (Y-axis)
  for (int i = 0; i <= numCountries; i++) {
    float y = i * ySpacing;
    line(0, y, width, y);
  }


}
  
}