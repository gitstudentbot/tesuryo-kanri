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
		<fo:root font-size="11pt" font-family="IPA Gothic, IPAGothic, Segoe UI Symbol">
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
									<xsl:value-of select="Sales.U_329EF86EC8EC8534AD35E8EE04633B"/>
								</fo:block>
							</fo:inline-container>
							<fo:inline-container width="50%" text-align="right">
								<fo:block font-size="10pt">
									【手数料の徴収完了後２年間保存】
								</fo:block>
							</fo:inline-container>
						</fo:block>
						
						<fo:table table-layout="fixed" width="100%" border="1.5pt solid">
							<fo:table-column column-number="1" column-width="25%"/>
							<fo:table-column column-number="2" column-width="55%"/>
							<fo:table-column column-number="3" column-width="20%"/>
							<fo:table-body>
								<fo:table-row height="28mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base" border-bottom="1.5pt solid">
										<fo:block text-align="center">
											①支払者氏名または事業所名称
										</fo:block>
									</fo:table-cell>

									<fo:table-cell xsl:use-attribute-sets="cell-base" border-bottom="1.5pt solid">
										<fo:block text-align="center">
											②徴収年月日
										</fo:block>
									</fo:table-cell>

									<fo:table-cell xsl:use-attribute-sets="cell-base" border-bottom="1.5pt solid">
										<fo:block text-align="center">
											③手数料の種類
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

								<fo:table-row height="15mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">
                      <xsl:value-of select="Sales.P_Recruiter/Recruiter/Recruiter.P_Name"/>
										</fo:block>
									</fo:table-cell>
                  <!--徴収年月日の値をセルいっぱいに広げるためにjustifyで均等配置＋値が左寄りになってしまうため、セル内にインナーテーブルを配置-->
									<fo:table-cell xsl:use-attribute-sets="cell-base">
                    <fo:block>
                      <fo:table width="100%" table-layout="fixed">
                        <fo:table-body>
                          <fo:table-row>
                            <fo:table-cell text-align="center">
                              <fo:block>
                                <xsl:value-of select="substring-before(Sales.U_A4F5C54C3A05795D4317B51D7ACC30, '/')"/>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="center">
                              <fo:block>年</fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="center">
                              <fo:block>
                                <xsl:value-of select="substring-before(substring-after(Sales.U_A4F5C54C3A05795D4317B51D7ACC30, '/'), '/')"/>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="center">
                              <fo:block>月</fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="center">
                              <fo:block>
                                <xsl:value-of select="substring-after(substring-after(Sales.U_A4F5C54C3A05795D4317B51D7ACC30, '/'), '/')"/>
                              </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="center">
                              <fo:block>日</fo:block>
                            </fo:table-cell>
                          </fo:table-row>
                        </fo:table-body>
                      </fo:table>
                    </fo:block>
                  </fo:table-cell>
                  
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">
                      <xsl:value-of select="Sales.U_6DD59DAC8DFC0542DEC3E04A2ABC52"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

							    <fo:table-row height="15mm">
									<fo:table-cell number-columns-spanned="3">
										<fo:block>
											<fo:table table-layout="fixed">
												<fo:table-column column-number="1" column-width="proportional-column-width(25)"/>
												<fo:table-column column-number="2" column-width="proportional-column-width(14)"/>
												<fo:table-column column-number="3" column-width="proportional-column-width(17)"/>
												<fo:table-column column-number="4" column-width="proportional-column-width(17)"/>
												<fo:table-column column-number="5" column-width="proportional-column-width(27)"/>
                        <fo:table-body>
                         <fo:table-row height="15mm">
                            <fo:table-cell xsl:use-attribute-sets="left-less" number-columns-spanned="2">
                              <fo:block text-align="center">
                                ④手数料
                              </fo:block>
                            </fo:table-cell>
                            
                            <fo:table-cell xsl:use-attribute-sets="top-less" number-columns-spanned="2">
                              <fo:block text-align="center">
                                ⑤手数料の算出根拠
                              </fo:block>
                            </fo:table-cell>
                            
                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                備考
                              </fo:block>
                            </fo:table-cell>
                          </fo:table-row>

                          <fo:table-row height="15mm">
                            <fo:table-cell xsl:use-attribute-sets="left-less">
                              <fo:block text-align="center">
                                手数料額（※）
                              </fo:block>
                            </fo:table-cell>

                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                第二種特別加入
                              </fo:block>
                              <fo:block text-align="center">
                                保険料に係る手数料
                              </fo:block>
                            </fo:table-cell>

                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                賃金等
                              </fo:block>
                            </fo:table-cell>

                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                手数料割合等
                              </fo:block>
                            </fo:table-cell>

                            <fo:table-cell xsl:use-attribute-sets="top-less" number-rows-spanned="2">
                              <fo:block text-align="center">
                                <xsl:value-of select="Sales.U_3AF61B6DFFFE01E18FD96B4143A8CD"/>
                              </fo:block>
                            </fo:table-cell>
                          </fo:table-row>


                          <!--手数料額-->
                          <fo:table-row height="15mm">
                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                <xsl:value-of select="Sales.U_ED4B291DE09813D9B34598FC038559"/>
                              </fo:block>
                            </fo:table-cell>
                            <!--第二種特別加入手数料-->
                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                <xsl:value-of select="Sales.U_5C017FFB6B773724F088B6FC278A04"/>
                              </fo:block>
                            </fo:table-cell>
                            <!--賃金等-->
                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                <xsl:value-of select="Sales.U_14ADBECA24673733EF4B42296F1001"/>
                              </fo:block>
                            </fo:table-cell>
                            <!--手数料割合等-->
                            <fo:table-cell xsl:use-attribute-sets="top-less">
                              <fo:block text-align="center">
                                <xsl:value-of select="Sales.U_4235A759575918B9AE12FF0B5EB863"/>
                              </fo:block>
                            </fo:table-cell>

                            

                          </fo:table-row>
                        </fo:table-body>
											</fo:table>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						
						
					</fo:flow>
				</fo:page-sequence>
			</xsl:for-each>
		</fo:root>
	</xsl:template>



</xsl:stylesheet>
