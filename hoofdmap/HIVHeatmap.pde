// Main sketch tab required by Processing: file name must match folder name.
// Actual setup and data logic live in the other .pde tabs.
// misschien een idee om hier de void setup en draw te plaatsen en dus de kern van de code hier te laten runnen? ja top
float maxRelatief = 0; // deze variabele zal worden gebruikt om de maximale waarde van de relatieve waardes op te slaan, zodat we deze kunnen gebruiken in de display functie van de dataPunten class om de kleur van de datapunten aan te passen op basis van hun relatieve waarde, en om landen onderling te vergelijken door te delen door de grootste relatieve waarde die we zijn bekomen

void setup() {
	size(1250, 750);
	laadData();
     drawGrid(7, 30);
    

    //functies vanuit de class dataPunten, deze functies zijn nodig om de dataPunten aan te maken en in de arraylist te steken, en deze punten vervolgens te kunnen tonen op het scherm.
	dataPunt.clear();
	dataPunten puntenBuilder = new dataPunten(0, 0, 115, 25, 0);
	puntenBuilder.dataPuntenAanmaken();
  dataKoppelenAanObjecten();
  lijnObjectenUitMetGrid();
  updateInfoBalkPositie();

  //functies voor het bepalen van het gemiddelde 
  meanSub15();
  mean15_19();
  mean20_24();
  mean25_29();
  mean30_39();
  mean40_49();
  mean50_plus();
  for (dataPunten punt : dataPunt)  {
    if (punt.waardeRelatief > maxRelatief) {
      maxRelatief = punt.waardeRelatief;
      }
  }
}

void draw(){
  //frameRate(10); //tijdelijk om te kijken of de interactie werkt, later zal deze regel weggehaald worden
  
  selectedPoint = null;
  tekenHeatmapUI();
  lijnObjectenUitMetGrid();
  updateInfoBalkPositie();
//CLASS FUNCTIES
    for(int r =0; r<aantalRijen; r++) {
    for(int c=0; c<aantalKolommen;c++) {
      int index = r * (int)aantalKolommen + c; //CENTRAAL: GAAT ALLE INDEXEN AF!!! 
      dataPunt.get(index).display(); //tijdelijk om te kijken of de interactie werkt, later zal deze functie weggehaald worden
      dataPunt.get(index).select(); //Indien het kleuren van de vakjes tijdens het werken aan de code vervelend wordt, kan deze functie tijdelijk worden uitgecommentarieerd
      dataPunt.get(index).calculateDeviation(); //hier wordt de deviatie berekend voor elk datapunt, deze deviatie kan vervolgens worden gebruikt om de kleur van het datapunt aan te passen in de display functie, zodat we visueel kunnen zien welke datapunten afwijken van het gemiddelde.
      dataPunt.get(index).calculateZScore();
    }
  }

  infoBalk (infoBalkX, infoBalkY, infoBalkWidth, infoBalkHeight); //functie die informatiebalk weergeeft 

  colorscale();
}
