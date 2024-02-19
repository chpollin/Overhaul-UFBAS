# Datenvisualisierung

## Analyse des TEI XML

### Prompt

This TEI XML represents the Urfehdenbuch X of the city of Basel (1563-1569).In this TEI XML a historical text has been annotated.

Encoding guidelines:
'''
References to the data model are made by references in the global attribute @ana.In addition to references to the data model, monetary amounts are encoded using <measure>. Abbreviations are resolved using <ex>. Notes are assigned to an unspecified additional layer in the @change attribute. The @rend attribute is used to describe visual appearances that deviate from the normal text flow (position of annotations on the margin: margin, superscript: super). Editors' annotations are marked with @resp="#editor". Marks with squiggles or floral characters are coded as <metamark>.Line breaks at the beginning of headings or notes should be added implicitly, as they are encoded in the text flow of the paragraphs.Eight hands (specified in the @scribe attribute of the <handShift> encoding) are distinguishable without further identification, so the source description omits the encoding. The list of identifiable and referenced locations is captured in the <back> of the text. The RDF representation primarily uses a vocabulary developed for mapping the data model in the project from the namespace "http://gams.uni-graz.at/ufbas/#", which is explained in the category list and is available as a TEI-coded taxonomy. The mapping of these categories into a formal ontology that can be further used in historical crime research remains a research desideratum that could not be achieved with the resources available to the teaching project. The relationships between factual statements and text are expressed via the oa:hasTarget property. Place names are encoded by skos:prefLabel.
'''

The second file (ufbas-categories.xml) contains the categories.

Just focus on the <text> and ignore the teiHeader.

You are an expert in criminal history and exploratory Data Analysis. I would like you to analyse the dataset in detail and perform several analyses to explore the dataset. Be very detailed and work step by step.
