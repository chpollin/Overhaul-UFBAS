<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Project: ufbas
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
    Author: Christopher Pollin
    Last update: 2017
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
	xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:lido="http://www.lido-schema.org"
	xmlns:bibtex="http://bibtexml.sf.net/"
	exclude-result-prefixes="#all">

	<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>

	<!-- häufig verwendete variablen... -->

	<xsl:param name="mode"/>
	<xsl:param name="search"/>

	<xsl:variable name="model"
		select="substring-after(/s:sparql/s:results/s:result/s:model/@uri, '/')"/>

	<xsl:variable name="cid">
		<!-- das ist der pid des contextes, kommt aus dem sparql (ggfs. query anpassen) - wenn keine objekte zugeordnet sind, gibt es ihn nicht! -->
		<xsl:value-of select="/s:sparql/s:results/s:result[1]/s:cid"/>
	</xsl:variable>

	<xsl:variable name="teipid">
		<xsl:value-of select="//t:idno[@type = 'PID']"/>
	</xsl:variable>

	<xsl:variable name="lidopid">
		<xsl:value-of select="//lido:lidoRecID"/>
	</xsl:variable>

	<!--variablen für Suchergebnisse-->
	<xsl:variable name="query" select="sparql/head/results"/>
	<xsl:variable name="hitTotal" select="/sparql/head/hitTotal"/>
	<xsl:variable name="hitPageStart" select="/sparql/head/hitPageStart"/>
	<xsl:variable name="hitPageSize" select="/sparql/head/hitPageSize"/>
	<xsl:variable name="hitsFrom" select="sparql/navigation/hits/from"/>
	<xsl:variable name="hitsTo" select="sparql/navigation/hits/to"/>


	<!-- GAMS global variables -->
	<xsl:variable name="zim">Zentrum für Informationsmodellierung - Austrian Centre for Digital
		Humanities</xsl:variable>
	<xsl:variable name="zim-acdh">ZIM-ACDH</xsl:variable>
	<xsl:variable name="gams">Geisteswissenschaftliches Asset Management System</xsl:variable>
	<xsl:variable name="uniGraz">Universität Graz</xsl:variable>


	<!-- project-specific variables -->
	<xsl:variable name="server">/ufbas</xsl:variable>
	<!--<xsl:variable name="server">/gamsdev/pollin/ufbas/trunk</xsl:variable>-->

	<xsl:variable name="projectTitle">
		<xsl:text>Urfehdebücher der Stadt Basel – digitale Edition</xsl:text>
	</xsl:variable>
	<xsl:variable name="subTitle">
		<xsl:text> </xsl:text>
	</xsl:variable>

	<xsl:variable name="metadaten" select="document('/context:ufbas/DC')"/>


	<xsl:template match="/">

		<html lang="de">
			<head>
				<meta charset="utf-8"/>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

				<meta name="keywords"
					content="ufbas, GAMS, repository, digital, archive, edition, Urfehdebücher, StaBS Ratsbücher"/>
				<meta name="description"
					content="Urfehdebücher der Stadt Basel - Geisteswissenschaftliches Asset Management System.
					ie hier veröffentlichte Edition stellt das Urfehdebuch X (StaBS Ratsbücher O 10) mit Einträgen 
					vom Januar 1563 bis zum Dezember 1569 digital aufbereitet zur Verfügung. So weit möglich wurden
					Aufbau und Struktur der Einträge auch in der digitalen Form genau wiedergegeben; jeder Eintrag
					ist zudem mit dem Digitalisat des Originals verlinkt. Gleichzeitig bietet die digitale Edition 
					spezifische Möglichkeiten zur Auswertung über die Suchfunktion, die Verschlagwortung mittels 
					verschiedener, relevanter Kategorien und über einen „Datenkorb“, der die Auswahl einzelner Urfehden erlaubt."/>
				<meta name="publisher"
					content="Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities"/>
				<meta name="content-language" content="de"/>

				<!--Projekttitel-->
				<title>
					<xsl:value-of select="$projectTitle"/>
				</title>
			
				<!-- Bootstrap core CSS -->
				<link href="/lib/1.1/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
				<!-- Custom styles for this template -->
				<link href="{concat($server, '/css/template.css')}" rel="stylesheet" type="text/css"/>
				<link href="{concat($server, '/css/navbar.css')}" rel="stylesheet" type="text/css"/>
				<!-- CSS für Druckansicht -->
				<link rel="stylesheet"  type="text/css" media="print" href="/ufbas/css/ufbas_print.css"/>
				
				<!-- jQuery core JavaScript ================================================== -->
				<script type="text/javascript" src="/lib/1.0/jquery-2.2.4.min.js"><xsl:text> </xsl:text></script>
				
				<!-- Bootstrap core JavaScript ================================================== -->
				<script src="/lib/1.1/bootstrap-3.3.7/js/bootstrap.min.js"><xsl:text> </xsl:text></script>
				
				<!-- jQuery Plugin für Responsive Equal Height bei Columns: https://github.com/liabru/jquery-match-height -->
				<script src="/lib/1.0/plugins/matchHeight/jquery.matchHeight.js" type="application/javascript"><xsl:text> </xsl:text></script>
				<script src="/lib/1.0/plugins/matchHeight/matchHeight.js" type="application/javascript"><xsl:text> </xsl:text></script>	
					
				<script src="{concat($server, '/js/jquery_scrolltotop.js')}" type="application/javascript"><xsl:text> </xsl:text></script>
				
				<!-- Highlithing -->
				<script src="{concat($server, '/js/highlighting.js')}" type="application/javascript"><xsl:text> </xsl:text></script>
				
				<!--jQuery für sticky sidebar-->
				<script src="/lib/1.0/plugins/stickyfloat/stickyfloat.js" type="application/javascript"><xsl:text> </xsl:text></script>
				<script>
					$(document).ready(function(){
					$('.bla').stickyfloat({duration:0, startOffset: 70});
					});
				</script>

				<!--Javascript für scrolling unter navbar. Damit die Anker richtig zentrieren. -->
				<script src="{concat($server, '/js/scrolldown.js')}" type="application/javascript"><xsl:text> </xsl:text></script>
				<script src="{concat($server, '/js/buildquery.js')}" type="application/javascript"><xsl:text> </xsl:text></script>
				
				<script type="application/javascript">
					$(function() {
					$("#toTop").scrollToTop(1000);
					});
				</script>
				
				<!-- datenkorb.js -->
				<script src="{concat($server, '/js/datenkorb.js')}" type="application/javascript"><xsl:text> </xsl:text></script>
				<script type="text/javascript" src="{concat($server, '/js/d3.v4.min.js')}" charset="utf-8"><xsl:text> </xsl:text></script>
				<!-- d3.tip.v0.6.3.js must be after d3.v4.min.js as it uses functions there -->
				<script type="text/javascript" src="{concat($server, '/js/d3.tip.v0.6.3.js')}" charset="utf-8"><xsl:text> </xsl:text></script>
				
				
			</head>

			<body>
				<noscript>JavaScript ist im Browser deaktiviert oder wird nicht unterstützt. Aktivieren Sie JavaScript um die Seite richtig darzustellen.</noscript>
				<!-- variable cid und mode -->
				<xsl:variable name="url">
					<xsl:choose>
						<xsl:when test="$cid='context:ufbas'">
							<xsl:value-of select="$cid" /> 
							<xsl:text>/sdef:Context/get?mode=</xsl:text>
							<xsl:value-of select="$mode" />
							<xsl:text>&amp;locale=</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>

				<header>
					<div class="visible-print-block">
						<h1>
							<xsl:value-of select="$projectTitle"/>
						</h1>
					</div>
					<div class="container hidden-print">
						<div class="row flex">
							<div class="col-md-8">
								<h1>
									<xsl:value-of select="$projectTitle"/>
								</h1>
								<h3 style="color:white;">
									<xsl:value-of select="$subTitle"/>
								</h3>
							</div>
							<div class="col-md-4">
								<div class="unilogo">
									<a href="//www.unibas.ch/de" class="unilogo">
										<img class="logoUni"
											style="margin-right: 20px;"
											src="/ufbas/img/basellogo.png"
											height="62" title="Universität Basel"
											alt="Universität Basel"/>
									</a>
									
									<a href="://www.uni-graz.at" class="unilogo">
										<img class="logoUni"
											src="/ufbas/img/logo_uni_graz_4c.jpg"
											height="62" title="Universität Graz"
											alt="Universität Graz"/>
									</a>
								</div>
							</div>
						</div>
					</div>
				</header>


				<nav class="navbar navbar-default" role="navigation" id="nav">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"><xsl:text> </xsl:text></span>
								<span class="icon-bar"><xsl:text> </xsl:text></span>
								<span class="icon-bar"><xsl:text> </xsl:text></span>
							</button>
							<a class="navbar-brand hidden-lg hidden-md hidden-sm"
								href="/context:ufbas">Navigation</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<!-- Navbar LEFT-->
							<ul class="nav navbar-nav">
								<li>
									<xsl:if test="$mode = '' and $cid = 'context:ufbas'">
										<xsl:attribute name="class">active</xsl:attribute>
									</xsl:if>
									<!-- active klasse muss für aktiven navigationspunkt zugewiesen werden -->
									<a href="/archive/objects/context:ufbas/methods/sdef:Context/get?mode=home">Home</a>
								</li>
								<!-- Projekt Button -->
								<li>
									<xsl:if test="$mode = 'about' and $cid = 'context:ufbas'">
										<xsl:attribute name="class">active</xsl:attribute>
									</xsl:if>
									<a href="/archive/objects/context:ufbas/methods/sdef:Context/get?mode=about">Projekt</a>
								</li>
								<!-- Zum Urfehdebuch-->
								<li>
									<xsl:if test="$mode = '' and $cid = 'context:ufbas'">
										<xsl:attribute name="class">active</xsl:attribute>
									</xsl:if>
									<a href="/o:ufbas.1563">Urfehdebuch</a>
								</li>
								<li>
									<xsl:if test="$mode = '' and $cid = 'context:ufbas'">
										<xsl:attribute name="class">active</xsl:attribute>
									</xsl:if>
									<a href="/o:ufbas.kategorien">Kategorien</a>
								</li>
								<li>
									<a href="/archive/objects/context:ufbas/methods/sdef:Context/get?mode=datenkorb" id="datenkorbstatic">
										Datenkorb
									</a>
								</li>
								
							</ul>
							
							<!-- Navbar RIGHT-->
							<ul class="nav navbar-nav navbar-right">
								<!-- ERWEITERTE SUCHE-->
								<li>
									<!--<xsl:if test="$mode = '' and $cid = 'context:ufbas'">
										<xsl:attribute name="class">active</xsl:attribute>
									</xsl:if>-->
									<a href="/archive/objects/query:ufbas.search/methods/sdef:Query/get?locale=&amp;mode=&amp;params=" style=" align:right"> Erweiterte Suche </a>
								</li>
						    <!-- VOLLTEXTSUCHE-->
								<li>
									<form id="volltextsuche" onsubmit="form2params($('#volltextsuche'))" class="navbar-form navbar-right" role="search" method="get"
										action="/archive/objects/query:ufbas.volltext/methods/sdef:Query/get">
		
										<!-- Volltextsuche über Query-Objekt -->
										<div class="input-group">
											<input id="query" name="$1" type="text"
												placeholder="Volltextsuche" 
												class="form-control"/>
											<span class="input-group-btn">
												<button type="submit" class="btn btn-default">
													<span class="glyphicon glyphicon-search"><xsl:text> </xsl:text></span>
												</button>
											</span>
											<!--<input type="hidden" name="$2" value=""/>
											<input type="hidden" name="$3" value=""/>-->
										</div>
									</form>
								</li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
					<!-- /.container -->
				</nav>
				<!-- sticky navigation, script muss unbedingt unter dem element <nav> stehen -->
				<script type="text/javascript">
					$('#nav').affix({
					offset : {
					top : $('header').height() - $('#nav').height()
					}
					});
				</script>

				<main class="container">
					<xsl:choose>
						<xsl:when test="$mode = 'home'">
							<xsl:call-template name="homepage"/>
						</xsl:when>
						<xsl:when test="$mode = 'imprint'">
							<!-- impressum, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->

							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:ufbas/', 'IMPRINT'))/t:TEI/t:text/t:body/t:div"
										/>
									</div>
								</article>
							</section>

						</xsl:when>
						<xsl:when test="$mode = 'searchHelp'">
							<!-- Hilfe für die Suche, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->

							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates select="document(concat('/context:templates/', 'SEARCH_HELP'))/t:TEI/t:text/t:body/t:div"
										/>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:otherwise>
							<xsl:call-template name="content"/>
						</xsl:otherwise>
					</xsl:choose>
				</main>

				<footer class="footer hidden-print">
					<div class="container">
						<div class="row" id="Bottom">
							<div class="col-md-6">
								<h6>Weitere Informationen</h6>
								<p>
									<a href="/archive/objects/context:ufbas/methods/sdef:Context/get?mode=imprint">
										Impressum
									</a>
									<br/>
									<a href="/archive/objects/context:gams/methods/sdef:Context/get?mode=dataprotection&amp;locale=de">Datenschutz</a>
								</p>
								<div>
									<a href="/" target="_blank">
										<img class="footer_icons"
											src="/templates/img/gamslogo_weiss.gif"
											height="48" title="{$gams}" alt="{$gams}"/>
									</a>
									<a href="https://informationsmodellierung.uni-graz.at"
										target="_blank">
										<img class="footer_icons"
											src="/templates/img/ZIM_weiss.png"
											height="48" title="{$zim-acdh}" alt="{$zim-acdh}"/>
									</a>
									<a href="https://creativecommons.org/licenses/by-nc-sa/4.0"
										target="_blank">
										<img class="footer_icons"
											src="/templates/img/by-nc-sa.png"
											height="45" title="Lizenz" alt="Lizenz"/>
									</a>
								</div>
							</div>

							<div class="col-md-6">
								<h6>Kontakt</h6>
								<p>Prof. Dr. Susanna Burghartz <br/>Universität Basel
									<br/>Departement Geschichte <br/>Hirschgässlein 21 <br/>CH-4051
									Basel
								</p>
								<p>
									<a href="mailto:burghartz-sekretariat-geschichte@unibas.ch">burghartz-sekretariat-geschichte@unibas.ch</a>
								</p>
								<br></br>
							</div>
						</div>
					</div>
				</footer>
					
			</body>
		</html>
	</xsl:template>
	
	
	<!-- Baut Einstiegsseite und $mode = home Seite.  -->
	<!-- ////////////////////////// -->
	<xsl:template name="homepage">
		<!-- einstiegsseite für projektkontext -->
		
		<section class="row">
			<article class="col-md-6">
				<img src="/ufbas/img/Startbild.png" class="img-responsive" alt="Startbild"/>
			</article>
			<article class="col-md-6">
				<div class="panel" style="height: 340px;">
					<h3>
						<xsl:value-of select="$projectTitle"/>
					</h3>
					<p>herausgegeben von Susanna Burghartz, Sonia Calvi und Georg Vogeler
					</p>
					<p>Basel/Graz 31.1.2017
					</p>
					<ul>
						<li>
							<a href="?mode=about">Einführung</a>
						</li>
						<li>
							<a href="/o:ufbas.1563">Ratsbücher O10, Urfehdenbuch X (1563-1569)</a>
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
	</xsl:template>
	

	<!--Ab hier je nach Bedarf ändern-->
	
	<xsl:template match="t:head">
		<xsl:choose>
			<xsl:when test="following-sibling::t:p">
				<h4>
					<xsl:value-of select="."/>
				</h4>
			</xsl:when>
			<xsl:otherwise>
				<h3>
					<xsl:value-of select="."/>
				</h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="t:bibl">
		<p>
			<xsl:value-of select="./t:title"/>
		</p>
	</xsl:template>

	<xsl:template match="t:div" priority="-2">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="t:p" priority="-2">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="t:lb" priority="-2">
		<br/>
	</xsl:template>

	<xsl:template match="t:ref">
		<a target="_blank">
			<xsl:attribute name="href">
				<xsl:value-of select="./@target"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</a>
	</xsl:template>
	
	



</xsl:stylesheet>
