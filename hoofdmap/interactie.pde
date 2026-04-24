ArrayList<dataPunten> dataPunt = new ArrayList<dataPunten>(); //Hierin concretiseer je het type data dat dataPunt is (zoals float, int,...)

float aantalRijen = 30;
float aantalKolommen = 7;
float totaalAantalPunten = aantalRijen * aantalKolommen;


float gridMargin = 100;
float gridCellWidth = (1000 - 2 * gridMargin) / 7.0;
float gridCellHeight = (1000 - 2 * gridMargin) / 30.0;
// 1 cel rechts + 1 cel naar beneden vrijhouden voor labels
float gridSpacerX = gridMargin + gridCellWidth;
float gridSpacerY = gridMargin + gridCellHeight;


dataPunten selectedPoint = null;






void lijnObjectenUitMetGrid() { //AI: functie die objecten en grid automatisch alligneerd om verwerking makkelijker te maken 
  gridMargin = margin;
  gridCellWidth = (getGridEndX() - gridMargin) / aantalKolommen;
  gridCellHeight = (height - 2 * gridMargin) / aantalRijen;
  gridSpacerX = gridMargin;
  gridSpacerY = gridMargin;

  for (int i = 0; i < dataPunt.size(); i++) {
    dataPunten punt = dataPunt.get(i);
    int rij = i / (int)aantalKolommen;
    int kolom = i % (int)aantalKolommen;

    punt.x = kolom * gridCellWidth;
    punt.y = rij * gridCellHeight;
    punt.cellWidth = gridCellWidth;
    punt.cellHeight = gridCellHeight;
  }
}

class dataPunten { //Gekozen om met classes te werken omdat we dan alle eigenschappen van een datapunt kunnen bundelen in 1 object, en we kunnen ook functies toevoegen aan deze class die specifiek zijn voor deze data punten, zoals het weergeven van de waarde of het berekenen van de kleur op basis van de waarde.
  float x;
  float y;
  float cellWidth = gridCellWidth;
  float cellHeight = gridCellHeight;

//EIGENSCHAPPEN PER OBJECT 
  float indexNummer;
  String landNaam;
  String leeftijdsCategorie; //string want deze kan verschillende vormen aannemen, zoals "15-24", "25-34", "35-49", "50+" of "Totaal"
  float waardeMan;
  float waardeVrouw;
  float waardeTransgender;
  float waardeTotaal;
  

 

 
  dataPunten (float tempx, float tempy, float cellWidth, float cellHeight, float indexNummer) {
    //ALGEMENE EIGENSCHAPPEN VAN DE DATAPUNTEN, DIE NODIG ZIJN OM DE DATAPUNTEN OP HET SCHERM TE PLAATSEN EN TE INTERAGEREN
    this.x = tempx;
    this.y = tempy;
    this.cellWidth = cellWidth;
    this.cellHeight = cellHeight;

    //SPECIFIEKE EIGENSCHAPPEN VAN DE DATAPUNTEN 
    this.indexNummer = indexNummer;
    this.landNaam = "Onbekend";
    this.leeftijdsCategorie = "Onbekend";
    this.waardeMan = 0;
    this.waardeVrouw = 0;
    this.waardeTransgender = 0;
    this.waardeTotaal = 0;
  }

  void dataPuntenAanmaken (){ //functie die de datapunten aanmaak, in dit geval 210 datapunten, 30 landen x 7 leeftijdscategorieen
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

  void select() { //functie die visueel aantoond welke datapunt wordt geselecteerd (tijdelijk), later zal deze functie enkel nog worden gebruikt voor de selected.point = this om de interactieve tabel op te bouwen
    float sx = this.x + gridSpacerX;
    float sy = this.y + gridSpacerY;
    boolean isHover = mouseX >= sx && mouseX < sx + cellWidth && mouseY >= sy && mouseY < sy + cellHeight;

    if (isHover) {
      selectedPoint = this; //voornaamste voordeel van deze functie, hiermee wordt het geselecteerde datapunt opgeslagen in de variabele selectedPoint, zodat we deze kunnen gebruiken om de interactieve tabel te tonen.
      noFill();
      stroke(#556B2F);
      strokeWeight(2);
      rect(sx, sy, cellWidth, cellHeight);
    }
  }
}

