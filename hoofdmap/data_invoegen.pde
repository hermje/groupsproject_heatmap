Table exelBestand;           
int aantalLanden;           
float[][] dataMatrix;    // de eerste [] staat voor de Rij (land) en de tweede [] voor de kolom (Man, Vrouw, trans of Totaal)


void laadData() {

  exelBestand = loadTable("data.csv", "header"); // dit is om de csv tabel(exel) in te laden, en met header wordt bedoeld dat de eerste regel niet mee moet worden gebruikt in de berekeningen, maar die moet worden gebruik voor de titels 

  
  aantalLanden = exelBestand.getRowCount() / 7; // hiermee wordt geteld hoeveel rijen in het CSV bestan staan, dus hoeveel landen er zijn.

  
  dataMatrix = new float[aantalLanden][4];  // Nu wordt de matrix/rooster dat het aantal landen gebruikt voor de hoogte en 4 kolommen voor de breedte(Man, Vrouw, Trans, Totaal) 

  

  
  for (int i = 0; i < aantalLanden; i++) { // een loop, om alle landen af te lopen
    
    int csvIndex = i * 7;
    TableRow rij = exelBestand.getRow(csvIndex); // i is de rij die pakt uit het CSV bestand, dus het land dat wordt ingeladen.

    // je gaat nu de data van de rij in de matrix zetten, dus per land 
    dataMatrix[i][0] = rij.getFloat("Man");    // Kolom Man
    dataMatrix[i][1] = rij.getFloat("Vrouw");  // Kolom Vrouw
    dataMatrix[i][2] = rij.getFloat("Transgender"); // kolom totaal transgender
    dataMatrix[i][3] = rij.getFloat("Totaal"); // Kolom Totaal
    

    //

  }
}

void dataKoppelenAanObjecten (){
  //algemene idee: functie die zowel alle data in de matrix doorloopt, als alle dataPunten objecten in de arraylist, en deze aan elkaar koppelt op basis van de index, zodat elk dataPunten object de juiste data krijgt toegewezen.
//nuttige functies: getFloat(), getString()
// best exelBestand (als table) gebruiken, zo kan je Strings en floats ophalen
//exelBestand.getFloat of .getString, hier kan je de specifieke waarde ophalen die je nodig hebt, bijvoorbeeld de naam van het land

//denk eraan: Austria (0,0) heeft in het .csv bestand de code 0,0 maar staat op ljin 2 in de arraylist, dus er is een verschil van 2 tussen de index in de arraylist en de rij in het CSV bestand, dit moet je meenemen in de berekening van de index, bijvoorbeeld door 2 af te trekken van de rij index om de juiste waarde uit het CSV bestand te halen.


//OEFENCODE, LANDEN KOPPELEN AAN OBJECTEN 
//LANDNAAM 
for(int i = 0; i < exelBestand.getRowCount(); i++) {
  String tempLandnaam = exelBestand.getString(i, "Land"); //hier wordt de naam van het land opgehaald uit het CSV bestand, op basis van de rij index i, en de kolom "Land", deze waarde wordt opgeslagen in de variabele tempLandnaam
for(int j = 0; j < dataPunt.size(); j++) {
  if (dataPunt.get(j).indexNummer == i) { //hier wordt gecontroleerd of de index van het dataPunten object overeenkomt met de rij index i van het CSV bestand, als dit het geval is, dan wordt de naam van het land gekoppeld aan het dataPunten object, zodat we deze later kunnen gebruiken in de display en select functies van de dataPunten class, en in de informatiebalk.
    dataPunt.get(j).landNaam = tempLandnaam; //hier wordt de naam van het land gekoppeld aan het dataPunten object, door de waarde van tempLandnaam toe te wijzen aan de landNaam eigenschap van het dataPunten object op index j.
  }
}
}

//LEEFTIJDSCATEGORIE
for(int i = 0; i < exelBestand.getRowCount(); i++) {
  String tempLeeftijdsCategorie = exelBestand.getString(i, "Leeftijd"); // de CSV-header is hoofdlettergevoelig en heet exact "Leeftijd"
for(int j = 0; j < dataPunt.size(); j++) {
  if (dataPunt.get(j).indexNummer == i) { //hier wordt gecontroleerd of de index van het dataPunten object overeenkomt met de rij index i van het CSV bestand, als dit het geval is, dan wordt de leeftijdscategorie gekoppeld aan het dataPunten object, zodat we deze later kunnen gebruiken in de display en select functies van de dataPunten class, en in de informatiebalk.
    dataPunt.get(j).leeftijdsCategorie = tempLeeftijdsCategorie;
  }
}
}

//WAARDETOTAAL 
for(int i = 0; i < exelBestand.getRowCount(); i++) {
  float tempWaardeTotaal = exelBestand.getFloat(i, "Totaal"); // hier wordt de waarde van de "Totaal" kolom opgehaald uit het CSV bestand, op basis van de rij index i, deze waarde wordt opgeslagen in de variabele tempWaarde
for(int j = 0; j < dataPunt.size(); j++) {
  if (dataPunt.get(j).indexNummer == i) { //hier wordt gecontroleerd of de index van het dataPunten object overeenkomt met de rij index i van het CSV bestand, als dit het geval is, dan wordt de waarde gekoppeld aan het dataPunten object, zodat we deze later kunnen gebruiken in de display en select functies van de dataPunten class, en in de informatiebalk.
    dataPunt.get(j).waardeTotaal = tempWaardeTotaal;
  }
}
}

//WAARDEMAN 
for(int i = 0; i < exelBestand.getRowCount(); i++) {
  float tempWaardeMan = exelBestand.getFloat(i, "Man");
  for(int j = 0; j < dataPunt.size(); j++) {
    if (dataPunt.get(j).indexNummer == i) {
      dataPunt.get(j).waardeMan = tempWaardeMan;
    }
  }
}

//WAARDEVOUWN
for(int i = 0; i < exelBestand.getRowCount(); i++) {
  float tempWaardeVrouw = exelBestand.getFloat(i, "Vrouw");
  for(int j = 0; j < dataPunt.size(); j++) {
    if (dataPunt.get(j).indexNummer == i) {
      dataPunt.get(j).waardeVrouw = tempWaardeVrouw;
    }
  }
}

//WAARDETRANSGENDER
for(int i = 0; i < exelBestand.getRowCount(); i++) {
  float tempWaardeTransgender = exelBestand.getFloat(i, "Transgender");
  for(int j = 0; j < dataPunt.size(); j++) {
    if (dataPunt.get(j).indexNummer == i) {
      dataPunt.get(j).waardeTransgender = tempWaardeTransgender;
    }
  }     
}
}
