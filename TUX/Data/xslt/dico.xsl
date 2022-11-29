<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : dico.xsl
    Created on : 25 octobre 2022, 16:14
    Author     : charrek
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:tux="http://myGame/tux">
    <xsl:output method="xml"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    
    <!-- Racine de notre document html puis appel de nos templates plus bas -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Dictionnaire</title>
            </head>
            <body>
                <h1>DICTIONNAIRE</h1>
                
                <!--Ici on appel le template qui va contenir un tableau
                    contenant tout les mots présent dans le dictionnaire,
                    et ce, en fonction de leur niveau respectif  --> 
                 <xsl:apply-templates select="//tux:niveau"/>
                  
                 
            </body>
        </html>
    </xsl:template>
    
    
    <!-- Template appel
         Cette template appele la template mot en triant par ordre alphabetique
         de façon à ce qu'on ait l'affichage par niveau. -->
    <xsl:template match="tux:niveau">
        <br/>
        <h3>Niveau : <xsl:value-of select="@difficulte"/> </h3>
        
        <!-- appel du template affichage par ordre alphabetique -->
        <xsl:apply-templates select="tux:mot">
            <xsl:sort select="./text()" order="ascending"/>
        </xsl:apply-templates>
        
        <br/>
    </xsl:template>
    
    
    
      <!-- Template affichage Dico
         Cette template permet d'afficher les mots du niveau-->
    <xsl:template match="tux:mot">
        
        <xsl:value-of select="./text()"/>
        <br/>
    </xsl:template>
    
</xsl:stylesheet>
