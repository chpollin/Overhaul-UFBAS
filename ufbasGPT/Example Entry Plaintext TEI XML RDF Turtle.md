
---
title: Example Entry: Plain Text, Annotations, TEI XML, RDF Turtle
keywords: EI, RDF, SKOS, Plain Text, Annotations, TEI XML, RDF Turtle
---

example plain text:
´´´
° Bastean Doldter der kupfferschmidt
burger inn mindren Basell

Demnach er und Hanns Üle der waffenschmidt, von Lorentzen
dem scherer am vischmerckt hundert pfundt entlehnet und
imme zwey hüser ingsetzt, hat er uff dem einen huss hundert
pfundt verschwygen, als man im auch desshalben für recht ge-
botten, hatt er den amptlüthen zuo antwort geben, wann man
im schon piete so wölle er nit kommen, dorumb er inn
gfenckniss gleyt und uff sontag den dritten tag jenners ditz
63 jors, mit gmeyner urphet gnediglichen wider usglossen, hatt
dorby auch geschworen das er inn monats frist nechtkünfftig
den bemelten scherer anclagbar machen, und wann man im
hinfürt für gericht oder rhat bütet, das er gehörig und
gehorsam sin solle.
Niclaus Im Hoff Not[ariu]s s[ub]s[crip]s[it]
´´´

Annoatation: 
´´´
* Datum: 1563-01-03
* Person
  * Täter: Bastean Doldter der kupfferschmidt burger inn mindren Basell
  * Mittäter: Hanns Üle der waffenschmidt
  * Opfer: Lorentzen dem scherer am vischmerckt
  * Notar: Niclaus Im Hoff Notarius
* Tatbestand: 
  * Betrug
  * Ungehorsam
* Strafe: Ermahnung
* Orte
  * Wohnort: mindren Basell
  * Wohnort: vischmerckt
* Schlagwort
  * Ratsknecht
  * Geldleihe
´´´

TEI XML 
´´´

