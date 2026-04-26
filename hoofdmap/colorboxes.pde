color getColorForValue(float waarde) {

  float minWaarde = 0;      //20= absolute waarde, laagste relatieve waarde = 0
  float maxWaarde = 1350;    //750=absolute waarde, hoogste relatieve waarde moeten we nog bepalen

  // waarde omzetten naar schaal tussen 0 en 1
  float inter = map(waarde, minWaarde, maxWaarde, 0, 1);

  // zorgen dat het niet buiten de schaal gaat
  inter = constrain(inter, 0, 1);

  // zelfde kleuren als je legenda
  return lerpColor(
    color(255, 255, 0),   // geel = lage waarde
    color(255, 0, 0),     // rood = hoge waarde
    inter
  );
}
