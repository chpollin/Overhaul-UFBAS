Project Overhaul und Refactoring der digitalen Edition der ‘Urfehdebücher der Stadt Basel’ mithilfe von GPT-4 und LLM

# Einleitung und Begriffsdefinitionen

Ziel dieses Beitrags ist die Erprobung des Einsatzes von Large Language Models (LLMs) wie GPT-4 _(OpenAI 2023) _für das Overhauling und Refactoring von Projekten in den Digital Humanities am Beispiel der digitalen Edition “Urfehdebücher der Stadt Basel” (UFBAS; [https://gams.uni-graz.at/ufbas](https://gams.uni-graz.at/ufbas)). Im Rahmen dieses Refactoring- und Overhauling-Prozesses, der sich auf die Überarbeitung von Daten, Datenmodell, Website und Code bezieht, werden LLMs für die verschiedenen Arbeitsschritte eingesetzt, getestet und evaluiert. 

**LLMs** sind generative KI-Werkzeuge, die darauf spezialisiert sind, menschliche Sprache zu “verstehen” und zu generieren. Sie lernen die Struktur und den Gebrauch von Sprache durch die Analyse großer Mengen von Textdaten und können hochwertigen, kontextualisierten Text erzeugen. Ein Beispiel für ein solches Modell ist **GPT-4** (Generative Pre-training Transformer 4). Die Vielseitigkeit und Leistungsfähigkeit von GPT-4 ermöglichen seinen Einsatz in verschiedenen Bereichen, darunter Datenmodellierung, -transformation, -visualisierung _(Chen et al. 2023)_ und -programmierung _(Poldrack, Lu, and Beguš 2023; Tian et al. 2023)_. Insbesondere in Verbindung mit dem ChatGPT-Plugin** Code Interpreter _(AI Explained 2023a; AI Explained 2023b)_** ist GPT-4 eines der mächtigsten verfügbare Werkzeug (Stand Juli 2023).[^1] 

 \
Im Kontext der Softwareentwicklung bezeichnet **Overhaul (Neugestaltung)** eine grundlegende Überarbeitung von Systemen mit dem Ziel, die Leistung zu verbessern oder aktuellen Standards und Anforderungen zu entsprechen. Dies kann wesentliche Änderungen der Architektur, der Funktionalität und des Designs von Websites und Webschnittstellen umfassen. Dies kann z.B. der Fall sein, wenn ein Projekt über die Jahre so veraltet ist, dass es nicht mehr den aktuellen Anforderungen entspricht, so dass die Usability leidet oder bestimmte Bibliotheken nicht mehr gepflegt werden. Dies kann z.B. im Rahmen eines Refactorings geschehen. **Refactoring (Optimierung)** ist ein Prozess in der Softwareentwicklung, bei dem der Quellcode überarbeitet wird, um seine Struktur zu verbessern, ohne das externe Verhalten der Software zu verändern. Ziel ist es, den Code verständlicher, wartbarer und anpassungsfähiger zu machen. Refactoring kann im Rahmen eines Overhaul einer Webrepräsentation durchgeführt werden, insbesondere wenn der technische Aspekt des Systems verbessert werden soll.  

LLMs wie GPT-4 sind in der Lage, das Overhauling und Refactoring von Code zu unterstützen. Inwieweit dieses Potenzial reicht, soll im Rahmen dieser Studie untersucht werden, indem nicht nur der Optimierungsprozess beschrieben wird, sondern auch die Möglichkeiten und Grenzen von LLMs in diesem Kontext aufgezeigt werden. Es wird untersucht, inwieweit solche Modelle und Ansätze eine Antwort auf typische Probleme der Digital Humanities sein können.


## Fallstudie UFBAS

Das Projekt UFBAS _(Burghartz, Calvi, and Vogeler 2017; Pollin and Vogeler 2017)_ unter der Leitung von Susanna Burghartz umfasst die digitale Edition des Urfehdebuchs der Stadt Basel für die Jahre 1563 bis 1569, die trotz ihres inhaltlichen Wertes in vielerlei Hinsicht verbesserungswürdig ist und dem heutigen Stand der Technik angepasst werden muss. UFBAS wurde 2017 im Rahmen eines einjährigen Projekts am Zentrum für Informationsmodellierung (ZIM), für das ein studentischer Mitarbeiter mit 20h/Woche angestellt wurde, im **Geisteswissenschaftlichen Asset Management System** _(GAMS; Stigler and Steiner 2018) _veröffentlicht.

Die verschiedenen Revisionsschritte sollen mit Hilfe von GPT-4, den vorhandenen Plugins und insbesondere dem Plugin Code Interpreter unterstützt werden. Dabei orientiert sich die herangehensweise an den Experimenten, die in der Workshopreihe “GPT und Prompt Engineering für die (digitalen) Geisteswissenschaften” ([https://chpollin.github.io/GM-DH](https://chpollin.github.io/GM-DH)) erprobt wurden. Die Ergebnisse der GPT-4 assistierten Ergebnisse sind auf **[https://github.com/chpollin/Overhaul-UFBAS](https://github.com/chpollin/Overhaul-UFBAS)** veröffentlicht.


## Angestrebte Verbesserungen

Die Verbesserungen betreffen die Datenbasis, die Metadaten, das Datenmodell in Form einer Ontologie mit einer Ableitung aus der Top-Level-Ontologie CIDOC-CRM, ein TEI XML ODD sowie das Refactoring von JavaScript und XSLT, die für die RDF-Generierung und die Webentwicklung verwendet werden. Dazu gehört auch die Überarbeitung der HTML5-Validierung und Web-Accessibility sowie die Responsivität der Webpräsentation. Ein weiterer Bearbeitungsschritt betrifft prototypische Datenvisualisierungen, deren Design und Implementierung insbesondere durch das ChatGPT-Plugin “Code Interpreter” unterstützt werden kann. Im Folgenden sind einige, jedoch nicht alle Bearbeitungsschritte aufgelistet.


### TEI XML

Die TEI XML Version vom 31.1.2017 ([https://gams.uni-graz.at/o:ufbas.1563](https://gams.uni-graz.at/o:ufbas.1563)) wird grundlegend überarbeitet. Einige dieser Änderungen können als trivial angesehen werden und erfordern kein LLM. Der eigentliche Nutzen liegt jedoch in der unterstützten bzw. automatisierten Generierung eines Skripts durch GPT-4, das basierend auf dem Projektkontext, den Problemen und Beispielen im Prompt bzw. in der Conversation bereitgestellt wird. Dies minimiert manuelle Eingriffe und verbessert die Effizienz und Genauigkeit des gesamten Prozesses. Dies beinhaltet die folgenden beispielhaften Aufgaben:



* Anpassung der @ana-Referenzen zur semantischen Anreicherung des edierten Textes: `@ana="#uf_Eintrag"` zu `@ana="uf:entry"`. 
* Überarbeitung des teiHeaders in Anlehnung an das neue teiHeader Template, das in den letzten Jahren am ZIM entwickelt wurde.
* Vereinheitlichung im Rahmen der am ZIM erarbeiteten Coding Conventions, z.B. bei der Vergabe von @xml:id.
* Normalisierungen und Verlinkungen von Entitäten, wie beispielsweise Taten oder Strafen.
* Erstellung eines ODD Files auf Basis des TEI XML.

Die GPT-Assistenz umfasst die Analyse und die Fehlersuche im TEI XML, sowie das darauf aufbauende Programmieren der Datentransformation mittels XSLT oder Python. 


### Kategorien & SKOS

Die im TEI XML referenzierten Kategorien sind derzeit in einem eigenständigen TEI XML Dokument ([https://gams.uni-graz.at/o:ufbas.kategorien](https://gams.uni-graz.at/o:ufbas.kategorien)) abgebildet. Dieses Dokument wird nach SKOS überführt und die Referenzierung der Kategorien im TEI XML auf das SKOS angepasst.

Die Transformation von TEI XML nach SKOS erfolgt mit dem GPT-4 Code Interpreter. Dabei werden die Ein- und Ausgabedaten mittels “Few-shot prompting” übergeben und mit diesem "in-context-learning" ein Python-Skript für die Transformation generiert. \
 \
Ontologie

Im Rahmen von UFBAS wurde kein RDFS- oder OWL-File zur formalen Beschreibung des Datenmodells für RDF-Daten realisiert. Im Overhaul wird dafür eine domänenspezifische Ontologie entwickelt, die die assertive Schicht _(Vogeler 2019)_ eines Eintrags in einem Urfehdebuch beschreibt. Diese Ontologie beschreibt Tat, Täter und Strafe sowie weitere Phänomene, die in den RDF-Daten repräsentiert werden. Um das Alignment zu gewährleisten, ist eine CIDOC-CRM Ableitung der domänenspezifischen Ontologie enthalten.

GPT-4 wird dafür im Prozess des Ontology Engineerings eingesetzt. 

RDF

Beim Ingest-Prozess in GAMS wird RDF aus TEI XML mithilfe von XSLT extrahiert. Dieses RDF ([https://gams.uni-graz.at/o:ufbas.1563/RDF](https://gams.uni-graz.at/o:ufbas.1563/RDF)) wird an die domänenspezifische Ontologie angepasst, ebenso werden weitere Verbesserungen am RDF XML vorgenommen. Es wird getestet, welche weiteren Normalisierungen und semantischen Anreicherungen der Daten mit Wikidata möglich sind, um die FAIRness _(Wilkinson et al. 2016)_ der Daten signifikant zu verbessern. Beispielsweise Anpassungen umfassen: 



* Ergänzungen fehlender `rdf:type`.
* Vereinheitlichung von Klassen und Properties nach der Ontologie: `uf:Beruf `zu `uf:Occupation`
* Vereinheitlichung und Integration zwischenzeitlich entwickelter GAMS-spezifischer Ontologien: `g2o:inhalt` zu `gams:textualContent`.
* Metadaten zum RDF Datensatz mittels VoID Vocabulary ([https://www.w3.org/TR/void/](https://www.w3.org/TR/void/)). 
* Verwendung anderer bestehender Vokabulare wie schema.org, wo möglich.

GPT-4 wird im Refactoring der Transformation nach RDF eingesetzt. 


### Webentwicklung

Ein wichtiger Aspekt unserer Verbesserungspläne ist die Überarbeitung der Webrepräsentation. Dies umfasst nicht nur die Sicherstellung von Responsivität, Accessibility und HTML5-Validität, sondern auch das Upgrade auf Bootstrap 5 und andere JavaScript-Bibliotheken, sowie die Überarbeitung des Designs. Dabei werden auch die Such- und Explorations-Funktionalitäten der Website überarbeitet und ggf. erweitert. Insgesamt wird dadurch die FAIRness der Daten verbessert. Auch das Schreiben von Tests soll in diesem Zusammenhang geschehen. 

GPT-4 wird für die Problemanalyse, das Refactoring und die Neuentwicklungen eingesetzt.


### Datenvisualisierung 

Schließlich werden die Visualisierungen vollständig überarbeitet. In der UFBAS-Version vom 31.1.2017 wurde eine Netzwerkvisualisierung implementiert, die ein Suchergebnis nach einer Kategorie darstellt. Dabei wurden Täter:innen, ihre Berufe, verknüpfte Orte, Tat und Strafe in einem Graphen abgebildet. Die Aussagekraft dieser Visualisierung sowie die Handhabung sind nicht ideal, da sie eher als Experiment gegen Ende des Projekts umgesetzt wurden (https://tinyurl.com/4nejhksf).

GPT-4 wird während des gesamten Prozesses von der Konzeption über das Prototyping bis hin zur Implementierung eingesetzt.


# Fazit

Die Integration von KI, insbesondere von GPT-4, hat das Potenzial, nicht nur das UFBAS-Projekt auf eine neue Ebene zu heben, sondern auch wertvolle Erkenntnisse und Erfahrungen zu liefern, die zur Weiterentwicklung der Anwendung von KI in den digitalen Geisteswissenschaften beitragen können.

Ziel ist es, das Potenzial neuer Technologien wie LLM und generativer KI für die Überarbeitung, Optimierung, Ergänzung und Neugestaltung bestehender digitaler Editionsprojekte auszuloten. Die gewonnenen Erkenntnisse können auch für die Konzeption neuer Projekte genutzt werden. Die Vorgehensweise und der Aufwand werden daher ausführlich dokumentiert und erläutert, was gerade bei so schnelllebigen Technologien unerlässlich ist. Für die Reproduzierbarkeit von Forschung auch im Sinne von Nachnutzbarkeit und Open Science stellt diese Technologie eine neue Herausforderung dar. Die Dokumentation des GPT-4 Overhauls wird in einem GitHub Repository veröffentlicht (https://github.com/chpollin/Overhaul-UFBAS). Die Ergebnisse des Overhauls werden auf einem nicht veröffentlichten Entwicklungsserver laufend angepasst und bis zur DHd2024 als neue Version in GAMS veröffentlicht.

Bibliografie \

* AI Explained. 2023. 12 New Code Interpreter Uses (Image to 3D, Book Scans, Multiple Datasets, Error Analysis ... ). [https://www.youtube.com/watch?v=_njf22xx8BQ](https://www.youtube.com/watch?v=_njf22xx8BQ). 
* AI Explained. 2023. GPT 4 Got Upgraded - Code Interpreter (Ft. Image Editing, MP4s, 3D Plots, Data Analytics and More!). [https://www.youtube.com/watch?v=O8GUH0_htRM](https://www.youtube.com/watch?v=O8GUH0_htRM). 
* Andrae, M., Blumesberger, S., Edler, S., Ernst, J., Fiedler, S., Haslinger, D., Neustätter, G. und Trieb, D. 2020. “Barrierefreiheit für Repositorien. Ein Überblick über technische und rechtliche Voraussetzungen”, Mitteilungen der Vereinigung Österreichischer Bibliothekarinnen und Bibliothekare, 73(2), S. 259–277. [https://doi.org/10.31263/voebm.v73i2.3640](https://doi.org/10.31263/voebm.v73i2.3640). 
* Chen, Zhutian, Chenyang Zhang, Qianwen Wang, Jakob Troidl, Simon Warchol, Johanna Beyer, Nils Gehlenborg, und Hanspeter Pfister. 2023. ‘Beyond Generating Code: Evaluating GPT on a Data Visualization Course’. [https://doi.org/10.48550/arXiv.2306.02914](https://doi.org/10.48550/arXiv.2306.02914).
* Haoye Tian et al. 2023. ‘Is ChatGPT the Ultimate Programming Assistant -- How Far Is It?’. [https://doi.org/10.48550/arXiv.2304.11938](https://doi.org/10.48550/arXiv.2304.11938). 
* Johannes, Stigler und Elisabeth Steiner, ‘GAMS–Eine Infrastruktur Zur Langzeitarchivierung Und Publikation Geisteswissenschaftlicher Forschungsdaten’, Mitteilungen Der Vereinigung Österreichischer Bibliothekarinnen Und Bibliothekare 71, no. 1 (2018): 207–16. \
* OpenAI. 2023. ‘GPT-4 Technical Report’. arXiv [https://doi.org/10.48550/ARXIV.2303.08774](https://doi.org/10.48550/ARXIV.2303.08774).
* Pollin, C. und Vogeler G. 2017: Semantically Enriched Historical Data. Drawing on the Example of the Digital Edition of the “Urfehdebucher der Stadt Basel”. WHiSe.
* Russell A. Poldrack, Thomas Lu, und Gašper Beguš, ‘AI-Assisted Coding: Experiments with GPT-4’ (arXiv, 25 April 2023). [https://doi.org/10.48550/arXiv.2304.13187](https://doi.org/10.48550/arXiv.2304.13187).
* Susanna Burghartz, Sonia Calvi, und Georg Vogeler. 2017. ‘Urfehdebücher Der Stadt Basel – Digitale Edition’, digital edition, Urfehdebücher der Stadt Basel – digitale Edition. [http://gams.uni-graz.at/context:ufbas](http://gams.uni-graz.at/context:ufbas).
* Georg Vogeler. 2019. ‘The “Assertive Edition”’, International Journal of Digital Humanities 1, no. 2 (1 July 2019): 309–22. [https://doi.org/10.1007/s42803-019-00025-5](https://doi.org/10.1007/s42803-019-00025-5). 
* Wilkinson, et al. 2016: The FAIR Guiding Principles for scientific data management and stewardship. Sci Data 3, 160018.[ https://doi.org/10.1038/sdata.2016.18](https://doi.org/10.1038/sdata.2016.18).


<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]:
     Es ist darauf hinzuweisen, dass die Entwicklung von Open-Source-Modellen rasch voranschreitet und GPT-4-äquivalente Modelle möglicherweise in naher Zukunft verfügbar sein werden und aus vielen Gründen (z. B. transparente Trainingsdaten) GPT-4 vorzuziehen sind.