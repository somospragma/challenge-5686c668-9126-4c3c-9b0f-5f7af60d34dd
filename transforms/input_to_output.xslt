<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <output_message>
            <xsl:apply-templates/>
        </output_message>
    </xsl:template>
    <xsl:template match="input_message">
        <output_message>
            <header>
                <xsl:value-of select="header"/>
            </header>
            <body>
                <xsl:value-of select="body"/>
            </body>
        </output_message>
    </xsl:template>
</xsl:stylesheet>