<div ana="#uf_Eintrag" xml:id="Eintrag-0">
<note ana="#uf_Eingangsnotiz" rend="margin" xml:id="Eingangsnotiz-0">
<persName ana="#uf_SchlagwortRatsknecht" xml:id="SchlagwortRatsknecht-0">Steck</persName>
-
<num>1</num>
</note>
<head>
<metamark rend="Kringel">°</metamark>
<persName ana="#uf_PersonTäter" xml:id="PersonTäter-0">
<forename ana="#uf_male" xml:id="male-0">Bastean</forename>
<surname>Doldter</surname>
der
<roleName ana="#uf_Beruf" xml:id="Beruf-0">kupfferschmidt</roleName>
<lb/>
<roleName ana="#uf_Status" xml:id="Status-0">burger</roleName>
inn
<placeName ana="#uf_OrtWohnort" ref="#Kleinbasel" xml:id="OrtWohnort-0">mindren Basell</placeName>
</persName>
</head>
<lb/>
<p>
Demnach er und
<persName ana="#uf_PersonMittäter" xml:id="PersonMittäter-0">
<forename ana="#uf_male" xml:id="male-1">Hanns</forename>
<surname>Üle</surname>
der
<roleName ana="#uf_Beruf" xml:id="Beruf-1">waffenschmidt</roleName>
</persName>
, von
<persName ana="#uf_PersonOpfer" xml:id="PersonOpfer-0">
<forename ana="#uf_male" xml:id="male-2">Lorentzen</forename>
<lb/>
dem
<roleName ana="#uf_Beruf" xml:id="Beruf-2">scherer</roleName>
am
<placeName ana="#uf_OrtWohnort" xml:id="OrtWohnort-1">vischmerckt</placeName>
</persName>
<term ana="#uf_SchlagwortGeldleihe" xml:id="SchlagwortGeldleihe-0">
<measure quantity="100" type="currency" unit="lbd">hundert pfundt</measure>
entlehnet
</term>
und
<lb/>
imme zwey hüser ingsetzt, hat er uff dem einen huss
<seg ana="#uf_TatBetrug" xml:id="TatBetrug-0">
<measure quantity="100" type="currency" unit="lbd">
hundert
<lb/>
pfundt
</measure>
verschwygen
</seg>
, als man im auch desshalben für recht ge
<lb break="no"/>
botten, hatt er den amptlüthen zuo antwort geben,
<seg ana="#uf_TatUngehorsam" xml:id="TatUngehorsam-0">
wann man
<lb/>
im schon piete so wölle er nit kommen
</seg>
,
<seg ana="#uf_Untersuchungshaft" xml:id="Untersuchungshaft-0">
dorumb er inn
<lb/>
gfenckniss gleyt
</seg>
und uff
<date ana="#uf_DatumUrfehde" calendar="Julian" when="1563-01-03" xml:id="DatumUrfehde-0">
sontag den dritten tag jenners ditz
<lb/>
63 jors
</date>
,
<seg ana="#uf_Urfehdeeid" xml:id="Urfehdeeid-0">mit gmeyner urphet gnediglichen wider usglossen</seg>
, hatt
<lb/>
dorby auch geschworen
<seg ana="#uf_StrafeErmahnung" xml:id="StrafeErmahnung-0">
das er
<date ana="#uf_DatumFrist" dur="P1M" xml:id="DatumFrist-0">inn monats fris</date>
t nechtkünfftig
<lb/>
den bemelten scherer anclagbar machen, und wann man im
<lb/>
hinfürt für gericht oder rhat bütet, das er gehörig und
<lb/>
gehorsam sin solle
</seg>
.
</p>
<lb/>
<p ana="#uf_NotarialSubscription" xml:id="NotarialSubscription-0">
<persName ana="#uf_PersonNotar" xml:id="PersonNotar-0">
<forename ana="#uf_male" xml:id="male-3">Niclaus</forename>
<surname>Im Hoff</surname>
<roleName ana="#uf_Beruf" xml:id="Beruf-3">
Not
<ex>ariu</ex>
s
</roleName>
</persName>
s
<ex>ub</ex>
s
<ex>crip</ex>
s
<ex>it</ex>
</p>
</div>
´´´

RDF XML 
´´´
@prefix g2o: <http://gams.uni-graz.at/ontology/#> .
@prefix oa: <http://www.w3.org/ns/oa#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .
@prefix tei: <http://www.tei-c.org/ns/1.0> .
@prefix uf: <http://gams.uni-graz.at/o:ufbas.1563#> .

<uf:Eintrag-Eintrag-0> a uf:Eintrag ;
    uf:hasDatumUrfehde <uf:DatumUrfehde-DatumUrfehde-0> ;
    uf:hasEingangsnotiz <uf:Eingangsnotiz-Eingangsnotiz-0> ;
    uf:hasNotarialSubscription <uf:NotarialSubscription-NotarialSubscription-0> ;
    uf:hasPersonMittäter <uf:PersonMittäter-PersonMittäter-0> ;
    uf:hasPersonOpfer <uf:PersonOpfer-PersonOpfer-0> ;
    uf:hasPersonTäter <uf:PersonTäter-PersonTäter-0> ;
    uf:hasSchlagwortGeldleihe <uf:SchlagwortGeldleihe-SchlagwortGeldleihe-0> ;
    uf:hasStrafeErmahnung <uf:StrafeErmahnung-StrafeErmahnung-0> ;
    uf:hasTatBetrug <uf:TatBetrug-TatBetrug-0> ;
    uf:hasTatUngehorsam <uf:TatUngehorsam-TatUngehorsam-0> ;
    uf:hasUntersuchungshaft <uf:Untersuchungshaft-Untersuchungshaft-0> ;
    uf:hasUrfehdeeid <uf:Urfehdeeid-Urfehdeeid-0> ;
    oa:hasTarget <uf:Eintrag-0> .

<uf:DatumUrfehde-DatumUrfehde-0> a uf:DatumUrfehde ;
    tei:when "1563-01-03" ;
    oa:hasTarget <uf:DatumUrfehde-0> .

