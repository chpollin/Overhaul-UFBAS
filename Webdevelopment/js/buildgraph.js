/*
* Idee:
*   Eintrag <listePropertiesAuf> ?wert (?ert a <ListeKategorienAuf>)

Zu jeder Zielkategorie kann ich wieder neue Properties auslesen.
Damit habe ich an der jeweils untersetzen Stelle im XML einen Pfad durch die Properites.
Diesen Pfad kann ich als Muster für die Anfrage benutzen.
Aus der Kategorienseite ist dann also möglich:
Suche mir alle Einträge mit Tätern mit Mann

Ziele können sein:
  * Literale mit Kategorien
  * URIs mit Termini
*/
function properties (kategorie) {
	/*
	* Lies das query:ufbas.properties zur aktuellen Kategorie aus
	* Liste alle Zielkategorien auf
	*    Erlaube die Anzeige der Werte der Zielkategorien
	*    Erlaube die Anzeige der properties der Zielkategorien
	*/
	$("button").click(function(){
	    $.ajax({url: kategorie + "demo_test.txt", success: function(result){
		$("kategorie").html(result); //Iteration?
		
	    }});
	}); 
}
