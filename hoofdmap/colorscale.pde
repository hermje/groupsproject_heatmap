

  //yellow: low --> (255,255,0)
  //red: high --> (255,0,0)

void colorscale(){

    int x = getGridEndX() + 20;     // de rechthoek staat dan rechts van de heatmap met 20 tussen de heatmap en de rechthoek
    int y = 250 ;        // de rechthoek staat dan op ongeveer 1/3e van de hoogte van de heatmap
    int w = 40;
    int h = 300;

  //--> variabelen width heatmap en hight heatmap nog benoemen

    rect(x, y, w, h);
    stroke(0);

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

    text(">750", TextAfstandTotEindeGrid, y);
    text("700", TextAfstandTotEindeGrid, y + 20);
    text("650", TextAfstandTotEindeGrid, y + 40);
    text("600", TextAfstandTotEindeGrid, y + 60);
    text("550", TextAfstandTotEindeGrid, y + 80);
    text("500", TextAfstandTotEindeGrid, y + 100);
    text("450", TextAfstandTotEindeGrid, y + 120);
    text("400", TextAfstandTotEindeGrid, y + 140);
    text("350", TextAfstandTotEindeGrid, y + 160);
    text("300", TextAfstandTotEindeGrid, y + 180);
    text("250", TextAfstandTotEindeGrid, y + 200);
    text("200", TextAfstandTotEindeGrid, y + 220);
    text("150", TextAfstandTotEindeGrid, y + 240);
    text("100", TextAfstandTotEindeGrid, y + 260);
    text("50", TextAfstandTotEindeGrid, y + 280);
    text("<20", TextAfstandTotEindeGrid, y + 300);

}