<uf:Eingangsnotiz-Eingangsnotiz-0> a uf:Eingangsnotiz ;
    uf:hasSchlagwortRatsknecht <uf:SchlagwortRatsknecht-SchlagwortRatsknecht-0> ;
    oa:hasTarget <uf:Eingangsnotiz-0> .

<uf:NotarialSubscription-NotarialSubscription-0> a uf:NotarialSubscription ;
    uf:hasPersonNotar <uf:PersonNotar-PersonNotar-0> ;
    oa:hasTarget <uf:NotarialSubscription-0> .

<uf:PersonMittäter-PersonMittäter-0> a uf:PersonMittäter ;
    uf:forename "Hanns" ;
    uf:gender uf:male ;
    uf:hasBeruf <uf:Beruf-Beruf-1> ;
    uf:surname "Üle" ;
    oa:hasTarget <uf:PersonMittäter-0> .

<uf:PersonOpfer-PersonOpfer-0> a uf:PersonOpfer ;
    uf:forename "Lorentzen" ;
    uf:gender uf:male ;
    uf:hasBeruf <uf:Beruf-Beruf-2> ;
    uf:hasOrtWohnort <uf:OrtWohnort-OrtWohnort-1> ;
    oa:hasTarget <uf:PersonOpfer-0> .

<uf:PersonTäter-PersonTäter-0> a uf:PersonTäter ;
    uf:forename "Bastean" ;
    uf:gender uf:male ;
    uf:hasBeruf <uf:Beruf-Beruf-0> ;
    uf:hasOrtWohnort <uf:Kleinbasel> ;
    uf:hasStatus <uf:Status-Status-0> ;
    uf:surname "Doldter" ;
    oa:hasTarget <uf:PersonTäter-0> .

<uf:SchlagwortGeldleihe-SchlagwortGeldleihe-0> a uf:SchlagwortGeldleihe ;
    oa:hasTarget <uf:SchlagwortGeldleihe-0> .

<uf:StrafeErmahnung-StrafeErmahnung-0> a uf:StrafeErmahnung ;
    uf:hasDatumFrist <uf:DatumFrist-DatumFrist-0> ;
    oa:hasTarget <uf:StrafeErmahnung-0> .

<uf:TatBetrug-TatBetrug-0> a uf:TatBetrug ;
    oa:hasTarget <uf:TatBetrug-0> .

<uf:TatUngehorsam-TatUngehorsam-0> a uf:TatUngehorsam ;
    oa:hasTarget <uf:TatUngehorsam-0> .

<uf:Untersuchungshaft-Untersuchungshaft-0> a uf:Untersuchungshaft ;
    oa:hasTarget <uf:Untersuchungshaft-0> .

<uf:Urfehdeeid-Urfehdeeid-0> a uf:Urfehdeeid ;
    oa:hasTarget <uf:Urfehdeeid-0> .

<uf:Eintrag-0> g2o:appears-on <uf:d1e97> ;
    g2o:inhalt "Steck - 1 ° Bastean Doldter der kupfferschmidt burger inn mindren Basell Demnach er und Hanns Üle der waffenschmidt, von Lorentzen dem scherer am vischmerckt hundert pfundt entlehnet und imme zwey hüser ingsetzt, hat er uff dem einen huss hundert pfundt verschwygen, als man im auch desshalben für recht gebotten, hatt er den amptlüthen zuo antwort geben, wann man im schon piete so wölle er nit kommen, dorumb er inn gfenckniss gleyt und uff sontag den dritten tag jenners ditz 63 jors, mit gmeyner urphet gnediglichen wider usglossen, hatt dorby auch geschworen das er inn monats frist nechtkünfftig den bemelten scherer anclagbar machen, und wann man im hinfürt für gericht oder rhat bütet, das er gehörig und gehorsam sin solle. Niclaus Im Hoff Notarius subscripsit" ;
    g2o:isPartOf <uf:> .
´´´