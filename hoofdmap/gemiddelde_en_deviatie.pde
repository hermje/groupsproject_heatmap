// CODE VOOR BEREKENEN GEMIDDELDE PER LEEFTIJDSCATEGORIE EN DE DEVIATIE VAN ELKE WAARDE TEN OPZICHTE VAN HET RELEVANTE GEMIDDELDE
// Deze code is relevant voor de vergelijking tussen landen binnen een leeftijdscategorie 

float meanSub15 () {
  float sumSub15 = 0;
  int countSub15 = 0;
  for (dataPunten punt : dataPunt) {
    if (punt.leeftijdsCategorie.equals("<15")) {
      sumSub15 = sumSub15 +punt.waardeTotaal;
      countSub15++;
     
    }
  }
  if (countSub15 > 0) {
    return sumSub15 / countSub15;
  } else {
    return 0; //voorkomt dat het systeem vastloopt door te delen door 0 
  }
}


//15-19
float mean15_19 () {
    float sum15_19 = 0;
    int count15_19 = 0;
    for (dataPunten punt : dataPunt) {
        if (punt.leeftijdsCategorie.equals("15-19")) {
        sum15_19 = sum15_19 +punt.waardeTotaal;
        count15_19++;
         
        }
    }
    if (count15_19 > 0) {
        return sum15_19 / count15_19;
    } else {
        return 0; //voorkomt dat het systeem vastloopt door te delen door 0 
    }
}

float mean20_24 () {
    float sum20_24 = 0;
    int count20_24 = 0;
    for (dataPunten punt : dataPunt) {
        if (punt.leeftijdsCategorie.equals("20-24")) {
        sum20_24 = sum20_24 +punt.waardeTotaal;
        count20_24++;    
        }
    }
    if (count20_24 > 0) {
        return sum20_24 / count20_24;
    } else {
        return 0; //voorkomt dat het systeem vastloopt door te delen door 0 
    }
}
    

    float mean25_29 () {
    float sum25_29 = 0;
    int count25_29 = 0;
    for (dataPunten punt : dataPunt) {
        if (punt.leeftijdsCategorie.equals("25-29")) {
        sum25_29 = sum25_29 +punt.waardeTotaal;
        count25_29++;    
        }
    }
    if (count25_29 > 0) {
        return sum25_29 / count25_29;
    } else {
        return 0; //voorkomt dat het systeem vastloopt door te delen door 0 
    }
}
    

float mean30_39 () {
    float sum30_39 = 0;
    int count30_39 = 0;
    for (dataPunten punt : dataPunt) {
        if (punt.leeftijdsCategorie.equals("30-39")) {
        sum30_39 = sum30_39 +punt.waardeTotaal;
        count30_39++;    
        }
    }
    if (count30_39 > 0) {
        return sum30_39 / count30_39;
    } else {
        return 0; //voorkomt dat het systeem vastloopt door te delen door 0 
    }
}

float mean40_49 () {
    float sum40_49 = 0;
    int count40_49 = 0;
    for (dataPunten punt : dataPunt) {
        if (punt.leeftijdsCategorie.equals("40-49")) {
        sum40_49 = sum40_49 +punt.waardeTotaal;
        count40_49++;    
        }
    }
    if (count40_49 > 0) {
        return sum40_49 / count40_49;
    } else {
        return 0; //voorkomt dat het systeem vastloopt door te delen door 0 
    }
}
    

float mean50_plus () {
    float sum50_plus = 0;
    int count50_plus = 0;
    for (dataPunten punt : dataPunt) {
        if (punt.leeftijdsCategorie.equals("50+")) {
        sum50_plus = sum50_plus +punt.waardeTotaal;
        count50_plus++;    
        }
    }
    if (count50_plus > 0) {
        return sum50_plus / count50_plus;
    } else {
        return 0; //voorkomt dat het systeem vastloopt door te delen door 0 
    }
    } 
