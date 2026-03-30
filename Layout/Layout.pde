void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  drawGrid(7, 30);  // 7 ages on X-axis, 30 countries on Y-axis
     fill(0); // Black text
       textSize(20);
       textAlign(CENTER, CENTER);
          text ("HIV Prevalence by Age and Country", width / 2, 30); // Title
         text( "Age", width / 2, height - 20); // Label for X-axis
         text("Country", 50, height / 2); // Label for Y-axis

   stroke(0); // Black border for legend
   noFill();
   strokeWeight(2);
  rect (920,350,40,300); // legend box )
}
float margin = 100; // Margin for labels and spacing
void drawGrid(int numAges, int numCountries) {
  stroke(0);      // Black lines
  strokeWeight(1); // Thin lines
  
  float xSpacing = (width - 2 * margin) / (float)numAges;
  float ySpacing = (height - 2 * margin) / (float)numCountries;
  // with of each cell
  
  // Draw vertical lines for ages (X-axis)
  for (int i = 0; i <= numAges; i++) {
    float x = margin + i * xSpacing;
    line(x, margin, x, height - margin);
  }
  
  // Draw horizontal lines for countries (Y-axis)
  for (int i = 0; i <= numCountries; i++) {
    float y = margin + i * ySpacing;
    line(margin, y, width - margin, y);
  }
//spacing 


}
  
