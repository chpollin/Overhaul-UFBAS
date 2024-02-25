from lxml import etree

'''
The aim of the programm tei-to-tei.py is to transform a TEI XML to a new and improved version of it.
The transformation is based on the following rules:
- The `@ana` attribute values are updated to replace the prefix `#uf_` with `uf:`.

TEI XML input (ufbas-tei.xml):
```xml
<div ana="#uf_Eintrag" xml:id="Eintrag-0">
    <note ana="#uf_Eingangsnotiz" rend="margin" xml:id="Eingangsnotiz-0"><persName ana="#uf_SchlagwortRatsknecht" xml:id="SchlagwortRatsknecht-0">Steck</persName> - <num>1</num></note>
    <head><metamark rend="Kringel">°</metamark> <persName ana="#uf_PersonTäter" xml:id="PersonTäter-0">
        <forename ana="#uf_male" xml:id="male-0">Bastean</forename> <surname>Doldter</surname> der <roleName ana="#uf_Beruf" xml:id="Beruf-0">kupfferschmidt</roleName><lb/> <roleName ana="#uf_Status" xml:id="Status-0">burger</roleName> inn <placeName ana="#uf_OrtWohnort" ref="#Kleinbasel" xml:id="OrtWohnort-0">mindren Basell</placeName></persName></head>
    <lb/>
    <p>Demnach er und <persName ana="#uf_PersonMittäter" xml:id="PersonMittäter-0"><forename ana="#uf_male" xml:id="male-1">Hanns</forename> <surname>Üle</surname> der <roleName ana="#uf_Beruf" xml:id="Beruf-1">waffenschmidt</roleName></persName>, von <persName ana="#uf_PersonOpfer" xml:id="PersonOpfer-0"><forename ana="#uf_male" xml:id="male-2">Lorentzen</forename><lb/> dem <roleName ana="#uf_Beruf" xml:id="Beruf-2">scherer</roleName> am <placeName ana="#uf_OrtWohnort" xml:id="OrtWohnort-1">vischmerckt</placeName></persName> <term ana="#uf_SchlagwortGeldleihe" xml:id="SchlagwortGeldleihe-0"><measure quantity="100" type="currency" unit="lbd">hundert pfundt</measure> entlehnet</term> und<lb/> imme zwey hüser ingsetzt, hat er uff dem einen huss <seg ana="#uf_TatBetrug" xml:id="TatBetrug-0"><measure quantity="100" type="currency" unit="lbd">hundert<lb/> pfundt</measure> verschwygen</seg>, als man im auch desshalben für recht ge<lb break="no"/>botten, hatt er den amptlüthen zuo antwort geben, <seg ana="#uf_TatUngehorsam" xml:id="TatUngehorsam-0">wann man<lb/> im schon piete so wölle er nit kommen</seg>, <seg ana="#uf_Untersuchungshaft" xml:id="Untersuchungshaft-0">dorumb er inn<lb/> gfenckniss gleyt</seg> und uff <date ana="#uf_DatumUrfehde" calendar="Julian" when="1563-01-03" xml:id="DatumUrfehde-0">sontag den dritten tag jenners ditz<lb/> 63 jors</date>, <seg ana="#uf_Urfehdeeid" xml:id="Urfehdeeid-0">mit gmeyner urphet gnediglichen wider usglossen</seg>, hatt<lb/> dorby auch geschworen <seg ana="#uf_StrafeErmahnung" xml:id="StrafeErmahnung-0">das er <date ana="#uf_DatumFrist" dur="P1M" xml:id="DatumFrist-0">inn monats fris</date>t nechtkünfftig<lb/> den bemelten scherer anclagbar machen, und wann man im<lb/> hinfürt für gericht oder rhat bütet, das er gehörig und<lb/> gehorsam sin solle</seg>.</p>
    <lb/>
    <p ana="#uf_NotarialSubscription" xml:id="NotarialSubscription-0"><persName ana="#uf_PersonNotar" xml:id="PersonNotar-0"><forename ana="#uf_male" xml:id="male-3">Niclaus</forename> <surname>Im Hoff</surname> <roleName ana="#uf_Beruf" xml:id="Beruf-3">Not<ex>ariu</ex>s</roleName></persName> s<ex>ub</ex>s<ex>crip</ex>s<ex>it</ex></p>
</div>
```

TEI XML output (ufbas-tei-output.xml)
```xml
<div ana="uf:Entry" xml:id="entry-0">
    <note ana="uf:Eingangsnotiz" rend="margin" xml:id="Eingangsnotiz-0"><persName ana="uf:SchlagwortRatsknecht" xml:id="SchlagwortRatsknecht-0">Steck</persName> - <num>1</num></note>
    <head><metamark rend="Kringel">°</metamark> <persName ana="uf:PersonTäter" xml:id="PersonTäter-0">
        <forename ana="uf:male" xml:id="male-0">Bastean</forename> <surname>Doldter</surname> der <roleName ana="uf:Occupation" xml:id="Occupation-0">kupfferschmidt</roleName><lb/> <roleName ana="uf:Status" xml:id="Status-0">burger</roleName> inn <placeName ana="uf:OrtWohnort" ref="#Kleinbasel" xml:id="OrtWohnort-0">mindren Basell</placeName></persName></head>
    <lb/>
    <p>Demnach er und <persName ana="uf:PersonMittäter" xml:id="PersonMittäter-0"><forename ana="uf:male" xml:id="male-1">Hanns</forename> <surname>Üle</surname> der <roleName ana="uf:Occupation" xml:id="Occupation-1">waffenschmidt</roleName></persName>, von <persName ana="uf:PersonOpfer" xml:id="PersonOpfer-0"><forename ana="uf:male" xml:id="male-2">Lorentzen</forename><lb/> dem <roleName ana="uf:Occupation" xml:id="Occupation-2">scherer</roleName> am <placeName ana="uf:OrtWohnort" xml:id="OrtWohnort-1">vischmerckt</placeName></persName> <term ana="uf:SchlagwortGeldleihe" xml:id="SchlagwortGeldleihe-0"><measure quantity="100" type="currency" unit="lbd">hundert pfundt</measure> entlehnet</term> und<lb/> imme zwey hüser ingsetzt, hat er uff dem einen huss <seg ana="uf:TatBetrug" xml:id="TatBetrug-0"><measure quantity="100" type="currency" unit="lbd">hundert<lb/> pfundt</measure> verschwygen</seg>, als man im auch desshalben für recht ge<lb break="no"/>botten, hatt er den amptlüthen zuo antwort geben, <seg ana="uf:TatUngehorsam" xml:id="TatUngehorsam-0">wann man<lb/> im schon piete so wölle er nit kommen</seg>, <seg ana="uf:Untersuchungshaft" xml:id="Untersuchungshaft-0">dorumb er inn<lb/> gfenckniss gleyt</seg> und uff <date ana="uf:DatumUrfehde" calendar="Julian" when="1563-01-03" xml:id="DatumUrfehde-0">sontag den dritten tag jenners ditz<lb/> 63 jors</date>, <seg ana="uf:Urfehdeeid" xml:id="Urfehdeeid-0">mit gmeyner urphet gnediglichen wider usglossen</seg>, hatt<lb/> dorby auch geschworen <seg ana="uf:StrafeErmahnung" xml:id="StrafeErmahnung-0">das er <date ana="uf:DatumFrist" dur="P1M" xml:id="DatumFrist-0">inn monats fris</date>t nechtkünfftig<lb/> den bemelten scherer anclagbar machen, und wann man im<lb/> hinfürt für gericht oder rhat bütet, das er gehörig und<lb/> gehorsam sin solle</seg>.</p>
    <lb/>
    <p ana="uf:NotarialSubscription" xml:id="NotarialSubscription-0"><persName ana="uf:PersonNotar" xml:id="PersonNotar-0"><forename ana="uf:male" xml:id="male-3">Niclaus</forename> <surname>Im Hoff</surname> <roleName ana="uf:Occupation" xml:id="Occupation-3">Not<ex>ariu</ex>s</roleName></persName> s<ex>ub</ex>s<ex>crip</ex>s<ex>it</ex></p>
</div>
```
'''

