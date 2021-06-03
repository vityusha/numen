<?xml version='1.0'?>

<!-- 
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved. 
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other 
trademarks are the property of their respective owners. 

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE "AS IS," WITH 
ABSOLUTELY NO WARRANTIES WHATSOEVER, WHETHER EXPRESS OR IMPLIED,  AND IDIOM
TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE AND WARRANTY OF NON-INFRINGEMENT. IDIOM TECHNOLOGIES, INC. SHALL NOT
BE LIABLE FOR INDIRECT, INCIDENTAL, SPECIAL, COVER, PUNITIVE, EXEMPLARY,
RELIANCE, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF 
ANTICIPATED PROFIT), ARISING FROM ANY CAUSE UNDER OR RELATED TO  OR ARISING 
OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF IDIOM
TECHNOLOGIES, INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. 

Idiom Technologies, Inc. and its licensors shall not be liable for any
damages suffered by any person as a result of using and/or modifying the
Software or its derivatives. In no event shall Idiom Technologies, Inc.'s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project hosted on Sourceforge.net. 
See the accompanying license.txt file for applicable licenses.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="1.1">
    
    <xsl:import href="basic-settings.xsl"/>
    <xsl:import href="custom-attr.xsl"/>
		
    <!-- PAGE layout parameters -->
    <xsl:variable name="page-width">210mm</xsl:variable>
    <xsl:variable name="page-height">297mm</xsl:variable>     
    <xsl:variable name="image-max-width">150mm</xsl:variable>     
   
    
    <!--Hyphenates turn off. Because of FOP error-->
    <xsl:attribute-set name="topic.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
		<!--xsl:attribute name="border-bottom">3pt solid black</xsl:attribute-->
        <xsl:attribute name="margin-top">0pc</xsl:attribute>
        <xsl:attribute name="margin-bottom">5pt</xsl:attribute>
        <!--xsl:attribute name="font-size">18pt</xsl:attribute-->
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <!--xsl:attribute name="text-transform">none</xsl:attribute-->
		<xsl:attribute name="text-transform">uppercase</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">1.4pc</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <!--Тест на разрыв текста от заголовка 3-го уровня-->
    <xsl:attribute-set name="topic.title__content">
        <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="margin-top">1pc</xsl:attribute>
        <xsl:attribute name="margin-bottom">2pt</xsl:attribute>
        <!--xsl:attribute name="font-size">12pt</xsl:attribute-->
        <xsl:attribute name="font-size">11pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="section.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before.optimum">15pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="example.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="space-after.optimum">5pt</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>


		<!--Page breaks-->
    <xsl:attribute-set name="fig">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="space-before">1.2em</xsl:attribute>
        <xsl:attribute name="space-after">1.2em</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="fig.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <!--xsl:attribute name="font-weight">bold</xsl:attribute-->
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <!--xsl:attribute name="space-before.optimum">5pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">10pt</xsl:attribute-->
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="shortdesc">
        <!--xsl:attribute name="font-size">9pt</xsl:attribute-->
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
        <xsl:attribute name="space-after.optimum">15pt</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter">
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
 
	 <xsl:attribute-set name="__frontmatter__system">
        <xsl:attribute name="margin-top">85mm</xsl:attribute>
        <!--xsl:attribute name="text-align">left</xsl:attribute-->
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <!--xsl:attribute name="text-transform">none</xsl:attribute-->
		<xsl:attribute name="text-transform">uppercase</xsl:attribute>
        <xsl:attribute name="font-size">28pt</xsl:attribute>
        <!--xsl:attribute name="font-weight">bold</xsl:attribute-->
        <!--xsl:attribute name="font-weight">normal</xsl:attribute-->
        <!--xsl:attribute name="line-height">140%</xsl:attribute-->
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__subsystem">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="margin-top">0mm</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <!--xsl:attribute name="text-transform">none</xsl:attribute-->
		<xsl:attribute name="text-transform">uppercase</xsl:attribute>
        <!--xsl:attribute name="font-weight">bold</xsl:attribute-->
        <!--xsl:attribute name="font-weight">normal</xsl:attribute-->
        <!--xsl:attribute name="line-height">140%</xsl:attribute-->
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__component">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="margin-top">0mm</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <!--xsl:attribute name="text-transform">none</xsl:attribute-->
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
        <!--xsl:attribute name="font-weight">bold</xsl:attribute-->
        <!--xsl:attribute name="font-weight">normal</xsl:attribute-->
        <!--xsl:attribute name="line-height">140%</xsl:attribute-->
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    
    <xsl:attribute-set name="__frontmatter__version">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
                <xsl:attribute name="margin-top">12mm</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <!--xsl:attribute name="font-weight">bold</xsl:attribute-->
        <!--xsl:attribute name="font-weight">normal</xsl:attribute-->
        <!--xsl:attribute name="line-height">140%</xsl:attribute-->
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__doctype">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
                <xsl:attribute name="margin-top">12mm</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <!--xsl:attribute name="font-weight">bold</xsl:attribute-->
        <!--xsl:attribute name="font-weight">normal</xsl:attribute-->
        <!--xsl:attribute name="line-height">140%</xsl:attribute-->
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
       
    <xsl:attribute-set name="__fo__root">
        <!--xsl:attribute name="font-family">Serif</xsl:attribute-->
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <!--xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="hyphenation-push-character-count">2</xsl:attribute>
        <xsl:attribute name="hyphenation-remain-character-count">2</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="language">ru</xsl:attribute>
        <xsl:attribute name="rx:link-back">true</xsl:attribute-->

    </xsl:attribute-set> 
    
    <xsl:attribute-set name="body__toplevel">
        <xsl:attribute name="margin-left">25pt</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="hyphenation-push-character-count">2</xsl:attribute>
        <xsl:attribute name="hyphenation-remain-character-count">2</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="language">ru</xsl:attribute>
        <xsl:attribute name="rx:link-back">true</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="body__secondLevel">
        <xsl:attribute name="margin-left">25pt</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="hyphenation-push-character-count">2</xsl:attribute>
        <xsl:attribute name="hyphenation-remain-character-count">2</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="language">ru</xsl:attribute>
        <xsl:attribute name="rx:link-back">true</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="body">
        <xsl:attribute name="margin-left">25pt</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="hyphenation-push-character-count">2</xsl:attribute>
        <xsl:attribute name="hyphenation-remain-character-count">2</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="language">ru</xsl:attribute>
        <xsl:attribute name="rx:link-back">true</xsl:attribute>
    </xsl:attribute-set>
    
     <!--lists-attr.xsl-->
    <!--Hyphenates turn off. Because of FOP error-->
    <xsl:attribute-set name="ul.li__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="ol.li__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="sl.sli__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="steps-unordered.step__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
     <xsl:attribute-set name="steps.step__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="substeps.substep__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="choices.choice__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:attribute-set>
   
    <!--Note-->
    <xsl:attribute-set name="note">
  		<xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__image__column">
        <xsl:attribute name="column-number">1</xsl:attribute>
        <xsl:attribute name="column-width">40pt</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
    </xsl:attribute-set>    
    
    <xsl:attribute-set name="note__image__entry">
        <xsl:attribute name="padding-right">5pt</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
    </xsl:attribute-set>
        
    <!--выравнивание картинок с кнопками в списке-->
    <xsl:attribute-set name="image">
        <!-- <xsl:attribute name="vertical-align">bottom</xsl:attribute> -->
		<xsl:attribute name="content-width">scale-down-to-fit</xsl:attribute>
		<xsl:attribute name="scaling">uniform</xsl:attribute>
		<xsl:attribute name="width" select="$image-max-width"></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="image__float">
		<xsl:attribute name="padding-top">-10pt</xsl:attribute>
		<xsl:attribute name="padding-bottom">-10pt</xsl:attribute>
		<xsl:attribute name="margin-top">-10pt</xsl:attribute>
		<xsl:attribute name="margin-bottom">-10pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="image__block">
		<xsl:attribute name="padding-top">0pt</xsl:attribute>
		<xsl:attribute name="padding-bottom">0pt</xsl:attribute>
		<xsl:attribute name="margin-top">-10pt</xsl:attribute>
		<xsl:attribute name="margin-bottom">-10pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="image__inline">
		<xsl:attribute name="padding-top">0pt</xsl:attribute>
		<xsl:attribute name="padding-bottom">0pt</xsl:attribute>
		<xsl:attribute name="margin-top">0pt</xsl:attribute>
		<xsl:attribute name="margin-bottom">0pt</xsl:attribute>
    </xsl:attribute-set>

    <!--pre-->
    <xsl:attribute-set name="pre">
        <xsl:attribute name="space-before">1.2em</xsl:attribute>
        <xsl:attribute name="space-after">0.8em</xsl:attribute>
        <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
        <xsl:attribute name="white-space-collapse">false</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
        <xsl:attribute name="font-family">Monospaced</xsl:attribute>
        <xsl:attribute name="line-height">106%</xsl:attribute>
        <!--xsl:attribute name="font-size">10pt</xsl:attribute-->
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <!--Если стоит language, то FOP глючит-->
        <!--xsl:attribute name="language">en</xsl:attribute--> 
    </xsl:attribute-set>
    
    <!--pr-domain-attr.xsl-->
    <!--codeblock-->
    <xsl:attribute-set name="codeblock">
        <xsl:attribute name="space-before">0.4em</xsl:attribute>
        <xsl:attribute name="space-after">0.8em</xsl:attribute>
        <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
        <xsl:attribute name="white-space-collapse">false</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
        <xsl:attribute name="font-family">Monospaced</xsl:attribute>
        <xsl:attribute name="line-height">106%</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <!--xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute-->
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
        <!--        &lt;xsl:attribute name=&quot;keep-together.within-page&quot;&gt;always&lt;/xsl:attribute&gt;-->
    </xsl:attribute-set>
    <!--pr-domain-attr.xsl-->
    <xsl:attribute-set name="parmname">
    		<!--xsl:attribute name="font-family">Monospaced</xsl:attribute-->
    		<xsl:attribute name="font-style">italic</xsl:attribute>
        <!--xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute-->
    </xsl:attribute-set>

    <!--sw-domain-attr.xsl-->
    <!--userinput-->
    <xsl:attribute-set name="userinput">
        <xsl:attribute name="font-family">Monospaced</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="background-color">#99ccff</xsl:attribute>
    </xsl:attribute-set>
    
    <!--systemoutput-->
    <!--xsl:attribute-set name="systemoutput">
        <xsl:attribute name="font-family">Monospaced</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="background-color">#f1f7ff</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set-->
    
    <xsl:attribute-set name="msgblock">
   	    <xsl:attribute name="space-before">0.4em</xsl:attribute>
        <xsl:attribute name="space-after">0.8em</xsl:attribute>
        <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
        <xsl:attribute name="white-space-collapse">false</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
        <xsl:attribute name="font-family">Monospaced</xsl:attribute>
        <xsl:attribute name="line-height">106%</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <!--xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute-->
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    </xsl:attribute-set>
    
    <!--static-content-attr.xsl-->
    <!--First-->
    <xsl:attribute-set name="__frontmatter__first__footer">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">20mm</xsl:attribute>
    </xsl:attribute-set>
    
  
    <!--xsl:attribute-set name="__frontmatter__first__header">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-left">30mm</xsl:attribute>
        <xsl:attribute name="margin-top">60mm</xsl:attribute>
    </xsl:attribute-set-->
    
    <xsl:attribute-set name="__frontmatter__first__picture">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-left">0mm</xsl:attribute>
        <xsl:attribute name="margin-top">0mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__cover__image">
        <xsl:attribute name="margin">0mm</xsl:attribute>
        <xsl:attribute name="padding">0mm</xsl:attribute>
        <!--<xsl:attribute name="vertical-align">center</xsl:attribute> -->
		<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
		<!--<xsl:attribute name="scaling">uniform</xsl:attribute>-->
		<xsl:attribute name="width" select="$page-width"></xsl:attribute>
		<xsl:attribute name="height" select="$page-height"></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__last__footer">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
    </xsl:attribute-set>
        
    <xsl:attribute-set name="__frontmatter__last__header">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
        <xsl:attribute-set name="__frontmatter__even__footer">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
    </xsl:attribute-set>
     
    <xsl:attribute-set name="__frontmatter__even__header">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
        <xsl:attribute-set name="__frontmatter__odd__footer">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
    </xsl:attribute-set>
    
        <xsl:attribute-set name="__frontmatter__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <!--Body-->
    <xsl:attribute-set name="__body__odd__footer">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">3mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__even__footer">
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__even__footer__picture">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">3mm</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__headline__picture">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-top">5mm</xsl:attribute>
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__slogan__odd__picture">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-bottom">3mm</xsl:attribute>
        <xsl:attribute name="margin-right">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__even__header">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__first__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <!--TOC-->
    <xsl:attribute-set name="__toc__odd__footer">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__even__footer">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__even__header">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <!--Index-->
    <xsl:attribute-set name="__index__odd__footer">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__index__even__footer">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">6mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__index__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-right">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__index__even__header">
        <xsl:attribute name="margin-left">15mm</xsl:attribute>
        <xsl:attribute name="margin-top">9mm</xsl:attribute>
    </xsl:attribute-set>
    
    
    
    <!--toc-attr.xsl-->
    <xsl:attribute-set name="__toc__header">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="margin-top">0pc</xsl:attribute>
        <xsl:attribute name="margin-bottom">1.4pc</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
		<xsl:attribute name="text-transform">uppercase</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">1.4pc</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute> 
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__link">
        <xsl:attribute name="line-height">150%</xsl:attribute>
        <xsl:attribute name="text-transform">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="$level = 1">uppercase</xsl:when>
                <xsl:otherwise>none</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <!--Раскомментировать для выделения жирным шрифтом первого и второго уровней оглавления-->
        <!--xsl:attribute name="font-weight">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="$level = 1">bold</xsl:when>
                <xsl:when test="$level = 2">bold</xsl:when>
                <xsl:otherwise>none</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute-->
        <xsl:attribute name="hyphenate">true</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__topic__content">
        <xsl:attribute name="last-line-end-indent">-22pt</xsl:attribute>
        <xsl:attribute name="end-indent">22pt</xsl:attribute>
        <xsl:attribute name="text-indent">-.2in</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1in</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__indent">
        <xsl:attribute name="margin-left">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:value-of select="concat(string(number($level) * 20), 'pt')"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    
    <!--index-attr.xsl-->
	<xsl:attribute-set name="__index__label">
        <xsl:attribute name="margin-top">20pt</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="space-after.optimum">20pt</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__index__letter-group">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1in</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    </xsl:attribute-set>
    
    <!--tables-attr.xsl-->
     <xsl:attribute-set name="table">
        <!--It is a table container -->
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="space-after.optimum">10pt</xsl:attribute>
        <xsl:attribute name="pgwide">0</xsl:attribute>
        <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="table.tgroup">
        <!--It is a table-->
        <xsl:attribute name="table-layout">fixed</xsl:attribute>
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="thead__tableframe__bottom">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">black</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="thead.row.entry">
        <!--head cell-->
        <xsl:attribute name="background-color">rgb(140,215,245)</xsl:attribute>
        <xsl:attribute name="padding-left">-25pt</xsl:attribute>
    </xsl:attribute-set>  
    
  	<xsl:attribute-set name="thead.row">
        <!--Head row-->
        <xsl:attribute name="display-align">center</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tfoot.row">
        <!--Table footer-->
        <xsl:attribute name="display-align">center</xsl:attribute>
    </xsl:attribute-set>
   
    <xsl:attribute-set name="tbody.row">
        <!--Table body row-->
        <xsl:attribute name="display-align">center</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="tbody.row.entry">
        <!--Table body row entry-->
        <xsl:attribute name="padding-left">-25pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sthead.stentry">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute>  
    </xsl:attribute-set>
    
    <xsl:attribute-set name="strow.stentry">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute>  
    </xsl:attribute-set>
    
    <xsl:attribute-set name="prophead.entry">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute>  
    </xsl:attribute-set>
    
    <xsl:attribute-set name="properties">
        <xsl:attribute name="relcolwidth">90* 150*</xsl:attribute>  
    </xsl:attribute-set>

    <xsl:attribute-set name="property.entry">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute>  
    </xsl:attribute-set>
    
    <xsl:attribute-set name="chhead.choptionhd">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute> 
    </xsl:attribute-set>
    
    <xsl:attribute-set name="chhead.chdeschd">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute> 
    </xsl:attribute-set>
    
    <xsl:attribute-set name="chrow.choption">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute> 
    </xsl:attribute-set>
    
    <xsl:attribute-set name="chrow.chdesc">
        <xsl:attribute name="padding-left">-25pt</xsl:attribute> 
    </xsl:attribute-set>
    
    <xsl:attribute-set name="dlentry.dt">
        <xsl:attribute name="relative-align">baseline</xsl:attribute>
        <xsl:attribute name="padding-left">-25pt</xsl:attribute>
        <xsl:attribute name="padding-right">65pt</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="dlentry.dd">
        <xsl:attribute name="padding-left">-90pt</xsl:attribute> 
    </xsl:attribute-set>
    
    <!--xsl:attribute-set name="dlentry.dt__content">
        <xsl:attribute name="margin">3pt 3pt 3pt 3pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        </xsl:attribute-set-->
    
    <!--Задание цвета ссылок related-links в PDF-->
    <xsl:attribute-set name="link__content">
        <xsl:attribute name="color">#2C4074</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <!--<xsl:attribute name="margin-left">8pt</xsl:attribute>-->
    </xsl:attribute-set>
  
    <xsl:attribute-set name="glossterm">
        <xsl:attribute name="color">#2C4074</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <!--<xsl:attribute name="margin-left">8pt</xsl:attribute>-->
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__headline__cell">
        <xsl:attribute name="width">150mm</xsl:attribute>
        <!--<xsl:attribute name="valign">bottom</xsl:attribute>-->
    </xsl:attribute-set>
	
</xsl:stylesheet>
