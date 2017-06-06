<%
option explicit

dim active_page
active_page = replace( request.serverVariables( "PATH_INFO" ), ".asp", "" )

dim keywords, description, title
title = null
keywords = "create website, design website, design logo, logo, design colleteral, design corporate id, corporate identity, design banners, design ads, design business cards, print design, web desing, photo design, video desing, video production"
description = "Roosoft Consulting is a Canadian company working in the IT and Internet industry for over 10 years helping businesses all over the World with their IT and Internet marketing needs."

dim web_sites
set web_sites = server.createObject( "Scripting.Dictionary" )

web_sites.add "autoshow",		    "Toyota Autoshow    |iPad App               |Saatchi & Saatchi      |2013|||Senior Developer"
web_sites.add "lexus",			    "Lexus.ca           |Lexus Canada           |Toyota Canada          |2013|||Lead Developer"
web_sites.add "tunerchallenge",		"Tuner Challenge	|Car Racing             |TPM Communications     |2012|||Lead Developer"
web_sites.add "hybridizer",		    "Hybridizer 		|Hybrid vehicles        |TPM Communications     |2011|||Lead Developer"
web_sites.add "camry",		        "Camry.ca           |Camry promo site       |Toyota Canada          |2011|||Senior Developer"
web_sites.add "corolla",		    "Corolla.ca         |Corolla promo site     |Toyota Canada          |2011|||Senior Developer"
web_sites.add "toyota",				"Toyota.ca		    |Toyota Canada          |Saatchi & Saatchi      |2011|||Senior Developer"
web_sites.add "egoist",		        "Egoistdesigner.com |Website                |Egoist Designer Lab    |2011|||Lead Developer"
web_sites.add "scion",		        "Scion.ca		    |Scion Canada		    |Toyota Canada          |2010|||Technical Lead"
web_sites.add "russiantix",			"RussianTix         |Online Store           |BableTix               |2010|||Lead Developer"
web_sites.add "babeltix",			"BabelTix           |Ticketing System       |BabelTix               |2010|||System Architect"
web_sites.add "baskin",			    "BaskinRobbins.ca   |Corp. website          |Baskin Robbins Canada  |2010|||Lead Developer"
web_sites.add "adbucks",		    "AdBucks		    |Social Network         |SourceWizz             |2010|||System Architect"
web_sites.add "health",			    "The Health Professional|                   |Antibex Software       |2010|||Architect"
web_sites.add "sourcewizz",			"SourceWizz			|iPhone Apps			|SourceWizz			    |2009|Daniel Fridman	|Kirill Berlin"
web_sites.add "m&m",				"Money&Mortgage		|Magazine				|Janna Morozova		    |2009|Daniel Fridman	|Alex Tsatskin"
web_sites.add "showonetickets",		"ShowOneTickets		|Online Store			|Torontovka Ltd.	    |2009|Daniel Fridman	|Edward Raizberg"
web_sites.add "shipwizz",			"ShipWizz			|Shipping Rates, API	|ShipWizz			    |2009|Daniel Fridman	    |Dmitry Ivanov"
web_sites.add "vadim&oksana",		"Wedding Page		|						|Oksana Morozov		    |2009|Daniel Fridman	    |Daniil Gromov"
web_sites.add "torontovka",			"Torontovka			|Community Portal		|Torontovka Ltd.	    |2008-2013|Daniel Fridman	|E. Raizberg, A. Mosin"
web_sites.add "biotec",				"Biotec				|Pharm. Manufacturing	|Uspeh Agency		    |2008|Alex Grizuk		|Rustam Shabaev"
web_sites.add "buy-your-car",		"BuyYourCar.ca		|Car Catalog			|First Class		    |2008|Alex Grizuk		|Alex Ergunov"
web_sites.add "eco-driver",			"Eco Driver			|Non-profit				|N/A				    |2008|Daniel Fridman	|Daniel Fridman"
web_sites.add "gagua",				"Gia Gagua			|Parody Theater			|Uspeh Agency		    |2008|Alex Grizuk		|Alex Ergunov"
web_sites.add "zverev",				"Sergey Zverev		|Singer					|Uspeh Agency		    |2008|Alex Grizuk		|Alex Ergunov"
web_sites.add "kovalev-2",			"Alex Kovalev		|Showman				|Uspeh Agency		    |2008|Alex Grizuk		|Alex Ergunov"
web_sites.add "katrin-vesna",		"DJ Katrin Vesna	|						|Uspeh Agency		    |2008|Alex Grizuk		|Alex Ergunov"
web_sites.add "churina",			"Alena Churina		|Singer					|Useph Agency		    |2008|Alex Grizuk		|Alex Ergunov"
web_sites.add "goman",				"Alex Goman			|Singer					|TVID Studio		    |2008|Boris Shemetov	|Rustam Shabaev"
web_sites.add "moiseev",			"Boris Moiseev		|Singer					|TVID Studio		    |2008|Anastazia			|Rustam Shabaev"
web_sites.add "premier-ministr",	"Prime-Minister		|Band					|TVID Studio		    |2008|Boris Shemetov	|Rustam Shabaev"
web_sites.add "alehno",				"Ruslan Alehno		|Singer					|TVID Studio		    |2008|Anastazia			|Rustam Shabaev"
web_sites.add "toppop",				"Toppop				|Showbiz News			|TVID Studio		    |2007|Boris Shemetov	|Rustam Shabaev"
web_sites.add "fbimusic",			"FBI Music			|Production				|TVID Studio		    |2006|Alex Grizuk		|Rustam Shabaev"
web_sites.add "uspeh",				"Uspeh				|PR/Marketing Agency	|Uspeh Agency		    |2007|Alex Grizuk		|Daniel Fridman"
web_sites.add "moiseev-show",		"Moiseev Show		|Promo site				|TVID Studio		    |2007|Anastazia			|Rustam Shabaev"
web_sites.add "caffe-studio",		"Caffe Studio		|Destribution			|Caffe Studio		    |2006|Ilya Saveliev		|Dmitry Mitya"
web_sites.add "city-hold-consult",	"City Hold Cosult	|Law Firm				|City Hold Consult	    |2006|Daniel Fridman	|Daniel Fridman"
web_sites.add "panaiotov",			"Alex Panaiotov		|Singer					|TVID Studio		    |2006|Alex Grizuk		|Rustam Shabaev"
web_sites.add "frid",				"Eugine Fridland	|Producer				|TVID Studio		    |2007|Boris Shemetov	|Rustam Shabaev"
web_sites.add "daniil-move",		"Daniil Move		|Recing					|TVID Studio		    |2006|Boris Shemetov	|Rustam Shabaev"
web_sites.add "gromova",			"Irina Gromova		|Real Estate			|Irina Gromova		    |2005|Daniel Fridman	|Daniel Fridman"
web_sites.add "dialog",				"Dialog				|Recording Studio		|TVID Studio		    |2005|Daniel Fridman	|Rustam Shabaev"
web_sites.add "oazis",				"OAZIS				|Non-profit				|TVID Studio		    |2005|Daniel Fridman	|Rustam Shabaev"
web_sites.add "rodina",				"Rodian Records		|Records Label			|TVID Studio		    |2005|Daniel Fridman	|Rustam Shabaev"
web_sites.add "asortie",			"A'Sortie			|Band					|TVID Studio		    |2005|Daniel Fridman	|Rustam Shabaev"
web_sites.add "sekret-uspeha",		"X-Factor Russia	|TV Show				|Freemantle Media	    |2006|Daniel Fridman	|Rustam Shabaev"
web_sites.add "armored",			"Armored Vehicals	|Manufact.				|Armored Vehicals	    |2004|Alex Romanoff		|Daniel Fridman"
%>

