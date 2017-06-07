<%
option explicit

dim active_page : active_page = ""

dim keywords, description, title
keywords = "online presence, promote website, internet marketing, targeted traffic, inexpensive telemarketing, customer support, business design, project management"
description = "Roosoft Consulting is a Canadian company working in the Internet and IT industry for over 10 years helping businesses all over the World with their IT and Internet marketing needs."
title = "Company"

dim clients
set clients = server.createObject( "Scripting.Dictionary" )

clients.add "rbc",			"RBC Capital Markets	|Online ForEx Trading			|Developement"
clients.add "gfs",			"Gordon Food Services	|Price Maintenance System		|Developement"
clients.add "bea",			"BEA Systems			|WebLogic Consulting			|Instalation, trainging"
clients.add "tvid",			"TVID Studio			|Web App. Developement			|Project management"
clients.add "kmart",		"K-Mart					|Security System Integration	|Developement"
clients.add "cryptologic",	"Cryptologic Inc.		|Web/Casino Interface			|Design, developement"
'clients.add "connect-tv",	"ConnectTV				|BestRussianTV.com				|Web developement"
'clients.add "biotec",		"Biotec					|Online Destribution Catalog	|Development"
'clients.add "anx",			"Antibex Software		|Universal Scheduler			|Design"
%>

<!--#include virtual="/include/header.inc.asp"-->

<!--#include virtual="/include/page-top.inc.asp"-->
<!-- mosin git test -->
	<h1>Company</h1>
	
	<p>
	Roosoft Consulting is a Canadian company working in the IT and Internet industry since 1998, helping businesses all over the World with their IT and Internet marketing needs.
	<p>
	We are dedicated to providing excellence in running technology and media reach projects. Our goal is to give your business what it needs to prosper.
	
	<p>
	<h3>What we can do for your business</h3>

	<ul>
		<li>Create outstanding Online Presence</li>
		<li>Promote website and drive Targeted Traffic</li>
		<li>Plan and execute Internet Marketing campaign</li>
		<li>Spearhead marketing initiative with inexpensive Telemarketing</li>
		<li>Enhance Customer Relationship with professional Customer Support</li>
		<li>Take care of all your Business Design needs (Corporate ID, Collateral, Ads, Banners)</li>
		<li>Enhance your in-house development team with professional Project Management</li>
		<li>Develop software products as per your vision</li>
		<li>Re-engineer, Document and Maintain current software</li>
	</ul>
		
	<p>
	<br>
	<h2>Clients</h2>
	<br>
<%
dim i, client_item, client_key, client_attr
for each client_key in clients.keys
	
	client_item = split( clients.item( client_key ), "|" )
	
	for i = 0 to ubound( client_item )
		client_item(i) = replace( client_item(i), "	", "" )
	next
%>
	<div class="clsClientProject">
		<div><img src="/portfolio/clients/<%= client_key %>.gif" alt="<%= client_item(0) %>" title="<%= client_item(0) %>" border="0"></div>
		<span class="name"><%= client_item(0) %></span>
		<br>
		<span class="project"><%= client_item(1) %></span>
		<br>
		<span class="project"><%= client_item(2) %></span>					
	</div>
<%
next %>

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->