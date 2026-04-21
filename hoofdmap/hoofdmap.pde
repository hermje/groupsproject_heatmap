// Main sketch tab required by Processing: file name must match folder name.
// Actual setup and data logic live in the other .pde tabs.
// misschien een idee om hier de void setup en draw te plaatsen en dus de kern van de code hier te laten runnen? ja top

void setup() {
	size(1500, 1000);
	laadData();
     drawGrid(7, 30);
    tekenHeatmapUI();

    //functies vanuit de class dataPunten, deze functies zijn nodig om de dataPunten aan te maken en in de arraylist te steken, en deze punten vervolgens te kunnen tonen op het scherm.
	dataPunt.clear();
	dataPunten puntenBuilder = new dataPunten(0, 0, 115, 25, 0);
	puntenBuilder.dataPuntenAanmaken();
  dataKoppelenAanObjecten();
  lijnObjectenUitMetGrid();
  updateInfoBalkPositie();
}

void draw(){
  //frameRate(10); //tijdelijk om te kijken of de interactie werkt, later zal deze regel weggehaald worden
  
  selectedPoint = null;
  lijnObjectenUitMetGrid();
  updateInfoBalkPositie();
//CLASS FUNCTIES
    for(int r =0; r<aantalRijen; r++) {
    for(int c=0; c<aantalKolommen;c++) {
      int index = r * (int)aantalKolommen + c; //CENTRAAL: GAAT ALLE INDEXEN AF!!! 
      dataPunt.get(index).display(); //tijdelijk om te kijken of de interactie werkt, later zal deze functie weggehaald worden
      dataPunt.get(index).select(); //Indien het kleuren van de vakjes tijdens het werken aan de code vervelend wordt, kan deze functie tijdelijk worden uitgecommentarieerd
    }
  }

  infoBalk (infoBalkX, infoBalkY, infoBalkWidth, infoBalkHeight); //functie die informatiebalk weergeeft 

  colorscale();
}
