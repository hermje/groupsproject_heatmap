

float gridMargin = 100; // Margin for labels and spacing
float gridEndXFactor = 0.6; // factor gaande van 0 tot 1 die bepaalt waar het einde van de grid ligt, zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
// Deze twee float zijn de belangrijkste variabelen voor de layout (grootte grid, celhoogte en celbreedte worden automatisch berekend op basis van deze variabelen), door te spelen met deze variabelen kunnen we makkelijk de layout aanpassen zonder overal in de code aanpassingen te moeten maken, dit maakt het ook makkelijker om verschillende layouts uit te proberen.
// Individuele aanpassingen aan de celhoogte en celbreedte worden best niet gedaan. 

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
  float xSpacing = (getGridEndX() - gridMargin) / numAges;
  float ySpacing = (height - 2 * gridMargin) / numCountries;

  fill(0);
  textSize(12);
  textAlign(CENTER, TOP);
  for (int i = 0; i < numAges; i++) {
    float x = gridMargin + i * xSpacing + xSpacing / 2;
    text(leeftijdsCategorieen[i], x, height - gridMargin + 8);
  }

  textSize(10);
  for (int j = 0; j < numCountries; j++) {
    float y = gridMargin + j * ySpacing + ySpacing / 2;
    textAlign(RIGHT, CENTER);
    text(landenNamen[j], gridMargin - 10, y);
    // mooi onder elke kolom en naast elke rij de labels plaatsen, hier zit gridMargin in verwerkt zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  }

  textSize(16);
  textAlign(CENTER, CENTER);
  text("Age", (gridMargin + getGridEndX()) / 2, height - 35);
// tekst age staat mooi in het midden onder de grid
  pushMatrix();
  translate(30, height / 2);
  rotate(-PI / 2);
  text("Country", 0, 0);
  popMatrix();
  // AI suggestie om de de tekst "Country" verticaal te plaatsen door de matrix te transformeren, zodat we de tekst kunnen roteren en op de juiste plek kunnen zetten zonder ingewikkelde berekeningen voor de positie.
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
  
  float xSpacing = (getGridEndX() - gridMargin) / (float)numAges; //hier zit getGridEndX() in verwerkt zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  float ySpacing = (height - 2 * gridMargin) / (float)numCountries;
  // breedte van de cellen wordt berekend als het verschil tussen het einde van de grid (getGridEndX()) en de margin, gedeeld door het aantal leeftijdscategorieën, zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  
  // verticale lijnen tekenen voor leeftijdscategorieën (X-as)
  for (int i = 0; i <= numAges; i++) {
    float x = gridMargin + i * xSpacing;
    line(x, gridMargin, x, height - gridMargin);
  }
  
  // horizontale lijnen tekenen voor landen (Y-as)
  for (int i = 0; i <= numCountries; i++) {
    float y = gridMargin + i * ySpacing;
    line(gridMargin, y, getGridEndX(), y);
  } 
  }
  
