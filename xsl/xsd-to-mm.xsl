<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
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
            <xsl:choose>
                <xsl:when test="xsd:annotation/xsd:documentation">
                     <xsl:element name="richcontent">
                     <xsl:attribute name="TYPE">NOTE</xsl:attribute>
                         <xsl:element name="html">
                             <xsl:element name="head"/>
                             <xsl:element name="body">
                                 <xsl:for-each select="xsd:annotation/xsd:documentation">
                                     <xsl:element name="p">
                                         <xsl:text> lang : </xsl:text>
                                         <xsl:value-of select="@xml:lang"/>
                                         <xsl:element name="br"/>
                                         <xsl:value-of select="."/>
                                     </xsl:element>
                                 </xsl:for-each>
                             </xsl:element>
                         </xsl:element>
                     </xsl:element>
                </xsl:when>
            </xsl:choose>
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
        <xsl:element name="map">
            <xsl:attribute name="version">freeplane 1.3.0</xsl:attribute>
            <xsl:value-of select="$nl" disable-output-escaping="no" />
            <xsl:element name="node">
                <xsl:attribute name="CREATED">1441903110572</xsl:attribute>
                <xsl:attribute name="MODIFIED">1441903110572</xsl:attribute>
                <xsl:attribute name="FOLDER">true</xsl:attribute>
                <xsl:attribute name="ID">ROOT</xsl:attribute>
                <xsl:attribute name="TEXT">XSD</xsl:attribute>
                <xsl:attribute name="FOLDER">true</xsl:attribute>
                <xsl:element name="hook">
                    <xsl:attribute name="NAME">MapStyle</xsl:attribute>
                    <xsl:element name="properties">
                        <xsl:attribute name="show_note_icons">true</xsl:attribute>
                    </xsl:element>
                    <xsl:element name="map_styles">
                        <xsl:element name="stylenode">
                            <xsl:attribute name="LOCALIZED_TEXT">styles.root_node</xsl:attribute>
                            <xsl:element name="stylenode">
                                <xsl:attribute name="LOCALIZED_TEXT">styles.predefined</xsl:attribute>
                                <xsl:attribute name="POSITION">right</xsl:attribute>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">default</xsl:attribute>
                                    <xsl:attribute name="MAX_WIDTH">600</xsl:attribute>
                                    <xsl:attribute name="COLOR">#000000</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="NAME">SansSerif</xsl:attribute>
                                        <xsl:attribute name="SIZE">10</xsl:attribute>
                                        <xsl:attribute name="BOLD">false</xsl:attribute>
                                        <xsl:attribute name="ITALIC">false</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">defaultstyle.details</xsl:attribute>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">defaultstyle.note</xsl:attribute>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">defaultstyle.floating</xsl:attribute>
                                    <xsl:element name="edge">
                                        <xsd:attribute name="STYLE">hide_edge</xsd:attribute>
                                    </xsl:element>
                                    <xsl:element name="cloud">
                                        <xsd:attribute name="COLOR">#f0f0f0</xsd:attribute>
                                        <xsd:attribute name="SHAPE">ROUND_RECT</xsd:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="stylenode">
                                <xsl:attribute name="LOCALIZED_TEXT">styles.user-defined</xsl:attribute>
                                <xsl:attribute name="POSITION">right</xsl:attribute>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">styles.topic</xsl:attribute>
                                    <xsl:attribute name="COLOR">#18898b</xsl:attribute>
                                    <xsl:attribute name="STYLE">fork</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="NAME">Liberation Sans</xsl:attribute>
                                        <xsl:attribute name="SIZE">10</xsl:attribute>
                                        <xsl:attribute name="BOLD">true</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>                        
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">styles.subtopic</xsl:attribute>
                                    <xsl:attribute name="COLOR">#cc3300</xsl:attribute>
                                    <xsl:attribute name="STYLE">fork</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="NAME">Liberation Sans</xsl:attribute>
                                        <xsl:attribute name="SIZE">10</xsl:attribute>
                                        <xsl:attribute name="BOLD">true</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">styles.subsubtopic</xsl:attribute>
                                    <xsl:attribute name="COLOR">#669900</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="NAME">Liberation Sans</xsl:attribute>
                                        <xsl:attribute name="SIZE">10</xsl:attribute>
                                        <xsl:attribute name="BOLD">true</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">styles.important</xsl:attribute>
                                    <xsl:element name="icon">
                                         <xsl:attribute name="BUILTIN">yes</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="stylenode">
                                <xsl:attribute name="LOCALIZED_TEXT">styles.AutomaticLayout</xsl:attribute>
                                <xsl:attribute name="POSITION">right</xsl:attribute>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">AutomaticLayout.level.root</xsl:attribute>
                                    <xsl:attribute name="COLOR">#000000</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="SIZE">18</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">AutomaticLayout.level.root,1</xsl:attribute>
                                    <xsl:attribute name="COLOR">#0033ff</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="SIZE">16</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">AutomaticLayout.level.root,2</xsl:attribute>
                                    <xsl:attribute name="COLOR">#00b439</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="SIZE">14</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">AutomaticLayout.level.root,3</xsl:attribute>
                                    <xsl:attribute name="COLOR">#990000</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="SIZE">12</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="stylenode">
                                    <xsl:attribute name="LOCALIZED_TEXT">AutomaticLayout.level.root,4</xsl:attribute>
                                    <xsl:attribute name="COLOR">#111111</xsl:attribute>
                                    <xsl:element name="font">
                                        <xsl:attribute name="SIZE">10</xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                 </xsl:element>
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
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
