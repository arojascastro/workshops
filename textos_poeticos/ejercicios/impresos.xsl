<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:output method="html"/>

  <xsl:template match="/">

    <xsl:for-each select="//tei:witness[tei:biblStruct]/tei:msDesc[@type = 'print']">

      <xsl:variable name="sigla" select="parent::tei:witness/@xml:id"/>

      <xsl:result-document href="{concat($sigla, '.html')}">

        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="es" xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <title>
              <xsl:value-of select="//tei:titleStmt/tei:title"/>
            </title>
            <meta name="DC. CREATOR.AUT" content="Luis de Góngora"/>
            <meta name="DC.TITLE" content="Canción VI de Luis de Gógnora. Edición digital"/>
            <meta name="DC.CREATOR" content="Luis de Góngora"/>
            <meta name="DC.CONTRIBUTOR" content="Antonio Rojas Castro"/>
            <meta name="DC.TYPE" content="Text"/>
            <meta name="DC.SUBJECT" content="Poesía Siglo de Oro Edición digital Luis de Góngora"/>
            <meta name="DC.FORMAT" content="text/html"/>
            <meta name="DC.LANGUAGE" content="es"/>
            <meta name="DC.DATE.CREATED" content="1600"/>
            <meta name="DC.RIGHTS" content="Creative Commons By 4.0"/>
            <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>
            <style>
              /* Remove the navbar's default margin-bottom and rounded borders */
              .navbar{
                margin-bottom: 0;
                border-radius: 0;
              }
              
              /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
              .row.content{
                height: 800px;
              }
              
              /* Set gray background color and 100% height */
              .sidenav{
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 800px;
              }
              
              /* Set black background color, white text and some padding */
              footer{
                background-color: #555;
                color: white;
                padding: 15px;
              }
              
              /* On small screens, set height to 'auto' for sidenav and grid */
              @media screen and (max-width : 767px){
                .sidenav{
                  height: auto;
                  padding: 15px;
                }
                .row.content{
                  height: auto;
                }
              }</style>
          </head>

          <body>

            <nav class="navbar navbar-inverse">
              <div class="container-fluid">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"/>
                    <span class="icon-bar"/>
                    <span class="icon-bar"/>
                  </button>
                  <a class="navbar-brand" href="index.html">
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                  </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                  <ul class="nav navbar-nav">
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Edición<span class="caret"/></a>
                      <ul class="dropdown-menu">
                        <li>
                          <a href="paleografica.html">Transcripción paleográfica</a>
                        </li>
                        <li>
                          <a href="modernizada.html">Edición modernizada con notas</a>
                        </li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Testimonios<span class="caret"/></a>
                      <ul class="dropdown-menu">
                        <li>
                          <a href="A.html">A</a>
                        </li>
                        <li>
                          <a href="B.html">B</a>
                        </li>
                        <li>
                          <a href="Ch.html">Ch</a>
                        </li>
                        <li>
                          <a href="E.html">E</a>
                        </li>
                        <li>
                          <a href="F.html">F</a>
                        </li>
                        <li>
                          <a href="H.html">H</a>
                        </li>
                        <li>
                          <a href="I.html">I</a>
                        </li>
                        <li>
                          <a href="J.html">J</a>
                        </li>
                        <li>
                          <a href="K.html">K</a>
                        </li>
                        <li>
                          <a href="M.html">M</a>
                        </li>
                        <li>
                          <a href="N.html">N</a>
                        </li>
                        <li>
                          <a href="T.html">T</a>
                        </li>
                        <li>
                          <a href="Flo.html">Flo</a>
                        </li>
                        <li>
                          <a href="Vi.html">Vi</a>
                        </li>
                        <li>
                          <a href="Sa.html">Sa</a>
                        </li>
                      </ul>
                    </li>
                    <li>
                      <a href="#">Criterios editoriales</a>
                    </li>
                    <li>
                      <a href="indices.html">Índices</a>
                    </li>
                    <li>
                      <a href="bibliografia.html">Bibliografía</a>
                    </li>
                  </ul>
                </div>
              </div>
            </nav>

            <div class="container-fluid text-center">

              <div class="row content">

                <div class="col-sm-2 sidenav"/>

                <div class="col-sm-8 text-left">
                  <xsl:apply-templates select="."/>
                </div>

                <div class="col-sm-2 sidenav"/>

              </div>

            </div>

            <footer class="container-fluid text-center">
              <p>
                <xsl:value-of select="//tei:titleStmt/tei:respStmt[1]/tei:resp"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="//tei:titleStmt/tei:respStmt[1]/tei:persName"/>
              </p>
              <p>
                <xsl:value-of select="//tei:titleStmt/tei:respStmt[2]/tei:resp"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="//tei:titleStmt/tei:respStmt[2]/tei:persName"/>
              </p>
              <p>
                <xsl:value-of select="//tei:publicationStmt/tei:pubPlace"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="//tei:editionStmt/tei:edition/@n"/>
                <sup>a</sup>
                <xsl:text> edición de </xsl:text>
                <xsl:value-of select="//tei:editionStmt/tei:edition/tei:date"/>
              </p>
              <p>
                <img class="iconocc" src="creativecommons.png" alt="icono"/>
                <xsl:text> Esta edición se publica con una licencia </xsl:text>
                <a href="{//tei:licence/@target}">
                  <xsl:value-of select="//tei:licence"/>
                </a>
              </p>
            </footer>

          </body>
        </html>

      </xsl:result-document>

    </xsl:for-each>

  </xsl:template>


  <xsl:template match="//tei:msDesc">

    <div xmlns="http://www.w3.org/1999/xhtml" class="manuscrito_container">

      <h2 class="manuscrito_sigla" xml:id="{parent::tei:witness/@xml:id}">
        <xsl:value-of select="parent::tei:witness/@xml:id"/>
      </h2>

      <h3 class="manuscrito_id">
        <xsl:text>Identificación</xsl:text>
      </h3>
      <ul>
        <li>
          <xsl:text>País: </xsl:text>
          <xsl:apply-templates select="tei:msIdentifier/tei:country"/>
        </li>
        <li>
          <xsl:text>Ciudad: </xsl:text>
          <xsl:value-of select="tei:msIdentifier/tei:settlement"/>
        </li>
        <li>
          <xsl:text>Repositorio: </xsl:text>
          <xsl:value-of select="tei:msIdentifier/tei:repository"/>
        </li>
        <li>
          <xsl:text>Colección: </xsl:text>
          <xsl:value-of select="tei:msIdentifier/tei:collection"/>
        </li>
        <li>
          <xsl:text>Signatura: </xsl:text>
          <xsl:value-of select="tei:msIdentifier/tei:idno"/>
        </li>
        <li>
          <xsl:text>Título: </xsl:text>
          <em>
            <xsl:value-of select="following-sibling::tei:biblStruct/tei:monogr/tei:title"/>
          </em>
        </li>
        <li>
          <xsl:text>Editor: </xsl:text>
          <xsl:value-of select="following-sibling::tei:biblStruct/tei:monogr/tei:editor"/>
        </li>
        <li>
          <xsl:text>Lugar de publicación: </xsl:text>
          <xsl:value-of select="following-sibling::tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace"/>
        </li>
        <li>
          <xsl:text>Fecha de publicación: </xsl:text>
          <xsl:value-of select="following-sibling::tei:biblStruct/tei:monogr/tei:imprint/tei:date"/>
        </li>
        <li>
          <xsl:value-of select="following-sibling::tei:biblStruct/tei:monogr/tei:imprint/tei:respStmt[1]/tei:resp"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of
            select="
              following-sibling::tei:biblStruct/tei:monogr/tei:imprint/tei:respStmt[1]/tei:persName |
              following-sibling::tei:biblStruct/tei:monogr/tei:imprint/tei:respStmt[1]/tei:orgName"
          />
        </li>
        <li>
          <xsl:value-of select="following-sibling::tei:biblStruct/tei:monogr/tei:imprint/tei:respStmt[2]/tei:resp"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of select="following-sibling::tei:biblStruct/tei:monogr/tei:imprint/tei:respStmt[2]/tei:persName"/>
        </li>
      </ul>

    </div>

  </xsl:template>

</xsl:stylesheet>
