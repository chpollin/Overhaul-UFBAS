<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Project: GAMS Projekttemplate
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
    Author: Hans Clausen, Maximilian Müller, Gerlinde Schneider, Martina Semlak, Christian Steiner, Elisabeth Steiner
    Last update: 2015
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:uf="http://gams.uni-graz.at/ufbas/#"
    xmlns:html="http://www.w3.org/1999/xhtml" xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:rm="org.emile.roman.Roman" xmlns:sr="http://www.w3.org/2001/sw/DataAccess/rf1/result"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:functx="http://www.functx.com"
    exclude-result-prefixes="#all" version="2.0">

    <xsl:include href="ufbas-static.xsl"/>

    <xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>

    <xsl:function name="functx:is-node-in-sequence" as="xs:boolean">
        <xsl:param name="node" as="node()?"/>
        <xsl:param name="seq" as="node()*"/>
        <xsl:sequence
            select="
                some $nodeInSeq in $seq
                    satisfies $nodeInSeq is $node"
        />
    </xsl:function>
    
            
    <!-- ////////////////////////// -->
    <!-- TEI_Header -->
    <xsl:variable name="TEIHeader" select="t:TEI/t:teiHeader"/>

    <!-- ////////////////////////// -->
    <!-- Variabeln -->

    <!-- from to Datum, exception if Datum nicht Maschinenlesbar -->
    <xsl:variable name="DateFromToXPath"
        select="$TEIHeader/t:fileDesc/t:sourceDesc/t:msDesc/t:msContents/t:p/t:origDate"/>
    <xsl:variable name="datefrom">
        <xsl:if test="$DateFromToXPath/@from castable as xs:date">
            <xsl:value-of select="$DateFromToXPath/@from"/>
        </xsl:if>
    </xsl:variable>
    <xsl:variable name="dateto">
        <xsl:if test="$DateFromToXPath/@from castable as xs:date">
            <xsl:value-of select="$DateFromToXPath/@to"/>
        </xsl:if>
    </xsl:variable>


    <xsl:variable name="pid" select="$TEIHeader/t:fileDesc/t:publicationStmt/t:idno"/>


    <xsl:variable name="handleID">
        <xsl:choose>
            <xsl:when test="string(number(substring-after($pid, '.'))) != 'NaN'">
                <xsl:text>xy/yx.</xsl:text>
                <xsl:value-of select="substring-after($pid, '.')"/>
            </xsl:when>
            <xsl:when test="string($pid) != ''">
                <xsl:value-of
                    select="document(concat('/archive/objects/', $pid, '/datastreams/RELS-EXT/content'))//oai:itemID/substring-after(., 'hdl:')"
                />
            </xsl:when>
        </xsl:choose>
    </xsl:variable>


    <!-- ////////////////////////// -->
    <!-- MARGINALIEN kategorien.xml in $Taxonomy eingelesen-->
    <!-- Für jeden Entrag ausgegeben werden. Daraus Node-List aller Unterkategorien -->
    <xsl:variable name="Taxonomy">
        <xsl:copy-of select="document('/o:ufbas.kategorien/TEI_SOURCE')/t:TEI/t:teiHeader/t:encodingDesc/t:classDecl/t:taxonomy"/>     
    </xsl:variable>
   
    <xsl:template name="content">
        <div class="col-md-12 panel"> 
            <div class="hidden-print">
            <div class="col-md-4">
                        <h3>
                            <xsl:value-of select="$TEIHeader/t:fileDesc/t:titleStmt/t:title[1]"/>                       
                        </h3>
            </div>
            <div class="col-md-5" style="padding-top:25px;">
                <p>
                  <b>Zitiervorschlag:</b> 
                  <br></br>
                  Urfehdenbuch X der Stadt Basel
                  (<xsl:value-of select="year-from-date($datefrom)"
                  />-<xsl:value-of select="year-from-date($dateto)"/>), in:
                  Die Urfehdebücher der Stadt Basel – digitale Edition, hg. v. Susanna Burghartz, Sonia Calvi und Georg Vogeler Basel/Graz 2016.
                  (zuletzt verändert am 31.1.2017): <a href="http://hdl.handle.net/11471/1010.2.1"><xsl:value-of select="document('/o:ufbas.1563/RELS-EXT')//*:itemID"/></a>. 
                </p>
            </div>
            <div class="col-md-3">
                <h3>
                    <a class="button" href="#" onclick="window.print();" role="button"
                        style="margin: 10px;">
                        <img alt="Print" height="30" id="print"
                            src="/archive/objects/context:srbas/datastreams/PRINTSYMBOL/content"
                            title="Print"/>
                    </a>
                    <a class="button" href="/{$pid}/TEI_SOURCE"
                        role="button" style="margin: 10px;" target="_blank">
                        <img alt="TEI" height="30" id="tei"
                            src="/archive/objects/context:srbas/datastreams/TEISYMBOL/content"
                            title="TEI"/>
                    </a>
                    <a class="button" href="/{$pid}/RDF"
                        role="button" style="margin: 10px;" target="_blank">
                        <img alt="RDF" height="30" id="rdf"
                            src="/archive/objects/context:srbas/datastreams/RDFSYMBOL/content"
                            title="RDF"/>
                    </a>
                </h3>
                <p>
                    <b>Zeitraum: </b>
                    <br></br>
                    <xsl:value-of select="format-date(xs:date($datefrom), '[D01].[M01].[Y0001]')"/> bis 
                    <xsl:value-of select="format-date(xs:date($dateto), '[D01].[M01].[Y0001]')"/>
                </p>
            	<p>
            		Die Digitalisate werden extern gehostet und sind aufgrund einer Adressänderung 
            		nicht mehr direkt verlinkt. 
            		Sie erreichen die Digitalisate 
            		<a title="Zu den Digitalsiaten" target="_blank" 
            			href="https://dls.staatsarchiv.bs.ch/records/315538/245856/preview?context=%2Frecords%2F315538">hier</a>.
            	</p>
            </div>
        </div>
        </div>  
        <xsl:call-template name="newNavigation"></xsl:call-template> 
        <article class="col-md-12 panel">
            <xsl:apply-templates select="t:TEI/t:text/t:body"/>
        </article>            
    </xsl:template>
    
    <xsl:template name="newNavigation">
        <div class="navbar navbar-fixed-bottom" style="margin-bottom:0px;">
            <div class="container">
                <nav class="navbar navbar-default" role="navigation" id="navnewigation" style="margin-bottom: 0%; color: black;">
                    <ul class="nav navbar-nav">
                        <li>
                            <a  class="closeDrop" href="#" style="font-size: 15px">Beginn</a>
                        </li>
                        <xsl:if test="t:TEI/t:text/t:body/t:div[ not(descendant::t:date[@ana='#uf_DatumUrfehde'])]">        
                            <li class="dropup">
                                 <button class="nav closeDrop" data-toggle="dropdown">
                                    Undatiert
                                </button>
                                    <ul class="dropdown-menu" style="width: 400;">
                                    <xsl:for-each select="t:TEI/t:text/t:body/t:div[not(descendant::t:date[@ana='#uf_DatumUrfehde'])]">
                                        <li>
                                            <a>
                                                <xsl:attribute name="onclick">
                                                    <xsl:text>scrolldown(this)</xsl:text>
                                                </xsl:attribute>
                                                <xsl:attribute name="href">
                                                    <xsl:text>#</xsl:text>
                                                    <xsl:value-of select="generate-id()"/>
                                                </xsl:attribute>
                                                <xsl:choose>   
                                                    <xsl:when test="t:head">
                                                        <span style="font-weight: bold;">
                                                            <xsl:variable name="entryName">
                                                                <xsl:variable name="help">
                                                                    <xsl:value-of select="t:head"/>
                                                                </xsl:variable>
                                                                <xsl:value-of
                                                                    select="substring(normalize-space($help), 1, 35)"/>
                                                                <xsl:if test="string-length($help) gt 35">
                                                                    <xsl:text> ... </xsl:text>
                                                                </xsl:if>
                                                            </xsl:variable>
                                                            <xsl:value-of select="$entryName"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:choose>
                                                            <xsl:when test=".//t:persName[@ana='#uf_PersonTäter']">
                                                                <span style="font-weight: bold;">
                                                                    <xsl:variable name="entryName">
                                                                        <xsl:variable name="help">
                                                                            <xsl:value-of select=".//t:persName[@ana='#uf_PersonTäter']"/>
                                                                        </xsl:variable>
                                                                        <xsl:value-of
                                                                            select="substring(normalize-space($help), 1, 35)"/>
                                                                        <xsl:if test="string-length($help) gt 35">
                                                                            <xsl:text> ... </xsl:text>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:value-of select="$entryName"/>
                                                                </span>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:text>Keine Information</xsl:text>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </a>
                                        </li>
                                    </xsl:for-each>
                                </ul> 
                            
                            </li>
                        </xsl:if>                        
                        <xsl:for-each-group group-by="year-from-date(@when)" select="t:TEI/t:text/t:body/t:div[@ana = '#uf_Eintrag']//t:date[matches(@ana, '#uf_DatumUrfehde')]"> 
                            <xsl:sort select="current-grouping-key()"/>
                            <xsl:variable name="ID" select="generate-id(.)"/>
                            <li class="dropup fixedDropdown">
                                    <button class="nav closeDrop" data-toggle="dropdown" type="button">   
                                        <xsl:value-of select="current-grouping-key()"/> 
                                    </button>
                                    <ul class="dropdown-menu" role="menu" style="width: 400; height: auto; max-height: 90vh; overflow-x: hidden;">
                                        <xsl:for-each-group group-by="month-from-date(@when)" select="current-group()">
                                            
                                            <xsl:sort select="current-grouping-key()"/>
                                            <xsl:for-each select="current-grouping-key()">
                                                <li>
                                                    <a data-toggle="collapse"
                                                        href="{concat('#collapse', current-grouping-key(), $ID)}">
                                                        <xsl:choose>
                                                            <xsl:when test="current-grouping-key() = 1">Januar</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 2">Februar</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 3">März</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 4">April</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 5">Mai</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 6">Juni</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 7">Juli</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 8">August</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 9">September</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 10">Oktober</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 11">November</xsl:when>
                                                            <xsl:when test="current-grouping-key() = 12">Dezember</xsl:when>
                                                            <xsl:otherwise> undatiert </xsl:otherwise>
                                                        </xsl:choose>
                                                        <span class="glyphicon glyphicon-triangle-right"><xsl:text> </xsl:text></span>
                                                    </a>
                                                </li>
                                   
                                            </xsl:for-each>
                                            <li class="panel-collapse collapse" id="{concat('collapse', current-grouping-key(), $ID)}">
                                                <ul>
                                                    <xsl:for-each select="current-group()">
                                                        <li>
                                                            <a class="link">
                                                                <xsl:attribute name="onclick">
                                                                    <xsl:text>scrolldown(this)</xsl:text>
                                                                </xsl:attribute>
                                                                <xsl:attribute name="href">
                                                                    <xsl:text>#</xsl:text>
                                                                    <xsl:value-of select="uf:id(../parent::t:div)"/>
                                                                </xsl:attribute>
                                                                    <xsl:value-of
                                                                        select="format-date(xs:date(@when), '[D01].[M01].')"/>
                                                                    <xsl:text> </xsl:text>
                                                                    <xsl:variable name="entryName">
                                                                        <xsl:variable name="help">
                                                                            <xsl:value-of select="../parent::t:div//t:head"/>
                                                                        </xsl:variable>
                                                                        <xsl:value-of
                                                                            select="substring(normalize-space($help), 1, 35)"/>
                                                                        <xsl:if test="string-length($help) gt 35">
                                                                            <xsl:text> ... </xsl:text>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:value-of select="$entryName"/>
                                                            </a>
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </li>
                                        </xsl:for-each-group>
                                    </ul>
                                    
                            </li>   
                        </xsl:for-each-group>
                        <li>
                            <a class="closeDrop"  href="#Bottom" style="font-size: 15px">Ende</a>
                        </li>
                    </ul>
            </nav>
            </div>
        </div>
        <!-- scripts um Klick's in Dropdownmenü-Navigation zu handln -->
        <script>
            $('div.fixedDropdown').on('hide.bs.dropdown', function () {
            return false;
            });
        </script>
        <script>
            $("a.link").click(function()
            {
                $('div.fixedDropdown').removeClass('open');
            });
            
            $(".closeDrop").click(function()
            {
                $('div.fixedDropdown').removeClass('open');
            });
            
            $(".open").click(function()
            {
                $('div.fixedDropdown').removeClass('open');
            });
            
            $("button.closeDrop").click(function()
            {
                var attr = $(this).attr('class');
                if(attr == 'nav closeDrop' )
                {
                    $(this).addClass('open');
                    var nextUL = this.nextSibling;
                    $(nextUL).show();
                }
                else
                {
                    var nextUL = this.nextSibling;
                    $(nextUL).hide();
                    $(this).removeClass('open');
                }     
            });
        </script>     
    </xsl:template>

    <xsl:template match="t:body">
            <xsl:apply-templates/>
    </xsl:template>

    <!-- gibt die zweite Eingangsnotiz aus -->
    <xsl:template match="note[@ana='#uf_Eingangsnotiz']">
        <span class="add" data-toggle="tooltip"
            style="cursor: help; background-color: #D3D3D3;color: #6565AE; font-size: 80%;">
            <xsl:attribute name="title">
                <xsl:value-of select="@rend"/>
            </xsl:attribute>
            <xsl:apply-templates/><br></br>
        </span>
    </xsl:template>
    
    <xsl:template match="t:note[@change='#Nachtrag']">
        <b data-toggle="tooltip" title="margin" style="cursor: help; background-color: #D3D3D3; color: #6565AE; font-size: 105%;">
            <xsl:apply-templates></xsl:apply-templates>
        </b>
    </xsl:template>

    <xsl:template match="t:note">
        <xsl:choose>
            <xsl:when test="@resp = '#editor'">
                <sup  class="help note" style="cursor: help; color: #6565AE; font-size: 13px;" title="{.}">★</sup>
            </xsl:when>
            <xsl:when test=".[preceding-sibling::t:pb]">
                <span class="add" data-toggle="tooltip"
                    style="cursor: help; background-color: #D3D3D3; color: #6565AE; font-size: 80%;">
                    <xsl:attribute name="title">
                        <xsl:value-of select="@rend"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </span>
                
                <xsl:if test=".[preceding-sibling::t:note]">
                    <br/>
                </xsl:if>
            </xsl:when>
            <xsl:when test=".[preceding-sibling::t:note]">
                <br/>
            </xsl:when>
            <xsl:otherwise>
                <span class="add" data-toggle="tooltip"
                    style="cursor: help; background-color: #D3D3D3;color: #6565AE; font-size: 80%;">
                    <xsl:attribute name="title">
                        <xsl:value-of select="@rend"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    
    <xsl:template match="t:note[@resp='editor']">
        <span class="glyphicon glyphicon-star-empty" data-toggle="tooltip"
            style="cursor: help; background-color: #D3D3D3; color: #6565AE;">
            <xsl:attribute name="title">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <xsl:text> </xsl:text>
        </span>
        
    </xsl:template>
    
    <!-- div für jeden gesamten Eintrag -->
    <xsl:template match="t:div[@ana='#uf_Eintrag']">
        <!-- padding, Abstand zum folgenden Eintrag, bessere Übersicht -->
        <div class="col-md-12" id="{uf:id(.)}" 
            data-check="unchecked" style="padding-bottom:100px;">                 
            <!-- DATENKORB -->     
            <!--data- für Datenkorb -->
            <xsl:attribute name="data-uri">
                <xsl:value-of select="uf:id(.)"/>
            </xsl:attribute>
            <xsl:attribute name="data-taeter">
                <xsl:for-each select="t:head/t:persName[@ana='#uf_PersonTäter']">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:attribute name="data-datum">
                <xsl:value-of select=".//t:date[@ana = '#uf_DatumUrfehde']/@when"/>
            </xsl:attribute>
            <xsl:attribute name="data-inhalt">
                <xsl:for-each select="t:p">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:attribute name="data-id">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            
            <div class="row-height">
                <div class="col-md-8 col-height">
                    <xsl:apply-templates/>
                </div>
                <!-- marginalien mit @class = "hidden-print" verstecken -->
                <div class="col-md-4 col-height"  style=" border-left: 3px solid #e8e8e8;">
                    <xsl:call-template name="marginalien"/>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="t:figDesc">
        <xsl:value-of select="."/>
    </xsl:template>

    
      <!-- SPAN im Fließtext -->
     <!-- hier werden alle Sachen gespant, die ein @ana haben. -->
    <xsl:template match="t:div[@ana = '#uf_Eintrag']//t:seg | //t:seg//t:term[@ana] | //t:placeName[@ana] | //t:p | //t:p//t:term[@ana] | //t:persName[@ana] | //t:persName[@ana]/t:term | //t:note//t:term[@ana] | //t:note//t:persName[@ana]">
        <xsl:if test=". != ''">
        
            <xsl:variable name="NameMarginalien">
                <xsl:choose>
                    <xsl:when test="matches(@ana, 'uf_Person')">
                        <xsl:value-of select="'uf_Person'"/>
                    </xsl:when>
                    <xsl:when test="matches(@ana, 'uf_Ort')">
                        <xsl:value-of select="'uf_Ort'"/>
                    </xsl:when>
                    <xsl:when test="matches(@ana, 'uf_Strafe')">
                        <xsl:value-of select="'uf_Strafe'"/>
                    </xsl:when>
                    <xsl:when test="matches(@ana, 'uf_Tat')">
                        <xsl:value-of select="'uf_Tat'"/>
                    </xsl:when>
                    <xsl:when test="matches(@ana, 'uf_Schlagwort')">
                        <xsl:value-of select="'uf_Schlagwort'"/>
                    </xsl:when>
                    <xsl:otherwise> 
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <xsl:variable name="tokenizedSpan" select="tokenize(@ana,' ')"/>
            <!-- Eintrag-bezogene ID -->
            <xsl:variable name="id" select="./ancestor::t:div/generate-id()"/>
            <!-- span-bezogene ID -->
            <xsl:variable name="actualid" select="generate-id()"/>
            <span>
                <!-- wenn ein tokenize ausgeführt wurde, dann gib ihnen einfach die gleiceh Class-->
                <!-- html5 -->
    <!--            <xsl:attribute name="id">
                    <xsl:value-of select="$id"/>
                </xsl:attribute>-->
                <xsl:for-each select="$tokenizedSpan">
                    <xsl:attribute name="class" select="concat($NameMarginalien, '-', $id, '-', $actualid)"/>
                </xsl:for-each>
                <xsl:apply-templates></xsl:apply-templates>
            </span>
        </xsl:if>
    </xsl:template>
    
    <!-- spant alle Personen ohne @ana 
    sucht sich alle persName ohne @ana in t:p und t:head und auch im t:div[@ana='#uf_Eintrag'] ganz am Anfang eines Eintrages gibt es persNames -->
    <xsl:template match="//t:p//t:persName[not(@ana)] | //t:head//t:persName[not(@ana)] | // t:div[@ana='#uf_Eintrag']//t:persName[not(@ana)]">
        <!-- html5 id="{./ancestor::t:div/generate-id()}" -->
        <xsl:if test=". != ''">
            <span  class="{concat('uf_Person-SonstigePerson-', ./ancestor::t:div/generate-id())}">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
    </xsl:template>
    
    <!-- spant alle Orte ohne @ana -->
    <xsl:template match="//t:p//t:placeName[not(@ana)] | //t:head//t:placeName[not(@ana)] | //t:div[@ana = '#uf_Eintrag']//t:placeName[not(@ana)]">
        <!-- html5 id="{./ancestor::t:div/generate-id()}" -->
        <xsl:if test=". != ''">
         <span class="{concat('uf_Ort-SonstigeOrte-', ./ancestor::t:div/generate-id())}">
             <xsl:apply-templates/>
         </span>
        </xsl:if>
    </xsl:template>
    


    <xsl:template match="t:body/t:head[1]">
        <div class="row">
        <div class="col-md-8">
            <h3 style="text-align:center;">
                <xsl:apply-templates/>
            </h3>
        </div>
