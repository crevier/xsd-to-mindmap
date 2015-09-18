<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="nl" select="'&#10;'" />
    <xsl:template match="/">
        <xsl:value-of select="$nl" disable-output-escaping="no" />
        <xsl:element name="node">
            <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
            <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
            <xsl:attribute name="FOLDER">true</xsl:attribute>
            <xsl:attribute name="ID">ROOT</xsl:attribute>
            <xsl:attribute name="TEXT">ROOT</xsl:attribute>
            <xsl:for-each select="schema/complexType">
                <xsl:value-of select="$nl" disable-output-escaping="no" />
                <xsl:element name="node">
                    <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
                    <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
                    <xsl:attribute name="FOLDER">true</xsl:attribute>
                    <xsl:attribute name="ID">
                        <xsl:value-of select="@name" />
                    </xsl:attribute>
                    <xsl:attribute name="TEXT">
                        <xsl:value-of select="@name" />
                    </xsl:attribute>
                    <xsl:attribute name="BACKGROUND_COLOR">#99ffff</xsl:attribute>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="schema/simpleType">
                <xsl:value-of select="$nl" disable-output-escaping="no" />
                <xsl:element name="node">
                    <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
                    <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
                    <xsl:attribute name="FOLDER">true</xsl:attribute>
                    <xsl:attribute name="ID">
                        <xsl:value-of select="@name" />
                    </xsl:attribute>
                    <xsl:attribute name="TEXT">
                        <xsl:value-of select="@name" />
                    </xsl:attribute>
                    <xsl:attribute name="BACKGROUND_COLOR">#99ccff</xsl:attribute>
                </xsl:element>
            </xsl:for-each>
            <xsl:value-of select="$nl" disable-output-escaping="no" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
