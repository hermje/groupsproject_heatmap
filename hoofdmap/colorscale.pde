
//
  //yellow: low --> (255,255,0)
  //red: high --> (255,0,0)

void colorscale(){

    float x = getGridEndX() + 20;     // de rechthoek staat dan rechts van de heatmap met 20 tussen de heatmap en de rechthoek
    int y = 250 ;        // de rechthoek staat dan op ongeveer 1/3e van de hoogte van de heatmap
    int w = 40;
    int h = 300;

     //--> variabelen width heatmap en hight heatmap nog benoemen

    stroke(0);
    noFill();
    strokeWeight(1);
    rect(x, y, w, h);

    for(int i=0; i<h; i++){
      float inter = map(i,0,h,0,1);
      color c = lerpColor(color(255,0,0),color(255,255,0),inter); //lerp zorgt voor kleurenovergang
      stroke(c);
      line(x,y+i,x+w,y+i); //lijn per lijn wordt de kader ingekleurd
    }

    fill(0);
    textSize(12);
    
    float TextAfstandTotEindeGrid = 97;
    y = y + 20;

    text(">1350", TextAfstandTotEindeGrid, y);
    text("0", TextAfstandTotEindeGrid, y + 300);

}