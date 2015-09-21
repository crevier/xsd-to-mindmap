<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes"/>
    
<!--   Variables and templates   -->
    
    <xsl:variable name="nl" select="'&#10;'" />
    <xsl:template name="xsdType">
        <xsl:param name="bgColor"/>
        <xsl:value-of select="$nl" disable-output-escaping="no" />
        <xsl:element name="node">
        <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
        <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
        <xsl:attribute name="FOLDER">true</xsl:attribute>
        <xsl:attribute name="ID"><xsl:value-of select="@name" /></xsl:attribute>
        <xsl:attribute name="TEXT"><xsl:value-of select="@name" /></xsl:attribute>
        <xsl:attribute name="BACKGROUND_COLOR"><xsl:value-of select="$bgColor"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <!--   Transformation   -->
    
    <xsl:template match="/">
        <xsl:value-of select="$nl" disable-output-escaping="no" />
        <xsl:element name="node">
            <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
            <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
            <xsl:attribute name="FOLDER">true</xsl:attribute>
            <xsl:attribute name="ID">ROOT</xsl:attribute>
            <xsl:attribute name="TEXT">ROOT</xsl:attribute>
            <xsl:for-each select="xsd:schema/xsd:complexType">
                <xsl:call-template name="xsdType">
                    <xsl:with-param name="bgColor">#99ffff</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="xsd:schema/xsd:simpleType">
                <xsl:call-template name="xsdType">
                    <xsl:with-param name="bgColor">#99ccff</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:value-of select="$nl" disable-output-escaping="no" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
