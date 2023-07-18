# TEI to SKOS

## Conversations

* Overhaul-UFBAS: TEI to SKOS. July 18, 2023. Code Interpreter + ChatGPT May 24 Version https://chat.openai.com/share/fba67a26-a88a-4ace-80a6-d48670b604d5

## Prompt

```
As an experienced Python developer specializing in data transformations, your task is to analyze and transform data from a specific TEI XML file named 'ufbas.categories.xml'. This file is part of the project "Urfehdebücher der Stadt Basel - digitale Edition," which contains hierarchical categories describing terms. The digital edition of the Basel Urfehdebuch X (Staatsarchiv Basel-Stadt, Ratsbücher O 10) includes the Urfehde entries of the city of Basel for the period 1563 to 1569."

Your objective is to convert the `<taxonomy>` section and its content from the 'ufbas.categories.xml' TEI XML file into a SKOS (Simple Knowledge Organization System) format file. 
SKOS is widely used for knowledge representation in the Semantic Web.

Here's a representative snippet of the TEI XML input:

```xml
<classDecl xml:id="kategorien">
    <taxonomy xml:id="Urfehdekodierung">
        <category xml:id="uf_Eintrag"></category>
        <category xml:id="uf_Eingangsnotiz"></category>
        <category xml:id="uf_Person">
            <catDesc>
                <term>Person</term>
            </catDesc>
            <category xml:id="uf_PersonTäter">
                <catDesc>
                    <term>Täter</term>
                    <gloss>Täter, Tatverdächtiger</gloss>
                </catDesc>
            </category>
            <category xml:id="uf_PersonMittäter">
                <catDesc>
                    <term>Mittäter</term>
                    <gloss>Mittäter (kann in weiterem Urfehdeverfahren belangt werden), als Mittäter Beschuldigter</gloss>
                </catDesc>
            </category>
    </taxonomy>
</classDecl>
```

The SKOS output should look like the following:

```xml
<rdf:RDF xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
    <skos:ConceptScheme rdf:about="https://gams.uni-graz.at/o:ufbas.categories">
        <skos:hasTopConcept rdf:resource="https://gams.uni-graz.at/o:ufbas.categories#Person"/>
    </skos:ConceptScheme>
    <skos:Concept rdf:about="https://gams.uni-graz.at/o:ufbas.categories#Person">
        <skos:prefLabel xml:lang="de">Person</skos:prefLabel>
        <skos:inScheme rdf:resource="https://gams.uni-graz.at/o:ufbas.categories"/>
        <skos:narrower rdf:resource="https://gams.uni-graz.at/o:ufbas.categories#Taeter"/>
	<skos:narrower rdf:resource="https://gams.uni-graz.at/o:ufbas.categories#Mittaeter"/>
    </skos:Concept>
    <skos:Concept rdf:about="https://gams.uni-graz.at/o:ufbas.categories#Taeter">
        <skos:prefLabel xml:lang="de">Täter</skos:prefLabel>
        <skos:definition xml:lang="de">Täter, Tatverdächtiger</skos:definition>
        <skos:inScheme rdf:resource="https://gams.uni-graz.at/o:ufbas.categories"/>
    </skos:Concept>
    <skos:Concept rdf:about="https://gams.uni-graz.at/o:ufbas.categories#Mittaeter">
        <skos:prefLabel xml:lang="de">Mittäter</skos:prefLabel>
        <skos:definition xml:lang="de">Mittäter (kann in weiterem Urfehdeverfahren belangt werden), als Mittäter Beschuldigter</skos:definition>
        <skos:inScheme rdf:resource="https://gams.uni-graz.at/o:ufbas.categories"/>
    </skos:Concept>
</rdf:RDF>
```

The SKOS must contain skos:ConceptScheme including all skos:hasTopConcept and the following metadata about the SKOS:

* <dc:title xml:lang="de">Kategorien</dc:title>
* <dc:relation>Urfehdebücher der Stadt Basel – digitale Edition</dc:relation>
* <dc:relation>https://gams.uni-graz.at/ufbas</dc:relation>
* <dc:publisher>Institut Zentrum für Informationsmodellierung, Universität Graz</dc:publisher>
* <dc:identifier>o:ufbas.categories</dc:identifier>
* <dc:date>2023</dc:date>
* <dc:format>rdf+xml</dc:format>
* <dc:rights>Creative Commons BY 4.0</dc:rights>
* <dc:rights rdf:resource="http://creativecommons.org/licenses/by-nc/4.0/"/>
* <dc:description xml:lang="de">Dieses Dokument enthält die Kategorien, mit denen die Urfehdebücher näher erschlossen werden. Wählen Sie eine Kategorie aus, um alle Einträge zu sehen, in denen diese Kategorie verwendet wird.</dc:description>
* <dc:language>de</dc:language>
* <dc:source>Kategorien der Urfehdebücher der Stadt Basel – digitale Edition, digital entstanden.</dc:source>
* <dc:coverage>Graz</dc:coverage>

You must use the namespace xmlns:skos="http://www.w3.org/2004/02/skos/core#" as in skos:Concept.

Validate the result SKOS. Use the RDFLib library.

Write the Python code for the data transformation and provide a download for the entire SKOS file with the file name "ufbas-skos.xml".
```