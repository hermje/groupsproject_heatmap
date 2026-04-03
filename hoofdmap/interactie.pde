ArrayList<dataPunten> dataPunt = new ArrayList<dataPunten>(); //Hierin concretiseer je het type data dat dataPunt is (zoals float, int,...)
float aantalRijen = 30;
float aantalKolommen = 3;
float totaalAantalPunten = aantalRijen * aantalKolommen;
float gridMargin = 100;
float gridCellWidth = (1000 - 2 * gridMargin) / 7.0;
float gridCellHeight = (1000 - 2 * gridMargin) / 30.0;
// 1 cel rechts + 1 cel naar beneden vrijhouden voor labels
float gridSpacerX = gridMargin + gridCellWidth;
float gridSpacerY = gridMargin + gridCellHeight;
dataPunten selectedPoint = null;

class dataPunten { //Gekozen om met classes te werken omdat we dan alle eigenschappen van een datapunt kunnen bundelen in 1 object, en we kunnen ook functies toevoegen aan deze class die specifiek zijn voor deze data punten, zoals het weergeven van de waarde of het berekenen van de kleur op basis van de waarde.
  float x;
  float y;
  float cellWidth = gridCellWidth;
  float cellHeight = gridCellHeight;


  float indexNummer;
  float waarde;
  String landNaam;

 

 
  dataPunten (float tempx, float tempy, float cellWidth, float cellHeight, float indexNummer) {
    this.x = tempx;
    this.y = tempy;
    this.cellWidth = cellWidth;
    this.cellHeight = cellHeight;
    this.indexNummer = indexNummer;
    this.waarde = 0;
    this.landNaam = "Onbekend";

  }

  void dataPuntenAanmaken (){ //functie die de datapunten aanmaak, in dit geval 90 datapunten, 30 landen x 3 categorieen
    for(int r=0; r<aantalRijen; r++) {
    for(int c=0; c<aantalKolommen; c++) {
      dataPunt.add(new dataPunten(c*cellWidth, r*cellHeight, cellWidth, cellHeight, r * aantalKolommen + c)); // rij-major: x=kolom, y=rij, index: r*cCount + c
    }
  }
  }

  void display (){ //objecten worden weergegeven als rechthoeken, tijdelijk functie om de datapunten te tonen, later zal deze functie worden aangepast om de kleur van de rechthoek aan te passen op basis van de waarde van het datapunt, en om de naam van het land weer te geven bij hoveren.
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(x + gridSpacerX, y + gridSpacerY, cellWidth, cellHeight);
  }

  void select() {
    float sx = this.x + gridSpacerX;
    float sy = this.y + gridSpacerY;
    boolean isHover = mouseX >= sx && mouseX < sx + cellWidth && mouseY >= sy && mouseY < sy + cellHeight;

    if (isHover) {
      selectedPoint = this;
      noFill();
      stroke(#556B2F);
      strokeWeight(2);
      rect(sx, sy, cellWidth, cellHeight);
    }
  }
}