// FILE VOOR CODE INFORMATIEBALK 

float InfoBalkAfstandTotEindeGrid = 150; // afstand tussen einde grid en informatiebalk, gebruik deze om de afstand aan te passen! 
float infoBalkX; 
float infoBalkY = 100; // afstand tussen bovenrand scherm en bovenrand informatiebalk 
float infoBalkWidth = 300;
float infoBalkHeight = 500;
float informatieSpacer = 10; // afstand tussen tekstregels in de informatiebalk, gebruik deze om de afstand aan te passen!
void updateInfoBalkPositie() { //functie die de positie van de informatiebalk aanpast op basis van de breedte van de grid, zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  infoBalkX = getGridEndX() + InfoBalkAfstandTotEindeGrid;
}

void infoBalk (float infoBalkX, float infoBalkY, float infoBalkWidth, float infoBalkHeight) { //functie voor weergeven informatiebalk en zijn inhoud
// INFORMATIEBALK RECHTS NAAST HEATMAP
    float titelTekstGrootte = 40;
    float inhoudTekstGrootte = 20;
    float titelY = infoBalkY + informatieSpacer;
  float inhoudStartX = infoBalkX + informatieSpacer;
  float inhoudStartY = titelY + titelTekstGrootte + informatieSpacer;
  float regelHoogte = inhoudTekstGrootte + informatieSpacer;
    float huidigeRegelY = inhoudStartY; //deze lijn toevoegen na elke keer dat we tekst toevoegen, zodat we de volgende regel op de juiste plek kunnen zetten, deze variabele wordt telkens verhoogd met regelHoogte nadat er tekst is toegevoegd, zodat we een nette afstand tussen de regels hebben zonder dat we handmatig de Y-positie van elke regel hoeven aan te passen
    fill(255);
    rect(infoBalkX, infoBalkY, infoBalkWidth, infoBalkHeight);
    fill(0);
    textSize(titelTekstGrootte);
    textAlign(CENTER, TOP);
    text("Data insights", infoBalkX + infoBalkWidth / 2, titelY);

    textSize(inhoudTekstGrootte); //INFORMATIE IN INFORMATIEBALK
    textAlign(LEFT, TOP);
    if (selectedPoint != null) { // 
      //text("Indexnummer: " + str(selectedPoint.indexNummer), inhoudStartX, huidigeRegelY);
      //huidigeRegelY += regelHoogte; // Verhoog Y-positie voor volgende regel, telkens herhalen na tekst om regels netjes onder elkaar te plaatsen
      
      text("Land: " + selectedPoint.landNaam, inhoudStartX, huidigeRegelY);
      huidigeRegelY += regelHoogte;

      text("Age group: " + selectedPoint.leeftijdsCategorie, inhoudStartX, huidigeRegelY);
      huidigeRegelY += regelHoogte;

      text("Total: " + str(selectedPoint.waardeTotaal), inhoudStartX, huidigeRegelY);
         huidigeRegelY += regelHoogte;

      if (selectedPoint.deviatie > 0) {
        fill(196, 92, 92); // gedimd rood voor positieve deviatie
      } else if (selectedPoint.deviatie < 0) {
        fill(92, 156, 110); // gedimd groen voor negatieve deviatie
      } else {
        fill(140); // zachter grijs voor geen deviatie
      }
      text ("absolute deviation: " + nf(selectedPoint.deviatie, 0, 2) , inhoudStartX + 20, huidigeRegelY);
      huidigeRegelY += regelHoogte;
      text ("Z-score: " + nf(selectedPoint.zScore, 0, 2), inhoudStartX + 20, huidigeRegelY);
      huidigeRegelY += regelHoogte;
      huidigeRegelY += regelHoogte;
      fill (0); // zwart voor tekst
      // nf functie wordt gebruikt om de deviatie en Z-score af te ronden op 2 decimalen 

text("Gender distribution:", inhoudStartX, huidigeRegelY);
textSize(inhoudTekstGrootte - 4); // iets kleinere tekst voor subcategorie
      huidigeRegelY += regelHoogte;
      text("Male: " + str(selectedPoint.waardeMan), inhoudStartX + 20, huidigeRegelY);
      huidigeRegelY += regelHoogte;

      text("Female: " + str(selectedPoint.waardeVrouw), inhoudStartX + 20, huidigeRegelY);
      huidigeRegelY += regelHoogte;

      text("Transgender: " + str(selectedPoint.waardeTransgender), inhoudStartX + 20, huidigeRegelY);
      huidigeRegelY += regelHoogte;

      } else { //wanneer er geen datapunt geselecteerd is wordt er een standaardtekst weergegeven
      text("Hover over datapoint to see details", inhoudStartX, huidigeRegelY);
      huidigeRegelY += regelHoogte;
    }
  }
