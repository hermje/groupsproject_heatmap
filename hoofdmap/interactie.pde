ArrayList<dataPunten> dataPunt = new ArrayList<dataPunten>(); //Hierin concretiseer je het type data dat dataPunt is (zoals float, int,...)

float aantalRijen = 30;
float aantalKolommen = 7;
float totaalAantalPunten = aantalRijen * aantalKolommen;


float gridCellWidth = (1000 - 2 * gridMargin) / 7.0; 
float gridCellHeight = (1000 - 2 * gridMargin) / 30.0;
// 1 cel rechts + 1 cel naar beneden vrijhouden voor labels
float gridSpacerX = gridMargin + gridCellWidth;
float gridSpacerY = gridMargin + gridCellHeight;


dataPunten selectedPoint = null; //komt uit functie select() in class dataPunten, hierin wordt het geselecteerde datapunt opgeslagen, zodat we deze kunnen gebruiken om de interactieve tabel te tonen in de informatiebalk.






void lijnObjectenUitMetGrid() { //AI: functie die objecten en grid automatisch alligneerd om verwerking makkelijker te maken ;
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
  float deviatie; // elk dataPunt krtijgt een deviatie die  wordt weergegeven in de informatiebalk 
  float zScore; // elk dataPunt krijgt een Z-score die later weergegeven wordt in de informatiebalk
  

 

 
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
    this.zScore = 0;
  }

  void dataPuntenAanmaken (){ //functie die de datapunten aanmaak, in dit geval 210 datapunten, 30 landen x 7 leeftijdscategorieen
    for(int r=0; r<aantalRijen; r++) {
    for(int c=0; c<aantalKolommen; c++) {
      dataPunt.add(new dataPunten(c*cellWidth, r*cellHeight, cellWidth, cellHeight, r * aantalKolommen + c)); // rij-major: x=kolom, y=rij, index: r*cCount + c
    // r * aantalKolommen + c zorgt ervoor dat elk datapunt een uniek indexnummer krijgt, dit stukje code is specifiek gemaakt om ervoor te zorgen dat de indexering primair gebeurd op basis van de rijen (dus index 0-6 voor de eerste rij, 7-13 voor de tweede rij, enzovoort), dit maakt het makkelijker om de datapunten te koppelen aan de juiste landen en leeftijdscategorieen in de dataKoppelenAanObjecten functie, aangezien deze ook primair op basis van rijen werkt.
    // keuze gemaakt op basis van data in data.csv: data in deze file is zo gestructureerd dat elke lijn overeenkomt met een specifieke leeftijdscategorie en de verschillende waarden van één land (man, vrouw, totaal)
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
    boolean isHover = mouseX >= sx && mouseX < sx + cellWidth && mouseY >= sy && mouseY < sy + cellHeight; //checkt of de muis zich binnen de grenzen van een vakje (datapunt) bevindt, indien dit zo is wordt de variabele isHover true en wordt dat specifieke datapunt geselecteerd (nodig voor informatiebalk)

    if (isHover) {
      selectedPoint = this; //voornaamste voordeel van deze functie, hiermee wordt het geselecteerde datapunt opgeslagen in de variabele selectedPoint, zodat we deze kunnen gebruiken om de interactieve tabel te tonen.
      noFill();
      stroke(#556B2F);
      strokeWeight(2);
      rect(sx, sy, cellWidth, cellHeight);
    }
  }

  void calculateDeviation() {
    float meanValue = 0;

    //onderstaande lijnen code checken in welke leeftijdscategorie het datapunt valt, en vervolgens het gemiddelde voor die leeftijdscategorie oproepen, zodat we de deviatie kunnen berekenen als het verschil tussen de waarde van het datapunt en het gemiddelde voor die leeftijdscategorie.
    if (leeftijdsCategorie.equals("15-19")) {
      meanValue = mean15_19(); 
    } else if (leeftijdsCategorie.equals("20-24")) {
      meanValue = mean20_24();
    } else if (leeftijdsCategorie.equals("25-29")) {
      meanValue = mean25_29();
    } else if (leeftijdsCategorie.equals("30-39")) {
      meanValue = mean30_39() ;
    } else if (leeftijdsCategorie.equals("40-49")) {
      meanValue = mean40_49();
    } else if (leeftijdsCategorie.equals("50+")) {
      meanValue = mean50_plus();
    } else if (leeftijdsCategorie.equals("<15")) {
      meanValue = meanSub15();
    }
    
    this.deviatie = waardeTotaal - meanValue; //hier wordt de deviatie berekend als het verschil tussen de waarde van het datapunt en het gemiddelde voor die leeftijdscategorie, deze deviatie kan vervolgens worden gebruikt om de kleur van het datapunt aan te passen in de display functie, zodat we visueel kunnen zien welke datapunten afwijken van het gemiddelde.
  }

  void calculateZScore() {
    float stdValue = standaarddeviatiePerCategorie(leeftijdsCategorie); //Gebruikt de functie standaardDeviatiePerCategorie vanuit gemiddelde_en_deviatie, aangezien dit een functie is binnen de class dataPunten zal de (leeftijdCategorie) parameter van de originele functie automatisch worden ingevuld met de specifieke leeftijdscategorie van dat datapunt

    if (stdValue > 0) {
      this.zScore = deviatie / stdValue;
    } else {
      this.zScore = 0;
    }
  }
}
