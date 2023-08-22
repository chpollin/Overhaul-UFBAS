function register(kategorie) {
    /*
     * Ruft die Werte zu einer Kategorie auf:
     * /archive/objects/query:ufbas.kategorien/methods/sdef:Query/getXML?params=$1|%3Chttps://gams.uni-graz.at/ufbas/%23Beruf%3E
     *   und zeigt sie an
     */
     //FixMe: erst testen, ob die Kategorie URL-encoded ist
     var anfrage="//glossa.uni-graz.at/archive/objects/query:ufbas.kategorien/methods/sdef:Query/getXML?params=%241|" + kategorie + "";
     console.log (anfrage);
     $.get( anfrage, function(data) {
        alert( '1' ) ;
         console.log( data ) ;
     });
}