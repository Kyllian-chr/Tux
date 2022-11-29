<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : profil.xsl
    Created on : 25 octobre 2022, 17:47
    Author     : charrek
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:tux="http://myGame/tux">
    <xsl:output method="xml"/>

    <!--  Permet affichage d'un xhtml d'un profil
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Profil Joueur</title>
            </head>
            <body>
                <br/>
                <h3>Nom : <xsl:value-of select="tux:profil/tux:nom/text()"/></h3>
                <h5>Avatar : <xsl:value-of select="tux:profil/tux:avatar/text()"/></h5>
                <h5>Anniversaire : <xsl:value-of select="tux:profil/tux:anniversaire/text()"/></h5>
                
                <br/>
                <!-- Permet de gerer l'appartition de plusieurs parties pour un même joueur -->
                <table>
                    <tr>
                        <th>   Date   </th>
                        <th>   Temps   </th>
                        <th>   Niveau   </th>
                        <th>   Mot   </th>
                        <th>   Trouvé   </th>
                    </tr>
                    <xsl:apply-templates select="//tux:partie">
                        <xsl:sort select="@date" order="descendind"/>
                    </xsl:apply-templates>
                </table>
                
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tux:partie">
        <br/>
        <tr>
            <th>
            
                <h5>
                    <xsl:value-of select="@date"/>
                </h5>
            </th>
            <th>
                <h5>
                    <xsl:value-of select="tux:temps"/>
                </h5>
            </th>
            <th>
                <h5>
                    <xsl:value-of select="tux:niveau/@difficulte"/>
                </h5>  
            </th>
            <th>
                <h5>
                    <xsl:value-of select="tux:niveau/tux:mot/text()"/>
                </h5>  
            </th>
            <th>
                <h5>
                    <xsl:value-of select="@trouve"/>
                </h5>  
            </th>
            
        </tr>
    </xsl:template>
    

</xsl:stylesheet>
