

float margin = 100; // Margin for labels and spacing
float gridEndXFactor = 0.6; // factor gaande van 0 tot 1 die bepaalt waar het einde van de grid ligt, zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken

float getGridEndX() { // Float om de X-positie van het einde van de grid te berekenen op basis van een factor van de totale breedte, zodat we flexibel kunnen zijn met de layout.
  return width * gridEndXFactor;
}

void tekenHeatmapUI() { 
  background(255);
  drawGrid(7, 30);  // 7 ages on X-axis, 30 countries on Y-axis
  fill(0); // Black text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("HIV Prevalence by Age and Country", getGridEndX() / 2, 30); // Title, hier zit getGridEndX() in verwerkt zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  drawHeatmapLabels(7, 30); // Labels for ages and countries
  stroke(0); // Black border for legend
  noFill();
  strokeWeight(2);
  rect(getGridEndX() + 20, 350, 40, 300); // legend box
  
}
void drawHeatmapLabels(int numAges, int numCountries) {
  float xSpacing = (getGridEndX() - margin) / numAges;
  float ySpacing = (height - 2 * margin) / numCountries;

  fill(0);
  textSize(12);
  textAlign(CENTER, TOP);
  for (int i = 0; i < numAges; i++) {
    float x = margin + i * xSpacing + xSpacing / 2;
    text(leeftijdsCategorieen[i], x, height - margin + 8);
  }

  textSize(10);
  for (int j = 0; j < numCountries; j++) {
    float y = margin + j * ySpacing + ySpacing / 2;
    textAlign(RIGHT, CENTER);
    text(landenNamen[j], margin - 10, y);
  }

  textSize(16);
  textAlign(CENTER, CENTER);
  text("Age", (margin + getGridEndX()) / 2, height - 35);

  pushMatrix();
  translate(30, height / 2);
  rotate(-PI / 2);
  text("Country", 0, 0);
  popMatrix();
}
String[] leeftijdsCategorieen = {"<15", "15-19", "20-24", "25-29", "30-39", "40-49", "50+"};
String[] landenNamen = {
  "Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus",
  "Czechia", "Denmark", "Estonia", "Finland", "France",
  "Germany", "Greece", "Hungary", "Ireland", "Italy",
  "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands",
  "Poland", "Portugal", "Romania", "Slovakia", "Slovenia",
  "Spain", "Sweden", "Norway", "Iceland", "Switzerland"
};
void drawGrid(int numAges, int numCountries) {
  stroke(0);      // Black lines
  strokeWeight(1); // Thin lines
  
  float xSpacing = (getGridEndX() - margin) / (float)numAges; //hier zit getGridEndX() in verwerkt zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
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
    line(margin, y, getGridEndX(), y);
  } 
  }
  
