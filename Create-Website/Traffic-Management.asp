<%
option explicit

dim active_page
active_page = replace( request.serverVariables( "PATH_INFO" ), ".asp", "" )

dim keywords, description, title
title = null
keywords = "create website, design website, design logo, logo, design colleteral, design corporate id, corporate identity, design banners, design ads, design business cards, print design, web desing, photo design, video desing, video production"
description = "Roosoft Consulting is a Canadian company working in the IT and Internet industry for over 10 years helping businesses all over the World with their IT and Internet marketing needs."
%>

<!--#include virtual="/include/header.inc.asp"-->

<!--#include virtual="/include/page-top.inc.asp"-->

	<h1><%= title %></h1>
	
	<p>
	Once your site is up and running and the traffic is flowing you'll want to know who are the visitors of your website. We'll set up for you an account with a great traffic management tool called Google Analytics, kindly provided by Google. We'll give you an overview of the tool and help you star managing your traffic streams.

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->