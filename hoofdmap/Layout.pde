

float gridMargin = 100; // Margin for labels and spacing
float gridEndXFactor = 0.6; // factor gaande van 0 tot 1 die bepaalt waar het einde van de grid ligt, zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
// Deze twee float zijn de belangrijkste variabelen voor de layout (grootte grid, celhoogte en celbreedte worden automatisch berekend op basis van deze variabelen), door te spelen met deze variabelen kunnen we makkelijk de layout aanpassen zonder overal in de code aanpassingen te moeten maken, dit maakt het ook makkelijker om verschillende layouts uit te proberen.
// Individuele aanpassingen aan de celhoogte en celbreedte worden best niet gedaan. 

float getGridEndX() { // Float om de X-positie van het einde van de grid te berekenen op basis van een factor van de totale breedte, zodat we flexibel kunnen zijn met de layout.
  return width * gridEndXFactor;
}

void tekenHeatmapUI() { //@amberverberck-ctrl ik heb even uw draw functie hier weggehaald en in de hoofdmap gezet en uw code hier omvat in een functie die we dan in de draw kunnen oproepen 
  background(255);
  drawGrid(7, 30);  // 7 ages on X-axis, 30 countries on Y-axis
  fill(0); // Black text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("HIV Prevalence by Age and Country", getGridEndX() / 2, 30); // Title, hier zit getGridEndX() in verwerkt zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  text("Age", (gridMargin + getGridEndX()) / 2, height - 20); // Label for X-axis, gecentreerd in het midden van de grid
  text("Country", 50, height / 2); // Label for Y-axis

  stroke(0); // Black border for legend
  noFill();
  strokeWeight(2);
  rect(getGridEndX() + 20, 350, 40, 300); // legend box
  
}

void drawGrid(int numAges, int numCountries) {
  stroke(0);      // Black lines
  strokeWeight(1); // Thin lines
  
  float xSpacing = (getGridEndX() - gridMargin) / (float)numAges; //hier zit getGridEndX() in verwerkt zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  float ySpacing = (height - 2 * gridMargin) / (float)numCountries;
  // with of each cell
  
  // Draw vertical lines for ages (X-axis)
  for (int i = 0; i <= numAges; i++) {
    float x = gridMargin + i * xSpacing;
    line(x, gridMargin, x, height - gridMargin);
  }
  
  // Draw horizontal lines for countries (Y-axis)
  for (int i = 0; i <= numCountries; i++) {
    float y = gridMargin + i * ySpacing;
    line(gridMargin, y, getGridEndX(), y);
  } 
  }
  