<!--        <div class="col-md-4">
            <xsl:text> </xsl:text>
        </div>-->
        </div>
    </xsl:template>

    <xsl:template match="t:div/t:head">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

   

    <xsl:template match="t:p">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="t:damage">
        <span>
            <xsl:if test="@agent | @extent">
                <xsl:attribute name="class">help note</xsl:attribute>
                <xsl:attribute name="title" select="normalize-space(concat(@agent, ' ', @extent))"/>
            </xsl:if>
            <b>[</b>
            <xsl:apply-templates/>
            <b>]</b>
        </span>
    </xsl:template>

    <xsl:template match="t:add">
        <xsl:variable name="title">
            <xsl:text>Hinzugefügt</xsl:text>
            <xsl:if test="@rend">
                <xsl:text > </xsl:text>
                <!-- html 5 xml:space="preserve"-->
                <xsl:value-of select="@rend"/>
            </xsl:if>
            <xsl:if test="@change">
                <xsl:text> bei </xsl:text>
                <!-- html 5 xml:space="preserve"-->
                <xsl:value-of select="//t:teiHeader//t:change[@xml:id = substring-after(current()/@change, '#')]"/>
            </xsl:if>
            <xsl:if test="@resp">
                <xsl:text> durch </xsl:text>
                <!-- html 5 xml:space="preserve"-->
                <xsl:value-of select="@resp"/>
            </xsl:if>
        </xsl:variable>
        <span class="add" title="{$title}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- ///// -->
    <xsl:template match="t:choice">
        <xsl:value-of select="t:sic"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="t:corr"/>
        <xsl:text>) </xsl:text>
    </xsl:template>

    <!-- ///// -->
    <xsl:template match="t:lb">
        <xsl:if test="@break = 'no'">-</xsl:if>
        <br/>
    </xsl:template>

    <!-- ///// -->
    <xsl:template match="t:del">
        <s>
            <xsl:apply-templates/>
        </s>
    </xsl:template>

    <!-- ///// -->
    <xsl:template match="t:ex">
        <b>[</b>
        <xsl:apply-templates/>
        <b>]</b>
    </xsl:template>

    <!-- ///// -->
    <xsl:template match="t:num[@rend='super']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>

    <!-- ///// -->
    <xsl:template match="t:handShift">
        <xsl:apply-templates/>
        <span class="add" data-toggle="tooltip" style="cursor: help; background-color: #D3D3D3; olor: #6565AE;" title="Schreiberwechsel">|</span>
    </xsl:template>



    <!-- ///// alle außerhalb des Fließtextes -->
    <xsl:template match="t:pb">
        <br></br>
                <span class="folium"> 
                    <xsl:text>fol. </xsl:text>
                    <xsl:variable name="page" select="substring-after(@facs, '#')"/>
                    <xsl:value-of select="number($page) - 18"/>
                    <xsl:choose>
                        <xsl:when test="number($page) mod 2 = 1">
                            <xsl:text>v</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>r</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>  
                </span>
        <br></br>
    </xsl:template>


    <!-- ///MARGINALIEN/// -->
    <xsl:template name="marginalien">
        <xsl:for-each select=".//t:note[@ana='#uf_Eingangsnotiz']">
            <!-- damit Datum und täter-überschrift auf gleicher höhe sind.  -->
            <br></br>
        </xsl:for-each>
        <h3> 
        <label>
            <!-- selbstreferenzierender Link bei Datum -->
            <input onClick="getData(this)" type="checkbox" class="{concat('checkboxEntry', '-', uf:id(.))}" data-entryid="{uf:id(.)}"/>
            <span class="{name()}" > 
                <a  onclick="scrolldown(this)" href="{concat( '#', uf:id(.))}">
                    Datum: <xsl:value-of select=".//t:date[@ana = '#uf_DatumUrfehde']/@when"/>
                </a>
            </span>
        </label>
        </h3>
             
        <div class="marginalien-body">
            <h6 class="marginalienHeader" style="background-color: #FFCDCD;">Person</h6>
            <xsl:if test="//t:persName[contains(@ana, 'uf_Person')] and //t:persName[contains(@ana, 'uf_Person')] != ''">
            <table class="table-condensed">
                <tbody>
                    <!-- PERSON -->
                    <xsl:for-each select=".//t:persName[contains(@ana, 'uf_Person')]">
                        <xsl:if test=". != ''">
                            <xsl:variable name="currentXMLID" select="current-grouping-key()"/>
                            <xsl:variable name="EintragID">
                                <xsl:value-of select="./ancestor::t:div/generate-id()"/>
                            </xsl:variable>
                            <xsl:variable name="actialid" select="generate-id()"/>
                            <xsl:variable name="TextMarginalie">
                                <xsl:value-of select="."/>
                            </xsl:variable>
                            <tr>
                                <td>
                                    <!-- alel auf contains geändert, macht das probleme?  -->
                                        <xsl:choose>
                                            <xsl:when test="contains(@ana, '#uf_PersonTäter')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                Täter
                                                </button>
                                            </xsl:when>
                                            <xsl:when test="contains(@ana, '#uf_PersonMittäter')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Mittäter
                                                </button>
                                            </xsl:when>
                                            <xsl:when test="contains(@ana, '#uf_PersonHehler')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Hehler
                                                </button>
                                            </xsl:when>
                                            <xsl:when test="contains(@ana, '#uf_PersonAnwesende')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Anwesende
                                                </button>
                                            </xsl:when>
                                            <xsl:when test="contains(@ana, '#uf_PersonOpfer')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Opfer
                                                </button>
                                            </xsl:when>
                                            <xsl:when test="contains(@ana, '#uf_PersonKläger')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Kläger
                                                </button>
                                            </xsl:when>
                                            <xsl:when test="contains(@ana, '#uf_PersonNotar')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Notar
                                                </button>   
                                            </xsl:when>
                                            <xsl:when test="contains(@ana, '#uf_PersonZeuge')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Zeuge
                                                </button>  
                                            </xsl:when>
                                            <!-- html5 -->
                                            <xsl:when test="@ana = '#uf_Person'">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    Person
                                                </button>  
                                            </xsl:when>
                                            <!-- hier wird nur das erste @ana ausgegeben. dahinter gibt es anderer, aber auch welche die nicht zu uf_Person gehören -->
                                            <xsl:when test="contains(@ana, ' ')">
                                                <button class="{concat('uf_Person', '-', $EintragID, '-', $actialid)}"
                                                    onclick="highlight(this.className)">
                                                    <xsl:value-of select="substring-after(substring-before(@ana, ' '), '#uf_Person')"/>
                                                </button>
                                            </xsl:when>
                                            <!-- do nothing -->
                                            <xsl:otherwise></xsl:otherwise>
                                        </xsl:choose>   
                                </td>
                                <td>
                                    <xsl:value-of select="."/> 
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                    <!-- SONSTIGE PERSON -->
                    <xsl:if test=".//t:persName[not(@ana)]">
                        <xsl:if test=". != ''">   
                             <tr>
                                 <td>
                                     <xsl:variable name="EintragID" select="generate-id(.)"/>
                                     <button class="{concat('uf_Person-SonstigePerson-', $EintragID)}" onclick="highlight(this.className)">Sonstige</button>
                                 </td>
                                 <td>
                                     <xsl:for-each select=".//t:persName[not(@ana)]">
                                         <xsl:value-of select="."/>
                                         <xsl:text>; </xsl:text>
                                     </xsl:for-each>
                                 </td>
                             </tr>
                        </xsl:if>
                    </xsl:if>
                </tbody>
            </table>
            </xsl:if>
            <!-- END PERSON -->
            
            <!-- TATBESTAND -->
            <h6 class="marginalienHeader" style="background-color: #CDDEFF;">Tatbestand</h6>
            <xsl:for-each-group group-by="@ana" select=".//t:term | .//t:seg | .//t:persName | .//t:placeName">
                <xsl:if test=". != ''">
                    
                        <xsl:variable name="EintragID">
                            <xsl:value-of select="./ancestor::t:div/generate-id()"/>
                        </xsl:variable>
                        <xsl:variable name="actialid" select="generate-id()"/>
                    <xsl:if test="contains(current-grouping-key() ,'#uf_Tat')">
                            <xsl:variable name="AnaHelp" select="substring-after(@ana, '#')"/>
                            <xsl:choose>
                                <xsl:when test="contains(@ana, ' ')">
                                    <xsl:variable name="multipleClassesAnaHelp" select="substring-after(substring-before(@ana, ' '), '#')"/>
                                    <xsl:if test="contains($multipleClassesAnaHelp, '#uf_Tat' )">
                                        <button class="{concat('uf_Tat', '-', $EintragID, '-', $actialid)}" onclick="highlight(this.className)">
                                            <xsl:value-of select="$Taxonomy//t:category[@xml:id = 'uf_Tat']/t:category[@xml:id = $multipleClassesAnaHelp]/t:catDesc/t:term"/>
                                        </button>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <button class="{concat('uf_Tat', '-', $EintragID, '-', $actialid)}" onclick="highlight(this.className)">
                                    <xsl:value-of select="$Taxonomy//t:category[@xml:id = 'uf_Tat']/t:category[@xml:id = $AnaHelp]/t:catDesc/t:term"/>
                                    </button>
                                </xsl:otherwise>
                            </xsl:choose> 

                        
                     </xsl:if>  
                </xsl:if>
                    </xsl:for-each-group>

            

            <!-- STRAFEN -->
            <h6 class="marginalienHeader"  style="background-color: #D5FFCD;">Strafe</h6>
            <xsl:for-each-group group-by="@ana" select=".//t:term | .//t:seg | .//t:persName | .//t:placeName">   
                <xsl:if test=". != ''">
                    
                        <xsl:variable name="EintragID">
                            <xsl:value-of select="./ancestor::t:div/generate-id()"/>
                        </xsl:variable>
                        <xsl:variable name="actialid" select="generate-id()"/>

                        <xsl:if test="contains(current-grouping-key() ,'#uf_Strafe')">
                            <xsl:variable name="AnaHelp" select="substring-after(@ana, '#')"/>
                                <xsl:choose>
                                    <xsl:when test="contains(@ana, ' ')">            
                                        <xsl:variable name="multipleClassesAnaHelp" select="substring-after(substring-before(@ana, ' '), '#')"/>
                                        <xsl:if test="contains($multipleClassesAnaHelp, '#uf_Strafe' )">
                                             <button class="{concat('uf_Strafe', '-', $EintragID, '-', $actialid)}" onclick="highlight(this.className)">
                                                 <xsl:value-of select="$Taxonomy//t:category[@xml:id = 'uf_Strafe']/t:category[@xml:id = $multipleClassesAnaHelp]/t:catDesc/t:term"/>
                                             </button>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <button class="{concat('uf_Strafe', '-', $EintragID, '-', $actialid)}" onclick="highlight(this.className)">
                                            <xsl:value-of select="$Taxonomy//t:category[@xml:id = 'uf_Strafe']/t:category[@xml:id = $AnaHelp]/t:catDesc/t:term"/>
                                        </button>
                                    </xsl:otherwise>
                                </xsl:choose> 
                            
                        </xsl:if>
                </xsl:if>
                    </xsl:for-each-group>
            <h6 class="marginalienHeader" style="background-color: #FEFFC0;">Orte</h6>
           
            <xsl:if test=".//t:placeName and .//t:placeName != ''">
            <table class="table-condensed">
                <tbody>
                    <!-- für jeden Ort eine Marginalie -->
                    <xsl:for-each select=".//t:placeName">
                        <xsl:if test=". != ''">
                            
                        <xsl:call-template name="createMarginalien">
                            <xsl:with-param name="ParamMarginalien"
                                select="$Taxonomy//t:category[@xml:id = 'uf_Ort']/t:category/@xml:id"/>
                            <xsl:with-param name="NameMarginalien" select="'uf_Ort'"/>
                        </xsl:call-template>
                        </xsl:if>
                    </xsl:for-each>
                    
                    <xsl:if test=".//t:placeName[not(@ana)]">
                        <xsl:if test=". != ''">
                            
                        <tr>
                            <td>
                                <xsl:variable name="EintragID" select="generate-id(.)"/>
                                <button class="{concat('uf_Ort-SonstigeOrte-', $EintragID)}" onclick="highlight(this.className)">Sonstige</button>
                            </td>
                            <td>
                                <xsl:for-each select=".//t:placeName[not(@ana)]">
                                    <xsl:value-of select="."/>
                                    <xsl:text>; </xsl:text>
                                </xsl:for-each>
                            </td>
                        </tr>
                        </xsl:if>
                    </xsl:if>
                       
                </tbody>
            </table>
            </xsl:if>

            <!-- SCHLAGWORT-->
            <h6 class="marginalienHeader"  style="background-color: #FFE0BC;">Schlagwort</h6>
            <xsl:for-each-group group-by="@ana" select=".//t:term | .//t:seg | .//t:persName | .//t:placeName">
                <xsl:if test=". != ''">
                    
                        <xsl:variable name="EintragID">
                            <xsl:value-of select="./ancestor::t:div/generate-id()"/>
                        </xsl:variable>
                        <xsl:variable name="actialid" select="generate-id()"/>
                        
                        <xsl:variable name="EintragID">
                            <xsl:value-of select="./ancestor::t:div/generate-id()"/>
                        </xsl:variable>
                        <xsl:variable name="actialid" select="generate-id()"/>
                        
                        <xsl:if test="contains(current-grouping-key() ,'#uf_Schlagwort')">
                            <xsl:variable name="AnaHelp" select="substring-after(@ana, '#')"/>
                            <xsl:choose>
                                <xsl:when test="contains(@ana, ' ')">
                                    <xsl:variable name="multipleClassesAnaHelp" select="substring-after(substring-before(@ana, ' '), '#')"/>
                                      <xsl:if test="contains($multipleClassesAnaHelp, '#uf_Schlagwort' )">
                                          <button class="{concat('uf_Schlagwort', '-', $EintragID, '-', $actialid)}" onclick="highlight(this.className)">
                                              <xsl:value-of select="$Taxonomy//t:category[@xml:id = 'uf_Schlagwort']/t:category[@xml:id = $multipleClassesAnaHelp]/t:catDesc/t:term"/>
                                          </button>
                                      </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <button class="{concat('uf_Schlagwort', '-', $EintragID, '-', $actialid)}" onclick="highlight(this.className)">
                                        <xsl:value-of select="$Taxonomy//t:category[@xml:id = 'uf_Schlagwort']/t:category[@xml:id = $AnaHelp]/t:catDesc/t:term"/>
                                    </button>
                                </xsl:otherwise>
                            </xsl:choose> 
                        </xsl:if>
                </xsl:if>
                    </xsl:for-each-group>
                
        </div>
        <hr class="printclass" style="display: none;"/>
    </xsl:template>
    
    <xsl:template name="createMarginalien">
        <xsl:param name="ParamMarginalien"/>
        <xsl:param name="NameMarginalien"/>
        
        <!-- jeweils die span-bezogene-ID -->
        <xsl:variable name="actialid" select="generate-id()"/>
          
        <!-- nimmt alle die als span markiert sind und gruppiert sie nach dem Marginalien der jeweiligen Unterkategorie -->
        <xsl:for-each-group select="." group-by="$ParamMarginalien">
            
            <!-- Die @ana werden aufgeteilt. Jeder String nach einem Leerzeichen bildet einen eigenen String und geht anschließend alle diese Strings durch.-->
            <xsl:variable name="tokenizedMarginalie" select="tokenize(@ana,' ')"/>
            
            <!-- Variablen werden vorher deklariert weil nach dem tokenize nur noch strings und keine nodes mehr existieren. -->
            <xsl:variable name="currentXMLID" select="current-grouping-key()"/>
            <xsl:variable name="EintragID">
                <xsl:value-of select="./ancestor::t:div/generate-id()"/>
            </xsl:variable>
 
            <xsl:variable name="TextMarginalie">
                <xsl:value-of select="."/>
            </xsl:variable>
             
            <xsl:for-each select="$tokenizedMarginalie">  
                <!-- nimmt nur alle die Objekte aus dem for each, die auch passen -->
                <xsl:if test="substring-after(., '#') = current-grouping-key()">   
                    <tr>
                        <td>
                            <!-- die class wird noch um eine $actialid. nun ist jeder Button eindeutig unterscheidbar -->
                            <button class="{concat($NameMarginalien, '-', $EintragID, '-', $actialid)}"
                                onclick="highlight(this.className)">
                                <xsl:value-of select="$Taxonomy//t:category[@xml:id = $NameMarginalien]/t:category[@xml:id = $currentXMLID]/t:catDesc/t:term"/>
                            </button>  
                        </td>
                        <xsl:variable name="MarginalienValue">
                            <xsl:variable name="helpMarginalien">
                                <xsl:value-of select="."/>
                            </xsl:variable>
                            <xsl:value-of select="substring(normalize-space($helpMarginalien), 1, 30)"/>
                            <xsl:if test="string-length($helpMarginalien) gt 30">
                                <xsl:text> ... </xsl:text>
                            </xsl:if>
                        </xsl:variable>
                        <td>
                            <xsl:value-of select="$TextMarginalie"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template match="t:metamark">
        <xsl:variable name="elname">
            <xsl:choose>
                <xsl:when test="@target">
                    <xsl:text>a</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>span</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$elname}">
            <xsl:attribute name="title" select="@rend"/>
            <xsl:attribute name="class">
                <xsl:text>help</xsl:text>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="text()">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>[#]</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    <xsl:template match="t:*" mode="marginalie">
        <xsl:apply-templates mode="marginalie"/>
    </xsl:template>
    <xsl:template match="t:pb|t:note" mode="marginalie"/>
    <xsl:function name="uf:id">
        <xsl:param name="me"/>
        <xsl:choose>
            <xsl:when test="$me/@xml:id">
                <xsl:value-of select="$me/@xml:id"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="generate-id($me)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>