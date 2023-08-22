<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all">

    <xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>

    <xsl:include href="ufbas-static.xsl"/>

    <xsl:template name="content">

        <!-- Abfrage der mode: führt zu den unterschiedlichen Pages
        
        $mode=about dann call template about 
        $mode=context dann call template context 
        -->
        <!-- ///IF ABOUT/// -->
        <xsl:choose>
            <xsl:when test="$mode = 'about'">
                <section class="row ">
                    <article class="col-md-8">
                        <div class="panel">
                            <xsl:apply-templates select="document('/context:ufbas/ABOUT')/t:TEI/t:text/t:body/t:div"/>
                            <h3>
                                Fussnotenapperat
                            </h3>
                            <xsl:apply-templates select="document('/context:ufbas/ABOUT')/t:TEI/t:text/t:body/t:div//t:note/t:p" mode="footnote"/>
                        </div>
                    </article>
                    <article class="col-md-4">
                        <div class="panel">
                            <h3>
                                <xsl:value-of select="$projectTitle"/>
                                <xsl:text> </xsl:text>
                                <a class="button" href="/archive/objects/context:ufbas/datastreams/ABOUT/content"
                                    role="button" style="margin: 10px;" target="_blank">
                                    <img alt="TEI" height="30" id="tei"
                                        src="/archive/objects/context:srbas/datastreams/TEISYMBOL/content"
                                        title="TEI"/>
                                </a>
                            </h3>
                            <p>herausgegeben von Susanna Burghartz, Sonia Calvi und Georg Vogeler

                            </p>
                            <p>Basel/Graz 2017
                            </p>
                            <ul>
                                <li>
                                    <a href="?mode=about">Einführung</a>
                                </li>
                                <li>
                                    <a href="/o:ufbas.1563">Ratsbücher O10, Urfehdenbuch X <br></br>(1563-1569)</a>
                                </li>
                                <li>
                                    <a href="/o:ufbas.kategorien">Kategorien</a>
                                </li>
                            </ul>
                            <p> Hinweise und Verbesserungen an: <a href="mailto:burghartz-sekretariat-geschichte@unibas.ch"><br></br>
                                burghartz-sekretariat-geschichte@unibas.ch
                            </a>
                            </p>
                            <br></br>
                        </div>
                    </article>
                </section>
            </xsl:when>
            <!-- ///IF CONTEXT/// -->
            <xsl:when test="$mode = 'context'">
                <section class="row ">
                    <article class="col-md-10 ">
                        <div class="panel">
                            <div id="results">
                                <ol class="result">
                                    <xsl:call-template name="results"/>
                                </ol>
                            </div>
                        </div>
                    </article>
                </section>
            </xsl:when>
             <xsl:when test="$mode = 'datenkorb'">
            <section class="row">
                <xsl:call-template name="datenkorb"/>
            </section>
        </xsl:when> 
            <xsl:otherwise>
                <!-- Damit ./context:ufbas als home aufgerufen wird,
                ein template ausgelagert, das das home baut (= in static.xsl -->
                <xsl:call-template name="homepage"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Bindet das ABOUT ein. Statische Projektbeschreibung -->
    <!-- ////////////////////////// -->
    <xsl:template name="about">
        <xsl:apply-templates
            select="document(concat($server, '/context:ufbas/', 'ABOUT'))/t:TEI/t:text/t:body/t:div"
        />
    </xsl:template>

    <!-- Baut Page Urfehdebücher linken Teil für mode = context -->
    <!-- ////////////////////////// -->
    <xsl:template name="context">
        <div class="ym-g960-4 ym-gl chrono" id="Navigation">
            <div class="ym-gbox ym-clearfix" id="toc-wrapper" xml:space="preserve">
            </div>
        </div>
    </xsl:template>

    <!-- Baut Page der Query-Ergebnisse, rechts für mode = context -->
    <!-- ////////////////////////// -->
    <xsl:template name="results">
        <h3>
            <xsl:value-of select="/s:sparql/s:results/s:result[1]/s:container"/>
        </h3>
        <p>Anzahl der gefundenen Einträge: <xsl:value-of select="count(s:sparql/s:results/s:result)"
            /></p>
        <xsl:for-each select="s:sparql/s:results/s:result">
            <li>
                <xsl:if test="position() = last()">
                    <xsl:attribute name="style">
                        <xsl:text>border-bottom:none;</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="position() mod 2 = 0">
                        <xsl:attribute name="class">
                            <xsl:text>results odd</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>results even</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- zeigt Titel an + Verlinkung auf object.xsl -->
                <span class="results">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="substring-after(s:pid/@uri, '/')"/>
                            <xsl:text>/sdef:TEI/get</xsl:text>
                        </xsl:attribute>
                        <b style="font-size: 125%;">
                            <xsl:value-of select="./s:title"/>
                        </b>
                    </a>
                </span>
                <br/>

                <!-- Ansichtmöglichkeiten -->
                <!-- ////////////////////////// -->

                <!-- Ganzer Text anzeigen. auf object.xsl-->
                <p class="smaller indent">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="substring-after(s:pid/@uri, '/')"/>
                            <xsl:text>/sdef:TEI/get</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Ganzer Text</xsl:text>
                    </a>
                    <a>
                        <xsl:text> | </xsl:text>
                    </a>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="substring-after(s:pid/@uri, '/')"/>
                            <xsl:text>/TEI_SOURCE</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        <xsl:text>TEI-File</xsl:text>
                    </a>

                </p>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="datenkorb">
        <article class="col-md-12 panel">

                <h3>Datenkorb</h3>
                <div class="col-md-10">
                    <p> Dieses virtuelle Dokument zeigt die Informationen an, die Sie aktuell im
                        Datenkorb auf diesem Computer abgelegt haben. Je nach der von Ihnen gewählten
                        Cookie-Policy können sie durch Neustart des Browsers verloren gehen. Um Daten in
                        Ihren Datenkorb zu übernehmen, wählen Sie ein Auswahlkästchen in den
                        Suchergebnissen aus.
                        <br></br>
                        Der Datenkorb ist in der Reihenfolge vorsortiert, in der die Einträge ausgewählt wurden. 
                        Es gibt die Möglichkeit nach Tätername, nach Datum und nach einem Identifikator (URI) der Form Eintrag-0. 
                        <br></br>
                        Nach dem Klick auf <i>Excel erzeugen</i> erscheint <i>Excel herunterladen</i>, der den Download des erstellen .csv starten lässt.  
                    </p> 
                    
                </div>
            <div class="col-md-6">
                <p>
                    <xsl:text> </xsl:text>
                  <!-- warum ist das leer? -->
                </p>
            </div>
            <div class="col-md-12">
                <div class="btn-group" role="group" aria-label="Sortieren">
                    <button type="button" class="btn btn-success"  onclick="clearData()">Datenkorb leeren<span class="glyphicon glyphicon-remove-circle"><xsl:text></xsl:text></span></button>
                        <button type="button" class="btn btn-secondary" onclick="sortPersonDatabasket()">Nach Personen sortieren</button>
                        <button type="button" class="btn btn-secondary" onclick="sortDateDatabasket()">Nach Datum sortieren</button>
                        <button type="button" class="btn btn-secondary" onclick="sortURIDatabasket()">Nach URI sortieren</button>
                        <button type="button" class="btn btn-success" onclick="exportData()" id="DownloadExcel">Excel erzeugen<span><img src="/archive/objects/context:ufbas/datastreams/TABELLENSYMBOL/content" alt="Tabellensymbol" height="15px"/><xsl:text> </xsl:text></span></button>
                        <span type="button" class="btn btn-success hidden" id="results"><xsl:text></xsl:text></span>
                    </div>      
            </div>
            <div class="col-md-12">
            <div id="datenkorbInhalt">
                <h3>Einträge im Datenkorb</h3>
                <!-- in datenkorb.js fibt im localStorage befindliche Einträge aus -->
                <script>
                    showData();
                </script>
            </div>
            </div>    
        </article>
    </xsl:template>
    
    
    <!-- TEMPLATES für Projektbeschreibung -->
    <xsl:template match="t:hi[@rend='bold']">
        <b>
            <xsl:apply-templates></xsl:apply-templates>
        </b>
    </xsl:template>
    <xsl:template match="t:hi[@rend='underline']">
        <u>
            <xsl:apply-templates></xsl:apply-templates>
        </u>
    </xsl:template>
    <xsl:template match="t:hi[@rend='color(373737)']">
        <span style="color: 373737;">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="t:list[@type='unordered']">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="t:list[@type='ordered']">
        <ol>
            <xsl:apply-templates/>
        </ol>
    </xsl:template>
    <xsl:template match="t:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="t:hi[@rend='Code_Zchn'] | t:p[@rend='Code'] ">
        <code>
           <xsl:apply-templates></xsl:apply-templates>
        </code>
    </xsl:template>
    
    
    <xsl:template match="t:note">
        <xsl:variable name="footnote">
            <xsl:number level="any" count="t:note"/>
        </xsl:variable>
        <sup>
            <a href="{concat('#note', $footnote)}" id="{concat('noteback', $footnote)}">
                <xsl:value-of select="$footnote"/>
            </a>
        </sup>
        <xsl:text></xsl:text>
    </xsl:template>
    
    <!-- TABLE -->
    <xsl:template match="t:table[@rend='rules']">
        <table class="table">
            <xsl:apply-templates></xsl:apply-templates>
        </table>
    </xsl:template>
    
    

    <xsl:template match="t:table[@rend='rules']/t:row">
        <xsl:choose>
            <xsl:when test="position() = 2">
                <thead>
                    <tr>
                    <xsl:for-each select="t:cell">
                        
                             <th>
                                 <xsl:apply-templates></xsl:apply-templates>
                             </th>
                        
                    </xsl:for-each>
                    </tr>
                </thead>
            </xsl:when>
            <xsl:otherwise>
                <tbody>
                    <tr>
                        <xsl:apply-templates></xsl:apply-templates>
                    </tr>
                </tbody>
            </xsl:otherwise>
        </xsl:choose>      

    </xsl:template>
    
    
    <xsl:template match="t:cell">
        <th style="font-size:10pt; font-weight: normal;">
            <xsl:value-of select="."/>
        </th>
    </xsl:template>
    
    <xsl:template match="t:graphic[@ana ='about']">
        <a href="{@url}">
          <figure class="about">
              <img src="{@url}" class="figure-img" alt="Anzahl Urfehdeeinträge pro Monat im Urfehdebuch X, 1563-1569" width="720" height="500"/>
              <figcaption class="figure-caption">Anzahl Urfehdeeinträge pro Monat im Urfehdebuch X, 1563-1569</figcaption>
          </figure>
        </a>
    </xsl:template>
    
    

    <!-- FOOTNOTE -->
    <xsl:template match="t:p[@rend='footnote text'] | t:p" mode="footnote">
        <xsl:variable name="footnote">
            <xsl:number level="any" count="t:note"/>
        </xsl:variable>
        <p style="font-size:9pt">
            <span style="float:left">
                <a id="{concat('note', $footnote)}" href="{concat('#noteback', $footnote)}">
                    <xsl:value-of select="$footnote"/>
                </a>
            </span>
            <span style="display:block;padding-left:2em">
                <xsl:apply-templates></xsl:apply-templates>
            </span>
        </p>
    </xsl:template>
    
    <xsl:template match="t:p[@rend='Code']" mode="footnote">
        <code style="display:block;padding-left:2em">
            <xsl:apply-templates></xsl:apply-templates>
        </code>
    </xsl:template>

    
</xsl:stylesheet>