<!--#include virtual="/include/header.inc.asp"-->

<!--#include virtual="/include/page-top.inc.asp"-->

	<h1><%= title %></h1>

<%
dim i, port_item, port_key, port_item_attr
for each port_key in web_sites.keys

	port_item = split( web_sites.item( port_key ), "|" )

	for i = 0 to ubound( port_item )
		port_item(i) = replace( port_item(i), "	", "" )
	next
%>
	<div class="clsWebPortfolioItem">
<% if not InStr(port_key, "?") > 0 then %>
		<a href="/portfolio/web/full/<%= port_key %>.jpg" title="<%= port_item(0) %><% if ( port_item(1) <> "" ) then %> &ndash; <%= port_item(1) %><% end if %> (<%= port_item(3) %>)" rel="lightbox"><img src="/portfolio/web/preview/<%= port_key %>.jpg" alt="<%= port_item(0) %>" title="<%= port_item(0) %>" border="0" rel="lightbox"></a>
<% end if %>
		<div style="margin: 6px;">
			<div style="margin-bottom: 4px;"><span class="name"><%= port_item(0) %><% if ( port_item(1) <> "" ) then %> &ndash; <%= port_item(1) %><% end if %></span></div>
			<span class="property">Client:</span> <span class="value"><%= port_item(2) %></span>
			<!--br>
			<span class="property">Year:</span> <span class="value"><%= port_item(3) %></span-->
<% if port_item(4) <> "" then %>
			<br>
			<span class="property">Design:</span> <span class="value"><%= port_item(4) %></span>
<% end if %>
<% if port_item(5) <> "" then %>
			<br>
			<span class="property">Programming:</span> <span class="value"><%= port_item(5) %></span>
<% end if %>
<% if ubound( port_item ) = 6 then %>
			<br>
			<span class="property"><%= port_item(6) %>:</span> <span class="value">Daniil Gromov</span>
<% end if %>
		</div>
	</div>
<%
next %>

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->