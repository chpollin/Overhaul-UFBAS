---
title: TEI Document Structure - Basel Oath of Peace Books Categories
keywords: TEI, Basel Oath of Peace Books, Categorization, XML, Historical Data, TEI, Offenses, Penalties, Hierarchy, Keywords, Legal Formalities, Person, Gender, Additional Person Identifiers, Location, Legal Procedure Categories, Offense Categories, Keyword Categories, Punishment Categories, Date Categories, Notarial Authentication 
---

# Erschliessungskategorien der Urfehdebücher der Stadt Basel (TEI XML); (Basel Oath of Peace Books: TEI Document Structure Categories)

## Overview
- Document Purpose: 
  - Description: Categories for detailed exploration of Basel Oath of Peace Books.
  - Functionality: Selection of categories to view related entries.

## Person-Related Categories
- Person
  - `uf_PersonTäter`: Täter (Offender, Suspect)
  - `uf_PersonMittäter`: Mittäter (Accomplice, possibly liable in further oath proceedings)
  - `uf_PersonOpfer`: Opfer (Victim)
  - `uf_PersonKläger`: Kläger (Plaintiff)
  - `uf_PersonZeuge`: Zeuge (Witness)
  - `uf_PersonAnwesende`: Anwesend bei Tat (Person present at the crime scene but not testifying)
  - `uf_PersonHehler`: Hehler (Person dealing in stolen goods)
  - `uf_PersonNotar`: Notar (Notary authenticating the oath)

## Gender
- `uf_male`: Male
- `uf_female`: Female

## Additional Person Identifiers
- `uf_Beiname`: Nickname (Name used by the community)
- `uf_Beruf`: Profession
- `uf_Zivilstand`: Civil Status (Marital status variations)
- `uf_Status`: Status (Occupational, academic titles, and legal status)
- `uf_Verwandtschaftsgrad`: Degree of Kinship (Family relationships)

## Location
- `uf_Ort`: Location 
  - `uf_OrtHerkunft`: Place of origin
  - `uf_OrtWohnort`: Residence
  - `uf_OrtTatort`: Crime scene
