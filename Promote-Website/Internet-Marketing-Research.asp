<%
option explicit

dim active_page
active_page = replace( request.serverVariables( "PATH_INFO" ), ".asp", "" )

dim keywords, description, title
title = null
keywords = "create website, design website, design logo, logo, design collateral, design corporate id, corporate identity, design banners, design ads, design business cards, print design, web design, photo design, video design, video production"
description = "Roosoft Consulting is a Canadian company working in the IT and Internet industry for over 10 years helping businesses all over the World with their IT and Internet marketing needs."
%>

<!--#include virtual="/include/header.inc.asp"-->

<!--#include virtual="/include/page-top.inc.asp"-->

	<h1><%= title %></h1>
	
	<p>
	Every strategy is based on carefully researched information. Our online research professionals will conduct any research your company needs done. We will help you get as much information as possible about your markets, competitors and their products and make sure that this information is relevant and reliable. We know how, we know where, and we will save you a lot of time and money providing quick and accurate results.
	<p>
	We will help you to analyze the acquired data and prove with strategic guidelines with respect to Internet Marketing. By using our research and analysis capabilities and expertise, your decision process will become much easier, safe and accurate.

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->