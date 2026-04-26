
//
  //yellow: low --> (255,255,0)
  //red: high --> (255,0,0)

void colorscale(){

    float x = getGridEndX() + 20;     // de rechthoek staat dan rechts van de heatmap met 20 tussen de heatmap en de rechthoek
    int y = 350 ;        // de rechthoek staat dan op ongeveer 1/3e van de hoogte van de heatmap
    int w = 40;
    int h = 300;
    float textX = x + w + 12; // de tekst staat dan rechts van de rechthoek met 10 tussen de rechthoek en de tekst

     //--> variabelen width heatmap en hight heatmap nog benoemen

    stroke(0);
    noFill();
    rect(x, y, w, h);

    for(int i=0; i< 300; i++){
      float inter = map(i,0,300,0,1);
      color c = lerpColor(color(255,0,0),color(255,255,0),inter); //lerp zorgt voor kleurenovergang
      stroke(c);
      line(x,y+i,x+w,y+i); //lijn per lijn wordt de kader ingekleurd
    }

    fill(0);
    textSize(16);
    textAlign(LEFT, CENTER);

    text ("HIV-gevallen per \n100.000 inwoners.", x, y -35);


    text(nf(maxRelatief, 0, 2), textX, y); // de maximale waarde van de relatieve waardes wordt weergegeven naast de bovenkant van de kleurenbalk, deze waarde wordt afgerond op 2 decimalen met de nf functie, zodat we een beter idee hebben van de schaal van de kleuren in de heatmap
    text("0", textX, y + 300);

}