`
## Legal Procedure Categories
- `uf_Vorinstanz`: Preceding Instance (Entity previously handling the case)
- `uf_FrüheresUrfehdeverfahren`: Previous Oath of Peace Procedure (Indicating past completed procedure involving the same person)
- `uf_AnderesUrfehdeverfahren`: Other Oath of Peace Procedure (Reference to another person's procedure)
- `uf_Untersuchungshaft`: Pretrial Detention (Incarceration before the oath)

## Offense Categories
  - `uf_Tat`: Offense (General category for criminal acts)
    - `Alkoholmissbrauch`: Excessive alcohol consumption, drunkenness.
    - `Arbeitsverweigerung`: Refusal to perform a work assignment.
    - `Aus dem Haus fordern`: Perpetrator challenges the victim to leave the safety of the house.
    - `Bewaffnete Auseinandersetzung`: Conflicts involving the use of weapons.
    - `Beihilfe zu XY`: Complicity in a crime (excluding murder).
    - `Beihilfe zu Mord`: Complicity in murder.
    - `Beleidigung, Verleumdung`: Insult or slander.
    - `Bestechung`: Bribery involving money.
    - `Betrug`: Fraud in dealings with money, price, weight, etc.
    - `Betteln`: Begging.
    - `Böswilliges Verlassen`: Malicious abandonment of the family.
    - `Brandstiftung`: Arson.
    - `Bruch des Eheversprechens`: Breach of engagement or marriage promise.
    - `Diebstahl`: Theft of money, valuables, or objects.
    - `Drohung`: Verbal threat.
    - `Ehebruch`: Adultery.
    - `Einbruch`: Burglary or break-in theft.
    - `Gotteslästerung`: Blasphemy or cursing.
    - `Hehlerei`: Trading in stolen goods.
    - `Inzest`: Sexual relations with relatives (parents, children, siblings, etc.).
    - `Körperverletzung`: Willful injury of another person.
    - `Leichtfertigkeit`: Immoral sexual behavior; irresponsible conduct concerning marriage promises.
    - `Mord`: Deliberate, treacherous killing of another.
    - `Mordversuch`: Attempted deliberate, treacherous killing.
    - `Müssiggang`: Immoral, work-shy lifestyle not aimed at securing one's livelihood.
    - `Ordnungsstörung`: Disturbance of public order.
    - `Sachbeschädigung`: Damage to property (objects, real estate, etc.).
    - `Schlägerei`: Physical altercation between two or more perpetrators.
    - `Schulden`: Incurring debts beyond one's financial means.
    - `Selbstmordversuch`: Suicide attempt.
    - `Spielen`: Illegal gambling.
    - `Totschlag`: Killing of another person.
    - `Übertretung Urfehde`: Violation of a previous oath of peace judgment against the same person.
    - `Übles Haushalten`: Neglect of household and family.
    - `Unerlaubter Kriegsdienst`: Military service despite explicit prohibition.
    - `Ungehorsam`: Resistance or defiance against a specific official directive.
    - `Ungetreue Amtsführung`: Non-compliant execution of an office.
    - `Unrechtmässiges Eheversprechen`: Giving an unlawful marriage promise.
    - `Unterlassene Hilfeleistung`: Omission or refusal of assistance.
    - `Unzucht`: Illicit sexual relationship (excluding adultery for married individuals).
    - `Vagieren`: Non-sedentary, wandering lifestyle.
    - `Verbale Auseinandersetzung`: Verbal dispute between two or more perpetrators.
    - `Verstoss gegen Arbeitsvorschriften`: Violations of work regulations or guild constraints.
    - `Veruntreuung`: Embezzlement or misappropriation of funds.
    - `Vortäuschung falscher Tatsachen`: Pretense of false facts.
    - `Vorteilsnahme`: Illicitly obtaining a benefit.
    - `Wiedertäuferei`: Anabaptism.
    - `Widerstand gegen Obrigkeit`: General resistance against authority figures (can also be politically motivated).
    - `Wilderei`: Illegal hunting.
    - `Zechprellerei`: Failure to pay the (tavern) bill.

## Keyword Categories
  - `uf_Schlagwort`: Keywords (General category, specific keywords not detailed). This category encompasses various contextual keywords associated with the offenses.
    - `Androhung Todesstrafe`: Threat of capital punishment in case of oath violation.
    - `Armut`: Poverty.
    - `Auf den Hals wachsen`: Threat of corporal punishment.
    - `Auffällig`: Notable or interesting facts.
    - `Bannherren`: Members of the ban courts.
    - `Behinderung`: Reference to a disabled person.
    - `Bettelvogt`: Overseer for external beggars.
    - `Bettler`: Begging, beggars.
    - `Blutvogt`: Reference to the executioner.
    - `Bürgerrecht`: Citizenship issues or processes.
    - `Bürgermeister`: References to mayors.
    - `Dienstmagd`: Maid-servant.
    - `Ehegericht, Eherichter`: References to the marriage court or judges.
    - `Erbstreit`: Inheritance disputes.
    - `Ertränken`: Punishment by drowning.
    - `Foltern`: References to torture.
    - `Führen`: Punishment by leading (often bound, considered dishonorable).
    - `Frauenarbeit`: References to women's work (specific to lower classes).
    - `Gefängnis`: References to a specific prison or holding location.
    - `Geldleihe`: Money lending (often mentioned in context with Jews).
    - `Halseisen`: Punishment with a neck iron.
    - `Juden`: Mentions of Jews.
    - `Kein Geständnis`: Cases with explicitly no confession.
    - `Heimliche Herren`: Mention of the Secret Lords.
    - `Knecht`: Servant (analogous to maid-servant).
    - `Ladenherren`: Mention of shop owners.
    - `Lohn, Verdienst`: References to wages or earnings.
    - `Lonherren`: Mention of Lonherren.
    - `Meerwunder`: Mention of a sea miracle.
    - `Meineid`: Reference to perjury.
    - `Mitgift`: Information on dowry.
    - `Nachbar`: References to neighbors.
    - `Oberster Knecht`: Mention of the Chief Servant.
    - `Prostitution`: References to prostitution.
    - `Rat`: Mention of the (Small) Council or a specific councilman.
    - `Ratsknecht`: Mention of a council servant.
    - `Ruten`: Punishment with rods.
    - `Schulden`: References to debts (not pursued as an offense).
    - `Schultheiss`: Mention of a bailiff.
    - `Schwemmen`: Punishment by flushing.
    - `Schwert`: Capital punishment by sword.
    - `Siebnerherren`: Mention of the inquisitorial judges (Siebnerherren).
    - `Siegelbrief`: Mention of a sealed letter/document.
    - `Spinnen`: Reference to the activity of spinning (specific to lower-class women's work).
    - `Spital`: Reference to the hospital (elderly and poor care).
    - `Stadtgericht`: Reference to the city court (different judicial instance).
    - `Stadtknecht`: Mention of a city servant.
    - `Stadtwechsel`: Reference to the city exchange (bank).
    - `UnehelichesKind`: Reference to an illegitimate child (considered dishonorable).
    - `Unschuldig`: Explicit determination of innocence in the oath of peace process.
    - `Welsche`: Reference to foreigners, often of Italian or French origin.
    - `Wirtshaus`: Taverns (significant as communication hubs).
    - `Zoll`: Toll/toll station.
    - `Zunft`: References related to guilds.specific prison or holding location.
    - `Geldleihe`: Money lending (often mentioned in context with Jews).
    - `Halseisen`: Punishment with a neck iron.
    - `Juden`: Mentions of Jews.
    - `Kein Geständnis`: Cases with explicitly no confession.
    - `Heimliche Herren`: Mention of the Secret Lords.
    - `Knecht`: Servant (analogous to maid-servant).
    - `Ladenherren`: Mention of shop owners.
    - `Lohn, Verdienst`: References to wages or earnings.
    - `Lonherren`: Mention of Lonherren.
    - `Meerwunder`: Mention of a sea miracle.
    - `Meineid`: Reference to perjury.
    - `Mitgift`: Information on dowry.
    - `Nachbar`: References to neighbors.
    - `Oberster Knecht`: Mention of the Chief Servant.
    - `Prostitution`: References to prostitution.
    - `Rat`: Mention of the (Small) Council or a specific councilman.
    - `Ratsknecht`: Mention of a council servant.
    - `Ruten`: Punishment with rods.
    - `Schulden`: References to debts (not pursued as an offense).
    - `Schultheiss`: Mention of a bailiff.
    - `Schwemmen`: Punishment by flushing.
    - `Schwert`: Capital punishment by sword.
    - `Siebnerherren`: Mention of the inquisitorial judges (Siebnerherren).
    - `Siegelbrief`: Mention of a sealed letter/document.
    - `Spinnen`: Reference to the activity of spinning (specific to lower-class women's work).
    - `Spital`: Reference to the hospital (elderly and poor care).
    - `Stadtgericht`: Reference to the city court (different judicial instance).
    - `Stadtknecht`: Mention of a city servant.
    - `Stadtwechsel`: Reference to the city exchange (bank).
    - `UnehelichesKind`: Reference to an illegitimate child (considered dishonorable).
    - `Unschuldig`: Explicit determination of innocence in the oath of peace process.
    - `Welsche`: Reference to foreigners, often of Italian or French origin.
    - `Wirtshaus`: Taverns (significant as communication hubs).
    - `Zoll`: Toll/toll station.
    - `Zunft`: References related to guilds.

## Punishment Categories
  - `uf_Strafe`: Punishment (All judgments or penalties specified in the oath)
   - `uf_StrafeAmtsentlassung`: Dismissal from office
    - `uf_StrafeAusweisung`: Banishment from a specific area (often Basel or its territory)
    - `uf_StrafeEntschädigungRückzahlung`: Compensation, repayment of debts
    - `uf_StrafeEntschuldigung`: Public or personal apology to the victim
    - `uf_StrafeErmahnung`: Warning regarding future behavior
    - `uf_StrafeGefängnis`: Prison sentence post-oath
    - `uf_StrafeGeldstrafe`: Monetary fine payable to authorities
    - `uf_StrafeHausarrest`: House arrest
    - `uf_StrafeKörperstrafe`: Physical punishment
    - `uf_StrafeStrafandrohung`: Threat of punishment in case of oath violation
    - `uf_StrafeAusnahme`: Restrictions and conditions for the validity/application of punishment
    - `uf_StrafeMilderung`: Circumstances leading to a reduced punishment (e.g., age, intercession, etc.)
    - `uf_StrafeStrafumwandlung`: Conversion of one type of punishment to another (usually monetary to imprisonment)
    - `uf_StrafeUrteilohneStrafe`: Judgment that includes no punishment
    - `uf_StrafeVerbot`: Various prohibitions (excluding specific bans detailed separately)
    - `uf_StrafeVerbotSpiel`: Ban on unlawful gambling
    - `uf_StrafeVerbotTanz`: Dance ban
    - `uf_StrafeVerbotWaffen`: Weapons carrying ban
    - `uf_StrafeVerbotWirtshaus`: Tavern visit ban
    - `uf_StrafeWeisungananderesGericht`: Directive to refer the case to another court
    - `uf_StrafeWiedergutmachung`: Making amends to the victim (excluding compensation/payback)

## Date Categories (`uf_Datum`)
  - `uf_DatumTat`: Date of the offense (time when the act was committed)
  - `uf_DatumUrfehde`: Date of the Oath of Peace (time when the oath was sworn)
  - `uf_DatumFrist`: Date of a deadline (duration or expiry date of a deadline)
  - `uf_DatumBegnadigung`: Date of pardon (time when a person was pardoned)

## Notarial Authentication (`uf_NotarialSubscription`)
  - Notarized authentication of the Oath of Peace by a notary