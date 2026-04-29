# HIV Heatmap Processing Project

Dit project is een interactieve datavisualisatie in Processing. De sketch toont een heatmap van HIV-gevallen per land en leeftijdscategorie. Elke cel stelt een combinatie van land en leeftijdsgroep voor. De kleur geeft de relatieve waarde weer: het aantal HIV-gevallen per 100.000 inwoners.

Wanneer je met de muis over een cel beweegt, verschijnt rechts een informatiebalk met extra details over dat datapunt, zoals het land, de leeftijdsgroep, het totaal aantal gevallen, de afwijking ten opzichte van het gemiddelde, de z-score en de verdeling per gender.

## Projectstructuur

```text
groupsproject_heatmap/
├── hoofdmap/
│   ├── hoofdmap.pde
│   ├── Layout.pde
│   ├── data_invoegen.pde
│   ├── interactie.pde
│   ├── informatie_balk.pde
│   ├── gemiddelde_en_deviatie.pde
│   ├── color_scale.pde
│   ├── TO DO.pde
│   └── data/
│       └── data.csv
├── Taakverdeling.md
└── README.md
```

## Belangrijkste onderdelen

- `hoofdmap.pde` bevat de `setup()` en `draw()` van de Processing-sketch. Hier worden de data geladen, de datapunten aangemaakt en de verschillende onderdelen van de visualisatie aangeroepen.
- `Layout.pde` tekent het raster, de titel, de assen en de labels voor landen en leeftijdscategorieen.
- `data_invoegen.pde` laadt `data.csv` in en koppelt de CSV-data aan de juiste datapunt-objecten.
- `interactie.pde` bevat de `dataPunten` class. Hier worden de cellen aangemaakt, weergegeven, geselecteerd via hover en voorzien van statistische waarden.
- `informatie_balk.pde` tekent de informatiebalk rechts van de heatmap en toont details over het geselecteerde datapunt.
- `gemiddelde_en_deviatie.pde` berekent gemiddelden, standaarddeviaties, absolute afwijkingen en z-scores per leeftijdscategorie.
- `color_scale.pde` tekent de kleurlegende en gebruikt dezelfde schaal als de heatmap.
- `data/data.csv` bevat de gebruikte dataset met landen, leeftijdsgroepen, genderverdeling, totaalwaarden en inwoners.

## Dataset

De CSV bevat per rij een combinatie van:

- `Land`
- `Leeftijd`
- `Vrouw`
- `Man`
- `Transgender`
- `Totaal`
- `Inwoners`

De visualisatie gebruikt 30 landen en 7 leeftijdscategorieen:

```text
<15, 15-19, 20-24, 25-29, 30-39, 40-49, 50+
```

Omdat absolute aantallen moeilijk vergelijkbaar zijn tussen landen met verschillende bevolkingsgroottes, berekent het project ook een relatieve waarde:

```text
waardeRelatief = (Totaal / Inwoners) * 100000
```

Deze relatieve waarde bepaalt de kleur van elke cel in de heatmap.

## Interactie

De gebruiker kan met de muis over een cel bewegen. De geselecteerde cel krijgt een groene rand en de informatiebalk toont:

- land
- leeftijdsgroep
- totaal aantal HIV-gevallen
- absolute afwijking ten opzichte van het gemiddelde binnen dezelfde leeftijdscategorie
- z-score
- verdeling tussen man, vrouw en transgender

Zo kan je niet alleen zien waar hoge of lage waarden zitten, maar ook hoe sterk een land binnen een bepaalde leeftijdscategorie afwijkt van de rest.

## Kleurschaal

De heatmap gebruikt een kleurverloop van geel naar rood:

- geel betekent een lage relatieve waarde
- rood betekent een hoge relatieve waarde

De maximale relatieve waarde in de dataset wordt opgeslagen in `maxRelatief`. Daarna wordt elke cel met `map()` en `lerpColor()` naar een kleur op de schaal vertaald.

## Starten

1. Open Processing.
2. Open de map `groupsproject_heatmap/hoofdmap`.
3. Open `hoofdmap.pde`.
4. Klik op Run.

Belangrijk: de mapnaam `hoofdmap` en het hoofdbestand `hoofdmap.pde` moeten dezelfde naam hebben. Dit is nodig omdat Processing de sketch op basis van die naam opent.

## Taakverdeling

Volgens `Taakverdeling.md` was de verdeling:

- Data inladen: Dieter
- Layout: Amber
- Interactie: Jens
- Kleurschaling: Anouk

Deze README werd geformuleerd op basis van AI. 
