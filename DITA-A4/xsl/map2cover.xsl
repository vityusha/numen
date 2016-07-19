<?xml version="1.0" encoding="UTF-8"?>
<!-- This file is inteded for creating Cover from document MAP. 
	 Created by Oleg Alekseev.
	 E-mail: o_alekseev@mail.ru-->

<!DOCTYPE xsl:stylesheet [
	<!ENTITY gt "&gt;">
	<!ENTITY lt "&lt;">
	<!ENTITY rbl " ">
	<!ENTITY nbsp "&#xA0;">
	<!-- &#160; -->
	<!ENTITY quot "&#34;">
	<!ENTITY copyr "&#169;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://icl.com/saxon" extension-element-prefixes="saxon">
	<!-- map2htmltoc.xsl   main stylesheet
     Convert DITA map to a simple HTML table-of-contents view.
     Input = one DITA map file
     Output = one HTML file for viewing/checking by the author.

     Options:
        OUTEXT  = XHTML output extension (default is '.html')
        WORKDIR = The working directory that contains the document being transformed.
                   Needed as a directory prefix for the @href "document()" function calls.
                   Default is './'
-->
	<!-- Include error message template -->
	<xsl:output method="html" indent="no" encoding="UTF-8"/>
	<!-- *************************** Command line parameters *********************** -->
	<xsl:param name="OUTEXT" select="'.html'"/>
	<!-- "htm" and "html" are valid values -->
	<xsl:param name="WORKDIR" select="'./'"/>
	<xsl:param name="DITAEXT" select="'.xml'"/>
	<xsl:param name="contenttarget" select="'contentwin'"/>
	<xsl:param name="CSS"/>
	<xsl:param name="CSSPATH"/>
	<!-- Define a newline character -->
	<xsl:variable name="newline">
		<xsl:text>
</xsl:text>
	</xsl:variable>
	<xsl:variable name="VersionStr">
		<xsl:choose>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru-RU'">Версия </xsl:when>
			<!--На всякий случай проверяем неправильное задание атрибута xml:lang = 'ru_RU-->
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru-ru'">Версия </xsl:when>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru_RU'">Версия </xsl:when>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru_ru'">Версия </xsl:when>
			<xsl:otherwise>Version </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DocVersionStr">
		<xsl:choose>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru-RU'">Версия документа </xsl:when>
			<!--На всякий случай проверяем неправильное задание атрибута xml:lang = 'ru_RU-->
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru-ru'">Версия документа </xsl:when>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru_RU'">Версия документа </xsl:when>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru_ru'">Версия документа </xsl:when>
			<xsl:otherwise>Document version </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="RightsStr">
		<xsl:choose>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru-RU'"> Все права защищены</xsl:when>
			<!--На всякий случай проверяем неправильное задание атрибута xml:lang = 'ru_RU-->
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru-ru'"> Все права защищены</xsl:when>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru_RU'"> Все права защищены</xsl:when>
			<xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'ru_ru'"> Все права защищены</xsl:when>
			<xsl:otherwise> All rights reserved</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- *********************************************************************************
     Cover processing
     ********************************************************************************* -->
	<xsl:template match="/">
		<html>
			<xsl:value-of select="$newline"/>
			<head>
				<xsl:value-of select="$newline"/>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<style type="text/css"/>
				<link rel="stylesheet" type="text/css" href="../{$CSSPATH}{$CSS}" />
				<title><xsl:value-of select="//*[contains(@class, ' topic/prodname ')]/text()"/></title>
			</head>
			<xsl:value-of select="$newline"/>
			<body>
				<hr/>
				<div style="margin-top: 7%; margin-bottom: 7%; text-align:left;  font-family: arial;">
					<h1>
						<xsl:value-of select="//*[contains(@class, ' topic/prodname ')]/text()"/>
					</h1>
					<h2>
						<xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
					</h2>
					<h2>
						<xsl:value-of select="$VersionStr"/>
						<xsl:value-of select="//*[contains(@class, ' topic/vrm ')]/@version"/>
					</h2>
					<h2>
						<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='component']/@content"/>
					</h2>
					<h2>
						<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
					</h2>
				</div>
				<div style="margin-top: 7%; margin-bottom: 7%; text-align:left;  font-family: arial;">
					<p>
						<xsl:value-of select="//*[contains(@class, ' map/shortdesc ')]/text()"/>
					</p>
					<p>
						<xsl:value-of select="$DocVersionStr"/>
						<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='docedition']/@content"/>
					</p>
				</div>
				<hr/>
				<div style="text-align:left; color:#0053AC">
					<table width="95%" border="0">
						<tr>
							<td align="right">&copyr; 2008-<xsl:value-of select="//*[contains(@class, ' topic/copyryear ')]/@year"/>&nbsp;<xsl:value-of select="//*[contains(@class, ' topic/copyrholder ')]/text()"/>
								<xsl:value-of select="$RightsStr"/>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
