<?xml version='1.0'?>
<!--
	Bercut Templates
	Created by Oleg Alekseev
	-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic-mapmerge="http://www.idiominc.com/opentopic/mapmerge"
    xmlns:exsl="http://exslt.org/common"
    xmlns:exslf="http://exslt.org/functions"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    exclude-result-prefixes="opentopic-mapmerge opentopic-func exslf exsl"
    version="1.1">

	<xsl:key name="topic" match="dita-merge//*[contains(@class,' topic/topic ')]" use="concat('#',@id)"/>
	<xsl:key name="topic" match="dita-merge//dita" use="concat('#',@id)"/>

	<!--FrontMatter-->   
	<xsl:template name="createFrontMatter">
		<fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="__force__page__count">
			<xsl:call-template name="insertFrontMatterStaticContents"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block xsl:use-attribute-sets="__frontmatter">
					<!-- set the system -->
					<!--<fo:block xsl:use-attribute-sets="__frontmatter__system">
						<xsl:value-of select="//*[contains(@class, ' topic/prodname ')]/text()"/>                        
					</fo:block> -->
					<!-- set the subsystem -->
					<!-- <fo:block xsl:use-attribute-sets="__frontmatter__subsystem">
						<xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
					</fo:block> -->
					<!-- set the component -->
					<!-- <xsl:if test="//*[contains(@class, ' topic/othermeta ') and @name='component'][@content]">
						<fo:block xsl:use-attribute-sets="__frontmatter__component">
							<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='component']/@content"/>
						</fo:block>
					</xsl:if> -->
					<!-- set the subsystem version -->
					<!-- <fo:block xsl:use-attribute-sets="__frontmatter__version">
						<xsl:variable name="subsystem_version">
							<xsl:call-template name="insertVariable">
								<xsl:with-param name="theVariableID" select="'SubSystemVersion'"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:value-of select="$subsystem_version"/>
						<xsl:value-of select="//*[contains(@class, ' topic/vrm ')]/@version"/>
					</fo:block> -->
					<!-- set the document type -->
					<!-- <fo:block xsl:use-attribute-sets="__frontmatter__doctype">
						<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
					</fo:block> -->
					<!-- set the annotation -->
					<fo:block xsl:use-attribute-sets="__fo__root" break-before="even-page">
						<fo:block>
							<xsl:value-of select="//*[contains(@class, ' map/shortdesc ')]/text()"/>
						</fo:block>
						<!-- set the doc edition -->
						<fo:block>
							<xsl:variable name="doc_edition">
								<xsl:call-template name="insertVariable">
									<xsl:with-param name="theVariableID" select="'DocEdition'"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:value-of select="$doc_edition"/>
							<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='docedition']/@content"/>						
						</fo:block>
						<!-- set the copyright infomation -->
						<fo:block>
							<xsl:call-template name="insertVariable">
								<xsl:with-param name="theVariableID" select="'CopyrightInfo'"/>
								<xsl:with-param name="theParameters">
									<year>
										<xsl:choose>
											<xsl:when test="//*[contains(@class, ' topic/copyryear ')]/@year">
												<xsl:value-of select="//*[contains(@class, ' topic/copyryear ')]/@year"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:variable name="default_year">
													<xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID" select="'Default Year'"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:value-of select="$default_year"/>
											</xsl:otherwise>
										</xsl:choose>							
									</year>
									<copyrholder>
										<xsl:choose>
											<xsl:when test="//*[contains(@class, ' topic/copyrholder ')]/text()">
												<xsl:value-of select="//*[contains(@class, ' topic/copyrholder ')]/text()"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:variable name="default_copyrholder">
													<xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID" select="'Default Copyrholder'"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:value-of select="$default_copyrholder"/>
											</xsl:otherwise>
										</xsl:choose>														
									</copyrholder>
								</xsl:with-param>
							</xsl:call-template>
						</fo:block>
					</fo:block>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>

	<xsl:template name="insertFrontMatterStaticContents">
		<!--xsl:call-template name="insertFrontMatterFootnoteSeparator"/-->
		<xsl:call-template name="insertFrontMatterFirstFooter"/>
		<xsl:call-template name="insertFrontMatterFirstHeader"/>
		<xsl:call-template name="insertFrontMatterLastFooter"/>
		<xsl:call-template name="insertFrontMatterLastHeader"/>
		<xsl:call-template name="insertFrontMatterOddFooter"/>
		<xsl:call-template name="insertFrontMatterEvenFooter"/>
		<xsl:call-template name="insertFrontMatterOddHeader"/>
		<xsl:call-template name="insertFrontMatterEvenHeader"/>
		<xsl:call-template name="insertFrontMatterOddIndent"/>
		<xsl:call-template name="insertBodyOddIndent"/>
		<!--        <xsl:call-template name="insertPrefaceLastHeader"/>-->
		<!--        <xsl:call-template name="insertPrefaceLastFooter"/>-->
	</xsl:template>

	<xsl:template name="insertBodyStaticContents">
		<xsl:call-template name="insertBodyFootnoteSeparator"/>
		<xsl:call-template name="insertBodyOddFooter"/>
		<xsl:call-template name="insertBodyEvenFooter"/>
		<xsl:call-template name="insertBodyOddHeader"/>
		<xsl:call-template name="insertBodyEvenHeader"/>
		<xsl:call-template name="insertBodyFirstHeader"/>
		<xsl:call-template name="insertBodyFirstFooter"/>
		<xsl:call-template name="insertBodyLastHeader"/>
		<xsl:call-template name="insertBodyLastFooter"/>
		<xsl:call-template name="insertBodyOddIndent"/>
	</xsl:template>

	<xsl:template name="insertTocStaticContents">
		<xsl:call-template name="insertTocOddFooter"/>
		<xsl:call-template name="insertTocEvenFooter"/>
		<xsl:call-template name="insertTocOddHeader"/>
		<xsl:call-template name="insertTocEvenHeader"/>
		<xsl:call-template name="insertTocOddIndent"/>
	</xsl:template>

	<xsl:template name="insertFrontMatterFirstHeader">
		<fo:static-content flow-name="first-frontmatter-header">
			<fo:block xsl:use-attribute-sets="__frontmatter__first__picture" text-align="center" space-before="0mm" margin="0mm" padding="0mm">
				<xsl:variable name="cover_header_ImagePath">
					<xsl:call-template name="insertVariable">
						<xsl:with-param name="theVariableID" select="'Cover header'"/>
					</xsl:call-template>
				</xsl:variable>
				<!--fo:external-graphic src="url({concat($artworkPrefix, '/', $cover_header_ImagePath)})"/-->				
				<fo:external-graphic xsl:use-attribute-sets="__frontmatter__cover__image" src="url({$cover_header_ImagePath})"/>
			</fo:block>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertFrontMatterFirstFooter">
		<fo:static-content flow-name="first-frontmatter-footer">
			<fo:block xsl:use-attribute-sets="__frontmatter__first__footer">
				<xsl:variable name="cover_footer_ImagePath">
					<xsl:call-template name="insertVariable">
						<xsl:with-param name="theVariableID" select="'Cover footer'"/>
					</xsl:call-template>
				</xsl:variable>
				<!--fo:external-graphic src="url({concat($artworkPrefix, '/', $cover_footer_ImagePath)})"/-->
				<!-- <fo:external-graphic src="url({$cover_footer_ImagePath})"/> -->
			</fo:block>   
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertFrontMatterLastHeader">
		<fo:static-content flow-name="last-frontmatter-header">
			<fo:block xsl:use-attribute-sets="__frontmatter__last__header">
				<fo:block><xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/></fo:block>
				<fo:block><fo:leader leader-pattern="rule" leader-length="165mm"/></fo:block>     
			</fo:block>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertFrontMatterLastFooter">
		<fo:static-content flow-name="last-frontmatter-footer">
			<fo:block xsl:use-attribute-sets="__frontmatter__last__footer">
				<fo:block><fo:leader leader-pattern="rule" leader-length="165mm"/></fo:block>
				<fo:block><xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/></fo:block>
				<fo:block><fo:page-number/></fo:block>				
			</fo:block>
		</fo:static-content>
	</xsl:template>


	<xsl:template name="insertFrontMatterOddHeader">
		<fo:static-content flow-name="odd-frontmatter-header">     
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__headline__picture">
								<xsl:variable name="headline_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Headline'"/>
									</xsl:call-template>
								</xsl:variable>			
								<fo:external-graphic src="url({$headline_ImagePath})"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell  xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__header">
								<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertFrontMatterOddIndent">
		<fo:static-content flow-name="odd-front-matter-indent">
			<fo:block>
				<xsl:variable name="right_indent_ImagePath">
					<xsl:call-template name="insertVariable">
						<xsl:with-param name="theVariableID" select="'Right indent'"/>
					</xsl:call-template>
				</xsl:variable>
				<!--fo:external-graphic src="url({concat($artworkPrefix, '/', $cover_footer_ImagePath)})"/-->
				<!--fo:external-graphic src="url({$right_indent_ImagePath})"/-->
			</fo:block>   
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertFrontMatterEvenHeader">
		<fo:static-content flow-name="even-frontmatter-header">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__headline__picture">
								<xsl:variable name="headline_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Headline'"/>
									</xsl:call-template>
								</xsl:variable>			
								<fo:external-graphic src="url({$headline_ImagePath})"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell  xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__header">
								<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertFrontMatterOddFooter">
		<fo:static-content flow-name="odd-frontmatter-footer">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__footer">
								<xsl:call-template name="insertVariable">
									<xsl:with-param name="theVariableID" select="'Body odd footer'"/>
									<xsl:with-param name="theParameters">
										<year>
											<xsl:choose>
												<xsl:when test="//*[contains(@class, ' topic/copyryear ')]/@year">
													<xsl:value-of select="//*[contains(@class, ' topic/copyryear ')]/@year"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:variable name="default_year">
														<xsl:call-template name="insertVariable">
															<xsl:with-param name="theVariableID" select="'Default Year'"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:value-of select="$default_year"/>
												</xsl:otherwise>
											</xsl:choose>							
										</year>
										<copyrholder>
											<xsl:choose>
												<xsl:when test="//*[contains(@class, ' topic/copyrholder ')]/text()">
													<xsl:value-of select="//*[contains(@class, ' topic/copyrholder ')]/text()"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:variable name="default_copyrholder">
														<xsl:call-template name="insertVariable">
															<xsl:with-param name="theVariableID" select="'Default Copyrholder'"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:value-of select="$default_copyrholder"/>
												</xsl:otherwise>
											</xsl:choose>														
										</copyrholder>
									</xsl:with-param>
								</xsl:call-template>
							</fo:block>       
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__slogan__odd__picture">
								<xsl:variable name="slogan_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Slogan'"/>
									</xsl:call-template>
								</xsl:variable>			
								<!--<fo:external-graphic src="url({$slogan_ImagePath})"/>-->
							</fo:block>
							<fo:block  xsl:use-attribute-sets="__slogan__odd__picture"><fo:page-number/></fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertFrontMatterEvenFooter">
		<fo:static-content flow-name="even-frontmatter-footer">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer__picture">
								<xsl:variable name="even_footer_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Even footer'"/>
									</xsl:call-template>
								</xsl:variable>			
								<!--<fo:external-graphic src="url({$even_footer_ImagePath})"/>-->

							</fo:block>
							<fo:block  xsl:use-attribute-sets="__body__even__footer__picture"><fo:page-number/></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer">
								<fo:block><xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/></fo:block>               
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertBodyOddHeader">   
		<fo:static-content flow-name="odd-body-header">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__headline__picture">
								<xsl:variable name="headline_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Headline'"/>
									</xsl:call-template>
								</xsl:variable>			
								<fo:external-graphic src="url({$headline_ImagePath})"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell  xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__header">
								<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertBodyEvenHeader">
		<fo:static-content flow-name="even-body-header">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__headline__picture">
								<xsl:variable name="headline_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Headline'"/>
									</xsl:call-template>
								</xsl:variable>			
								<fo:external-graphic src="url({$headline_ImagePath})"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell  xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__header">
								<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertBodyOddIndent">
		<fo:static-content flow-name="odd-body-indent">
			<fo:block>
				<xsl:variable name="right_indent_ImagePath">
					<xsl:call-template name="insertVariable">
						<xsl:with-param name="theVariableID" select="'Right indent'"/>
					</xsl:call-template>
				</xsl:variable>
				<!--fo:external-graphic src="url({concat($artworkPrefix, '/', $cover_footer_ImagePath)})"/-->
				<!--fo:external-graphic src="url({$right_indent_ImagePath})"/-->
			</fo:block>   
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertBodyOddFooter">
		<fo:static-content flow-name="odd-body-footer">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__footer">
								<xsl:call-template name="insertVariable">
									<xsl:with-param name="theVariableID" select="'Body odd footer'"/>
									<xsl:with-param name="theParameters">
										<year>
											<xsl:choose>
												<xsl:when test="//*[contains(@class, ' topic/copyryear ')]/@year">
													<xsl:value-of select="//*[contains(@class, ' topic/copyryear ')]/@year"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:variable name="default_year">
														<xsl:call-template name="insertVariable">
															<xsl:with-param name="theVariableID" select="'Default Year'"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:value-of select="$default_year"/>
												</xsl:otherwise>
											</xsl:choose>							
										</year>
										<copyrholder>
											<xsl:choose>
												<xsl:when test="//*[contains(@class, ' topic/copyrholder ')]/text()">
													<xsl:value-of select="//*[contains(@class, ' topic/copyrholder ')]/text()"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:variable name="default_copyrholder">
														<xsl:call-template name="insertVariable">
															<xsl:with-param name="theVariableID" select="'Default Copyrholder'"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:value-of select="$default_copyrholder"/>
												</xsl:otherwise>
											</xsl:choose>														
										</copyrholder>
									</xsl:with-param>
								</xsl:call-template>
							</fo:block>       
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__slogan__odd__picture">
								<xsl:variable name="slogan_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Slogan'"/>
									</xsl:call-template>
								</xsl:variable>			
								<!--<fo:external-graphic src="url({$slogan_ImagePath})"/>-->
							</fo:block>
							<fo:block  xsl:use-attribute-sets="__slogan__odd__picture"><fo:page-number/></fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>


	<xsl:template name="insertBodyEvenFooter">
		<fo:static-content flow-name="even-body-footer">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer__picture">
								<xsl:variable name="even_footer_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Even footer'"/>
									</xsl:call-template>
								</xsl:variable>			
								<!--<fo:external-graphic src="url({$even_footer_ImagePath})"/>-->

							</fo:block>
							<fo:block  xsl:use-attribute-sets="__body__even__footer__picture"><fo:page-number/></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer">
								<fo:block><xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/></fo:block>               
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>       
		</fo:static-content>
	</xsl:template>

	<!--static-content.xsl-->
	<!--TOC-->

	<xsl:template name="insertTocOddHeader">
		<fo:static-content flow-name="odd-toc-header">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__headline__picture">
								<xsl:variable name="headline_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Headline'"/>
									</xsl:call-template>
								</xsl:variable>			
								<fo:external-graphic src="url({$headline_ImagePath})"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell  xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__header">
								<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertTocEvenHeader">
		<fo:static-content flow-name="even-toc-header">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__headline__picture">
								<xsl:variable name="headline_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Headline'"/>
									</xsl:call-template>
								</xsl:variable>			
								<fo:external-graphic src="url({$headline_ImagePath})"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell  xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__header">
								<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertTocOddFooter">
		<fo:static-content flow-name="odd-toc-footer">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="__headline__cell">
							<fo:block xsl:use-attribute-sets="__body__odd__footer">
								<xsl:call-template name="insertVariable">
									<xsl:with-param name="theVariableID" select="'Body odd footer'"/>
									<xsl:with-param name="theParameters">
										<year>
											<xsl:choose>
												<xsl:when test="//*[contains(@class, ' topic/copyryear ')]/@year">
													<xsl:value-of select="//*[contains(@class, ' topic/copyryear ')]/@year"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:variable name="default_year">
														<xsl:call-template name="insertVariable">
															<xsl:with-param name="theVariableID" select="'Default Year'"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:value-of select="$default_year"/>
												</xsl:otherwise>
											</xsl:choose>							
										</year>
										<copyrholder>
											<xsl:choose>
												<xsl:when test="//*[contains(@class, ' topic/copyrholder ')]/text()">
													<xsl:value-of select="//*[contains(@class, ' topic/copyrholder ')]/text()"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:variable name="default_copyrholder">
														<xsl:call-template name="insertVariable">
															<xsl:with-param name="theVariableID" select="'Default Copyrholder'"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:value-of select="$default_copyrholder"/>
												</xsl:otherwise>
											</xsl:choose>														
										</copyrholder>
									</xsl:with-param>
								</xsl:call-template>
							</fo:block>       
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__slogan__odd__picture">
								<xsl:variable name="slogan_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Slogan'"/>
									</xsl:call-template>
								</xsl:variable>			
								<!--<fo:external-graphic src="url({$slogan_ImagePath})"/>-->
							</fo:block>
							<fo:block  xsl:use-attribute-sets="__slogan__odd__picture"><fo:page-number/></fo:block>
						</fo:table-cell>
					</fo:table-row>     
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertTocEvenFooter">
		<fo:static-content flow-name="even-toc-footer">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer__picture">
								<xsl:variable name="even_footer_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Even footer'"/>
									</xsl:call-template>
								</xsl:variable>			
								<!--<fo:external-graphic src="url({$even_footer_ImagePath})"/>-->

							</fo:block>
							<fo:block  xsl:use-attribute-sets="__body__even__footer__picture"><fo:page-number/></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer">
								<fo:block><xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/></fo:block>               
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertTocOddIndent">
		<fo:static-content flow-name="odd-toc-indent">
			<fo:block>
				<xsl:variable name="right_indent_ImagePath">
					<xsl:call-template name="insertVariable">
						<xsl:with-param name="theVariableID" select="'Right indent'"/>
					</xsl:call-template>
				</xsl:variable>
				<!--fo:external-graphic src="url({$right_indent_ImagePath})"/-->
			</fo:block>   
		</fo:static-content>
	</xsl:template>

	<!--Index-->

	<xsl:template name="insertIndexOddHeader">
		<fo:static-content flow-name="odd-index-header">
			<fo:block xsl:use-attribute-sets="__index__odd__header">
				<fo:block><xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/></fo:block>
				<fo:block><fo:leader leader-pattern="rule" leader-length="165mm"/></fo:block>                
			</fo:block>
		</fo:static-content>

	</xsl:template>

	<xsl:template name="insertIndexEvenHeader">
		<fo:static-content flow-name="even-index-header">
			<fo:block xsl:use-attribute-sets="__index__even__header">
				<fo:block><xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/></fo:block>
				<fo:block><fo:leader leader-pattern="rule" leader-length="165mm"/></fo:block>                
			</fo:block>
		</fo:static-content>

	</xsl:template>

	<xsl:template name="insertIndexOddFooter">
		<fo:static-content flow-name="odd-index-footer">
			<fo:block xsl:use-attribute-sets="__index__odd__footer">
				<fo:block><fo:leader leader-pattern="rule" leader-length="165mm"/></fo:block>
				<fo:block>
					<xsl:call-template name="insertVariable">
						<xsl:with-param name="theVariableID" select="'Index odd footer'"/>
						<xsl:with-param name="theParameters">
							<year>
								<xsl:choose>
									<xsl:when test="//*[contains(@class, ' topic/copyryear ')]/@year">
										<xsl:value-of select="//*[contains(@class, ' topic/copyryear ')]/@year"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="default_year">
											<xsl:call-template name="insertVariable">
												<xsl:with-param name="theVariableID" select="'Default Year'"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="$default_year"/>
									</xsl:otherwise>
								</xsl:choose>							
							</year>
							<copyrholder>
								<xsl:choose>
									<xsl:when test="//*[contains(@class, ' topic/copyrholder ')]/text()">
										<xsl:value-of select="//*[contains(@class, ' topic/copyrholder ')]/text()"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="default_copyrholder">
											<xsl:call-template name="insertVariable">
												<xsl:with-param name="theVariableID" select="'Default Copyrholder'"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="$default_copyrholder"/>
									</xsl:otherwise>
								</xsl:choose>															
							</copyrholder>
						</xsl:with-param>
					</xsl:call-template>
				</fo:block>				
				<fo:block><fo:page-number/></fo:block>  
			</fo:block>              
		</fo:static-content>
	</xsl:template>

	<xsl:template name="insertIndexEvenFooter">
		<fo:static-content flow-name="even-index-footer">
			<fo:table>
				<fo:table-body> 
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer__picture">
								<xsl:variable name="even_footer_ImagePath">
									<xsl:call-template name="insertVariable">
										<xsl:with-param name="theVariableID" select="'Even footer'"/>
									</xsl:call-template>
								</xsl:variable>			
								<!--<fo:external-graphic src="url({$even_footer_ImagePath})"/>-->

							</fo:block>
							<fo:block  xsl:use-attribute-sets="__body__even__footer__picture"><fo:page-number/></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="__body__even__footer">
								<fo:block><xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/></fo:block>               
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>    
		</fo:static-content>
	</xsl:template>

	<!--links.xsl--> 
	<xsl:template match="*[contains(@class, ' topic/li ')]" mode="retrieveReferenceTitle">
		<xsl:choose>
			<xsl:when test="*[contains(@otherprops, 'DocList')]">
				<xsl:apply-templates select="*[not(contains(@class,' topic/desc '))] | text()" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="insertVariable">
					<xsl:with-param name="theVariableID" select="'List item'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>	          
	</xsl:template>   

	<xsl:template match="*[contains(@class, ' topic/fig ')][*[contains(@class, ' topic/title ')]]" mode="retrieveReferenceTitle">
		<xsl:call-template name="insertVariable">
			<xsl:with-param name="theVariableID" select="'Figure'"/>
			<xsl:with-param name="theParameters">
				<number>
					<xsl:value-of select="count(preceding::*[contains(@class, ' topic/fig ')][child::*[contains(@class, ' topic/title ')]]) + 1"/>
				</number>
				<!--number>
                        <xsl:number level="any" count="*[contains(@class, ' topic/fig ')][child::*[contains(@class, ' topic/title ')]]" from="/"/>
                </number-->
				<!--title>
                    <xsl:apply-templates select="*[contains(@class, ' topic/title ')]" mode="insert-text"/>
                </title-->
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="*[contains(@class,' topic/xref ')]">
		<fo:inline>
			<xsl:call-template name="commonattributes"/>
		</fo:inline>

		<xsl:variable name="destination" select="opentopic-func:getDestinationId(@href)"/>
		<xsl:variable name="element" select="key('key_anchor',$destination)[1]"/>

		<xsl:variable name="referenceTitle">
			<xsl:call-template name="insertReferenceTitle">
				<xsl:with-param name="href" select="@href"/>
				<xsl:with-param name="titlePrefix" select="''"/>
				<xsl:with-param name="destination" select="$destination"/>
				<xsl:with-param name="element" select="$element"/>
			</xsl:call-template>
		</xsl:variable>

		<fo:basic-link xsl:use-attribute-sets="xref">
			<xsl:call-template name="buildBasicLinkDestination">
				<xsl:with-param name="scope" select="@scope"/>
				<xsl:with-param name="href" select="@href"/>
			</xsl:call-template>

			<xsl:choose>
				<xsl:when test="not(@scope = 'external') and not($referenceTitle = '')">
					<xsl:copy-of select="$referenceTitle"/>
					<!--xsl:apply-templates select="*[not(contains(@class,' topic/desc '))] | text()" /-->
				</xsl:when>
				<xsl:when test="not(@scope = 'external')">
					<xsl:call-template name="insertPageNumberCitation">
						<xsl:with-param name="isTitleEmpty" select="'yes'"/>
						<xsl:with-param name="destination" select="$destination"/>
						<xsl:with-param name="element" select="$element"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="*[not(contains(@class,' topic/desc '))] | text()">
							<xsl:apply-templates select="*[not(contains(@class,' topic/desc '))] | text()" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@href"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</fo:basic-link>

		<!--
				Disable because of the CQ#8102 bug
				<xsl:if test="*[contains(@class,' topic/desc ')]">
					<xsl:call-template name="insertLinkDesc"/>
				</xsl:if>
		-->

		<!--Link processing for Documentation list. Edited by Oleg Alekseev-->
		<!--xsl:if test="not(@scope = 'external') and not($referenceTitle = '') and not($element[contains(@class, ' topic/fn ')])"-->
		<xsl:if test="not(@scope = 'external') and not($referenceTitle = '') and not($element[contains(@class, ' topic/fn ')]) and not($element[contains(@class, ' topic/li ')] and $element[contains(@otherprops, 'DocList')])">
			<!-- SourceForge bug 1880097: should not include page number when xref includes author specified text -->
			<xsl:if test="not(processing-instruction()[name()='ditaot'][.='usertext'])">
				<xsl:call-template name="insertPageNumberCitation">
					<xsl:with-param name="destination" select="$destination"/>
					<xsl:with-param name="element" select="$element"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>

	</xsl:template>

	<!--Tables. Edited by Oleg Alekseev-->   

	<xsl:template match="*[contains(@class, ' topic/tgroup ')]" name="tgroup">
		<xsl:if test="not(@cols)">
			<xsl:message terminate="yes">
				<xsl:text>ERROR: Number of columns must be specified.</xsl:text>
			</xsl:message>
		</xsl:if>

		<xsl:variable name="colspecs">
			<xsl:call-template name="generate.colgroup">
				<xsl:with-param name="cols" select="@cols"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="scale">
			<xsl:call-template name="getTableScale"/>
		</xsl:variable>

		<xsl:variable name="table">
			<fo:table xsl:use-attribute-sets="table.tgroup">
				<xsl:call-template name="commonattributes"/>

				<xsl:call-template name="displayAtts">
					<xsl:with-param name="element" select=".."/>
				</xsl:call-template>

				<xsl:if test="(parent::*/@pgwide) = '1'">
					<xsl:attribute name="start-indent">25</xsl:attribute>
					<xsl:attribute name="end-indent">0</xsl:attribute>
					<xsl:attribute name="width">auto</xsl:attribute>
				</xsl:if>

				<xsl:copy-of select="$colspecs"/>

				<xsl:apply-templates select="*[contains(@class, ' topic/thead ')]"/>
				<xsl:apply-templates select="*[contains(@class, ' topic/tfoot ')]"/>
				<xsl:apply-templates select="*[contains(@class, ' topic/tbody ')]"/>
			</fo:table>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="not($scale = '')">
				<xsl:apply-templates select="exsl:node-set($table)" mode="setTableEntriesScale"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="$table"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>   

	<!--Thise temlate is itended for deleting #xA symbol (end of row) at start of text node (if it is there). Created by Oleg Alekseev-->
	<xsl:template match="text()">
		<xsl:choose>
			<xsl:when test="starts-with(., '&#xA;')">
				<xsl:value-of select="substring-after(.,'&#xA;')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

    <xsl:template name="placeNoteContent">
        <xsl:apply-templates select="." mode="placeNoteContent"/>
    </xsl:template>
    <xsl:template match="*" mode="placeNoteContent">
        <fo:block xsl:use-attribute-sets="note">
            <xsl:call-template name="commonattributes"/>
            <fo:inline xsl:use-attribute-sets="note__label">
                <xsl:choose>
                    <xsl:when test="@type='note' or not(@type)">
                        <fo:inline xsl:use-attribute-sets="note__label__note">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Note'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='tip'">
                        <fo:inline xsl:use-attribute-sets="note__label__tip">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Tip'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='fastpath'">
                        <fo:inline xsl:use-attribute-sets="note__label__fastpath">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Fastpath'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='restriction'">
                        <fo:inline xsl:use-attribute-sets="note__label__restriction">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Restriction'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='important'">
                        <fo:inline xsl:use-attribute-sets="note__label__important">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Important'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='remember'">
                        <fo:inline xsl:use-attribute-sets="note__label__remember">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Remember'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='attention'">
                        <fo:inline xsl:use-attribute-sets="note__label__attention">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Attention'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='caution'">
                        <fo:inline xsl:use-attribute-sets="note__label__caution">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Caution'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='danger'">
                        <fo:inline xsl:use-attribute-sets="note__label__danger">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Danger'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='other'">
                        <fo:inline xsl:use-attribute-sets="note__label__other">
                            <xsl:choose>
                                <xsl:when test="@othertype">
                                    <xsl:value-of select="@othertype"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="@type"/>
                                    <xsl:text>]</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:inline>
                    </xsl:when>
                </xsl:choose>
                <xsl:text>: </xsl:text>
            </fo:inline>
            <xsl:text>  </xsl:text>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class,' topic/note ')]">
        <xsl:variable name="noteType">
            <xsl:choose>
                <xsl:when test="@type = 'other' and @othertype">
                    <xsl:value-of select="@othertype"/>
                </xsl:when>
                <xsl:when test="@type">
                    <xsl:value-of select="@type"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'note'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="noteImagePath">
            <xsl:call-template name="insertVariable">
                <xsl:with-param name="theVariableID" select="concat($noteType, ' Note Image Path')"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($noteImagePath = '')">
                <fo:table xsl:use-attribute-sets="note__table">
                    <fo:table-column xsl:use-attribute-sets="note__image__column"/>
                    <fo:table-column xsl:use-attribute-sets="note__text__column"/>
                    <fo:table-body>
                        <fo:table-row>
                                <fo:table-cell xsl:use-attribute-sets="note__image__entry">
                                    <fo:block>
                                        <fo:external-graphic src="url({concat($artworkPrefix, $noteImagePath)})" xsl:use-attribute-sets="image"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="note__text__entry">
                                    <xsl:call-template name="placeNoteContent"/>
                                </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="placeNoteContent"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:variable name="topicTitle.numLevel">3</xsl:variable>
    <xsl:template name="getTitle">
      <xsl:variable name="titleNumber">
         <xsl:if test="parent::*[contains(@class,'topic/topic')]">
            <xsl:call-template name="getTitleNumber"/>
         </xsl:if>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="@spectitle">
            <xsl:value-of select="@spectitle"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$titleNumber"/>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="getTitleNumber">
      <xsl:variable name="level" select="ancestor::*[contains(@class,' topic/topic ')]"/>
      <xsl:choose>
         <xsl:when test="count($level)=1">
            <xsl:for-each select="$level">
               <xsl:value-of select="count(preceding-sibling::*[contains(@class,' topic/topic ')])+ 1"/>
<!--1111111111 -->      <xsl:text>.&#xA0;</xsl:text>   
            </xsl:for-each>
         </xsl:when>
         <xsl:when test="not(count($level) > $topicTitle.numLevel)">
            <xsl:number count="*[contains(@class,' topic/topic ')]" level="multiple" format="1.1"/>
<!--  222222222 -->      <xsl:text>&#xA0;</xsl:text>
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>
   
 </xsl:stylesheet>

