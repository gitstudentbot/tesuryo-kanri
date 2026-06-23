<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:attribute-set name="cell-base">
	<xsl:attribute name="border">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="top-less">
	<xsl:attribute name="border-bottom">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-right">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="right-less">
	<xsl:attribute name="border-bottom">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-top">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="left-less">
	<xsl:attribute name="border-bottom">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-right">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="bot-less">
	<xsl:attribute name="border-top">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-right">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>



<!-- =========================================================== -->
<!-- Root                                                        -->
<!-- =========================================================== -->
	<xsl:template match="Sales">
		<fo:root font-size="9pt" font-family="IPA Gothic, IPAGothic, Segoe UI Symbol">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-width="297mm" page-height="210mm"
					margin-top="5mm" margin-bottom="5mm" margin-left="10mm" margin-right="10mm">
					<fo:region-body margin-top="50mm" margin-bottom="5mm" margin-left="10mm" margin-right="10mm"/>
					<fo:region-before extent="40mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<xsl:for-each select="Item">
				<fo:page-sequence master-reference="A4">
					<!--ヘッダー header-->
					<fo:static-content flow-name="xsl-region-before">
						<fo:block text-align="center" font-size="24pt" margin-top="25mm">手 数 料 管 理 簿</fo:block>
						<!--logo-->
						<fo:block-container absolute-position="absolute">
							<fo:block text-align="right" margin-right="2mm">
								<fo:external-graphic src="logo.png" content-height="scale-down-to-fit"
								content-width="scale-down-to-fit" height="20mm" width="50mm"/>
							</fo:block>
						</fo:block-container>
					</fo:static-content>

					<fo:flow flow-name="xsl-region-body">
						<fo:block space-after="2mm">
							<fo:inline-container width="50%" text-align="left">
								<fo:block font-size="10pt">
									何の期間？？
								</fo:block>
							</fo:inline-container>
							<fo:inline-container width="50%" text-align="right">
								<fo:block font-size="10pt">
									【手数料の徴収完了後２年間保存】
								</fo:block>
							</fo:inline-container>
						</fo:block>
						
						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-number="1" column-width="25%"/>
							<fo:table-column column-number="2" column-width="55%"/>
							<fo:table-column column-number="3" column-width="20%"/>
							<fo:table-body>
								<fo:table-row height="28mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center" font-size="11pt">
											①支払者氏名または事業所名称
										</fo:block>
									</fo:table-cell>

									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center" font-size="11pt">
											②徴収年月日
										</fo:block>
									</fo:table-cell>

									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center" font-size="11pt">
											③手数料の種類
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

								<fo:table-row height="15mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">

										</fo:block>
									</fo:table-cell>

									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">

										</fo:block>
									</fo:table-cell>

									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">

										</fo:block>
									</fo:table-cell>
								</fo:table-row>

								<fo:table-row height="15mm">
									<fo-table-cell number-columns-spanned="3">
										<fo:block>
											<fo:table table-layout="fixed">
												<fo:table-column column-number="1" column-width="proportional-column-widht(25)"/>
												<fo:table-column column-number="2" column-width="proportional-column-width(10)"/>
												<fo:table-column column-number="3" column-width="proportional-column-width(15)"/>
												<fo:table-column column-number="4" column-width="proportional-column-width(15)"/>
												<fo:table-column column-number="5" column-width="proportional-column-width()"/>
											</fo:table>
										</fo:block>
									</fo-table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						
						
					</fo:flow>
				</fo:page-sequence>
			</xsl:for-each>
		</fo:root>
	</xsl:template>



</xsl:stylesheet>
