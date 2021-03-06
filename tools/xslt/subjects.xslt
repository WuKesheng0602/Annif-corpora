<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3">
	<xsl:output
	method="text"
	omit-xml-declaration="yes"
	indent="no"
	media-type="string"/>
	
    <xsl:template match="@*|node()">
            <xsl:apply-templates select="@*|node()"/>
    </xsl:template>

	<xsl:template match="mods:topic | topic | mods:subject | subject">
		<xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>