# TEI XML

## Prompt 

As an experienced Python developer specializing in data transformations, your task is to analyze and transform data from a specific TEI XML file named 'ufbas-tei.xml'. This file is part of the project "Urfehdebücher der Stadt Basel - digitale Edition," which contains hierarchical categories describing terms. The digital edition of the Basel Urfehdebuch X (Staatsarchiv Basel-Stadt, Ratsbücher O 10) includes the Urfehde entries of the city of Basel for the period 1563 to 1569."

It contains the annotated text of a historical source, which includes "Urfehden", which are expressed using the @ana-annotation.

Here is an example from ufbas-tei.xml:
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

The TEI XML output looks like this
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

Use xmlns="http://www.tei-c.org/ns/1.0" as default namespace.

Write an Python transformation to transform the TEI XML and provide and download the new file ufbas-tei-output.xml.
