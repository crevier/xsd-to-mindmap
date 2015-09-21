<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes"/>
    
    <!--   Variables   -->
    
    <xsl:variable name="simlpleTypeColor">#99ffff</xsl:variable>
    <xsl:variable name="complexTypeColor">#99ccff</xsl:variable>
    <xsl:variable name="propertiesColor">#fbca00</xsl:variable>
    <xsl:variable name="white">#ffffff</xsl:variable>
    <xsl:variable name="nl" select="'&#10;'" />
    
    <!--    templates   -->
    
    <xsl:template name="xsdType">
        <xsl:param name="bgColor"/>
        <xsl:param name="elementBgColor"/>
        <xsl:value-of select="$nl" disable-output-escaping="no" />
        <xsl:element name="node">
            <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
            <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
            <xsl:attribute name="FOLDER">true</xsl:attribute>
            <xsl:attribute name="ID"><xsl:value-of select="@name" /></xsl:attribute>
            <xsl:attribute name="TEXT"><xsl:value-of select="@name" /></xsl:attribute>
            <xsl:attribute name="BACKGROUND_COLOR"><xsl:value-of select="$bgColor"/></xsl:attribute>        
            <xsl:for-each select="xsd:sequence/xsd:element">
                <xsl:call-template name="xsdType">
                    <xsl:with-param name="bgColor"><xsl:value-of select="$elementBgColor"/></xsl:with-param>
                    <xsl:with-param name="elementBgColor"><xsl:value-of select="$white"/></xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>        
            <xsl:choose>
                <xsl:when test="@type">
                    <xsl:call-template name="simpleNode">
                        <xsl:with-param name="bgColor"><xsl:value-of select="$propertiesColor"/></xsl:with-param>
                        <xsl:with-param name="text">type = <xsl:value-of select="@type" /></xsl:with-param>
                        <xsl:with-param name="id"><xsl:value-of select="@name" />-type</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="@minOccurs">
                    <xsl:call-template name="simpleNode">
                        <xsl:with-param name="bgColor"><xsl:value-of select="$propertiesColor"/></xsl:with-param>
                        <xsl:with-param name="text">minOccurs = <xsl:value-of select="@minOccurs" /></xsl:with-param>
                        <xsl:with-param name="id"><xsl:value-of select="@name" />-minOccurs</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="@maxOccurs">
                    <xsl:call-template name="simpleNode">
                        <xsl:with-param name="bgColor"><xsl:value-of select="$propertiesColor"/></xsl:with-param>
                        <xsl:with-param name="text">maxOccurs = <xsl:value-of select="@maxOccurs" /></xsl:with-param>
                        <xsl:with-param name="id"><xsl:value-of select="@name" />-maxOccurs</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    <xsl:template name="simpleNode">
        <xsl:param name="bgColor"/>
        <xsl:param name="text"/>
        <xsl:param name="id"/>
        <xsl:element name="node">
            <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
            <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
            <xsl:attribute name="FOLDER">true</xsl:attribute>
            <xsl:attribute name="ID"><xsl:value-of select="$id" /></xsl:attribute>
            <xsl:attribute name="TEXT"><xsl:value-of select="$text" /></xsl:attribute>
            <xsl:attribute name="BACKGROUND_COLOR"><xsl:value-of select="$bgColor"/></xsl:attribute>        
        </xsl:element>
    </xsl:template>
    <xsl:template match="/">
        <xsl:value-of select="$nl" disable-output-escaping="no" />
        <xsl:element name="node">
            <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
            <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
            <xsl:attribute name="FOLDER">true</xsl:attribute>
            <xsl:attribute name="ID">ROOT</xsl:attribute>
            <xsl:attribute name="TEXT">XSD</xsl:attribute>
            <xsl:for-each select="xsd:schema/xsd:complexType">
                <xsl:call-template name="xsdType">
                    <xsl:with-param name="bgColor"><xsl:value-of select="$complexTypeColor"/></xsl:with-param>
                    <xsl:with-param name="elementBgColor"><xsl:value-of select="$simlpleTypeColor"/></xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="xsd:schema/xsd:simpleType">
                <xsl:call-template name="xsdType">
                    <xsl:with-param name="bgColor"><xsl:value-of select="$simlpleTypeColor"/></xsl:with-param>
                    <xsl:with-param name="elementBgColor"><xsl:value-of select="$white"/></xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:value-of select="$nl" disable-output-escaping="no" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