TEI_NAMESPACE_URI = "http://www.tei-c.org/ns/1.0"
NSMAP = {'tei': TEI_NAMESPACE_URI}

def transform_element(element):
    """Recursively copies and modifies the given element based on specified rules."""
    # Handle the transformation of `@ana` attributes
    if 'ana' in element.attrib:
        ana_values = element.attrib['ana'].split()
        updated_ana_values = [value.replace('#uf_', 'uf:') for value in ana_values]
        element.attrib['ana'] = ' '.join(updated_ana_values)
    # add to <encodingDesc> as first child <listPrefixDef> and <prefixDef ident="ufbas" matchPattern="([(a-z)|(A-Z)]+)" replacementPattern="https://gams.uni-graz.at/o:ufbas.ontology#$1">
    if element.tag == '{http://www.tei-c.org/ns/1.0}encodingDesc':
        listPrefixDef = etree.Element('{http://www.tei-c.org/ns/1.0}listPrefixDef')
        prefixDef = etree.Element('{http://www.tei-c.org/ns/1.0}prefixDef')
        prefixDef.set('ident', 'ufbas')
        prefixDef.set('matchPattern', '([(a-z)|(A-Z)]+)')
        prefixDef.set('replacementPattern', 'https://gams.uni-graz.at/o:ufbas.ontology#$1')
        listPrefixDef.append(prefixDef)
        element.insert(0, listPrefixDef)
    # add <?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
    # and add <?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
    # before <TEI>
    if element.tag == '{http://www.tei-c.org/ns/1.0}TEI':
        


    # Recurse through child elements
    for child in element:
        transform_element(child)

def transform_xml_file(input_file_path, output_file_path):
    with open(input_file_path, 'rb') as file:
        tree = etree.parse(file)
        root = tree.getroot()

    # Apply the transformation to the root element
    transform_element(root)

    # Write the transformed XML to the output file
    with open(output_file_path, 'wb') as output_file:
        output_file.write(etree.tostring(root, pretty_print=True, xml_declaration=True, encoding='UTF-8'))

# Set the paths for the input and output files
input_file_path = '/home/chrisi/Documents/GitHub/Overhaul-UFBAS/TEI XML/ufbas-tei.xml'
output_file_path = '/home/chrisi/Documents/GitHub/Overhaul-UFBAS/TEI XML/ufbas-tei-output.xml'

# Call the function to perform the transformation and save the output
transform_xml_file(input_file_path, output_file_path)
