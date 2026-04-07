Table exelBestand;           
int aantalLanden;           
float[][] dataMatrix;    // de eerste [] staat voor de Rij (land) en de tweede [] voor de kolom (Man, Vrouw, trans of Totaal)


void laadData() {

  exelBestand = loadTable("data.csv", "header"); // dit is om de csv tabel(exel) in te laden, en met header wordt bedoeld dat de eerste regel niet mee moet worden gebruikt in de berekeningen, maar die moet worden gebruik voor de titels 

  
  aantalLanden = exelBestand.getRowCount(); // hiermee wordt geteld hoeveel rijen in het CSV bestan staan, dus hoeveel landen er zijn.

  
  dataMatrix = new float[aantalLanden][4];  // Nu wordt de matrix/rooster dat het aantal landen gebruikt voor de hoogte en 4 kolommen voor de breedte(Man, Vrouw, Trans, Totaal) 

  

  
  for (int i = 0; i < aantalLanden; i++) { // een loop, om alle landen af te lopen
    
    
    TableRow rij = exelBestand.getRow(i); // i is de rij die pakt uit het CSV bestand, dus het land dat wordt ingeladen.

    // je gaat nu de data van de rij in de matrix zetten, dus per land 
    dataMatrix[i][0] = rij.getFloat("Man");    // Kolom Man
    dataMatrix[i][1] = rij.getFloat("Vrouw");  // Kolom Vrouw
    dataMatrix[i][2] = rij.getFloat("Transgender"); // kolom totaal transgender
    dataMatrix[i][3] = rij.getFloat("Totaal"); // Kolom Totaal
    

    //

  }
  return dataMatrix;
}