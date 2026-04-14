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

// Variabelen voor de informatiebalk
float InfoBalkAfstandTotEindeGrid = 100;
float infoBalkX; 
float infoBalkY = 100;
float infoBalkWidth = 300;
float infoBalkHeight = 500;
float informatieSpacer = 10; // afstand tussen tekstregels in de informatiebalk
void updateInfoBalkPositie() { //functie die de positie van de informatiebalk aanpast op basis van de breedte van de grid, zodat we flexibel kunnen zijn met de layout zonder overal in de code aanpassingen te moeten maken
  infoBalkX = getGridEndX() + InfoBalkAfstandTotEindeGrid;
}




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
  float waaardeMan;
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
    this.waaardeMan = 0;
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

void infoBalk (float infoBalkX, float infoBalkY, float infoBalkWidth, float infoBalkHeight) {
// INFORMATIEBALK RECHTS NAAST HEATMAP
    float titelTekstGrootte = 40;
    float inhoudTekstGrootte = 20;
    float titelY = infoBalkY + informatieSpacer;
  float inhoudStartX = infoBalkX + informatieSpacer;
  float inhoudStartY = titelY + titelTekstGrootte + informatieSpacer;
  float regelHoogte = inhoudTekstGrootte + informatieSpacer;
    float huidigeRegelY = inhoudStartY;

    rect(infoBalkX, infoBalkY, infoBalkWidth, infoBalkHeight);
    fill(0);
    textSize(titelTekstGrootte);
    textAlign(CENTER, TOP);
    text("Gegevens", infoBalkX + infoBalkWidth / 2, titelY);

    textSize(inhoudTekstGrootte); //INFORMATIE IN INFORMATIEBALK
    textAlign(LEFT, TOP);
    if (selectedPoint != null) {
      text("Indexnummer: " + str(selectedPoint.indexNummer), inhoudStartX, huidigeRegelY);
      huidigeRegelY += regelHoogte; // Verhoog Y-positie voor volgende regel, telkens herhalen na tekst om regels netjes onder elkaar te plaatsen
      
      text("Land: " + selectedPoint.landNaam, inhoudStartX, huidigeRegelY);
      huidigeRegelY += regelHoogte;

      text("Leeftijdscategorie: " + selectedPoint.leeftijdsCategorie, inhoudStartX, huidigeRegelY);
      huidigeRegelY += regelHoogte;

      } else {
      text("Hover over een blokje", inhoudStartX, huidigeRegelY);
      huidigeRegelY += regelHoogte;
    }
  }