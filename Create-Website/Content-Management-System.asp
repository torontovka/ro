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
	Once you happy with your design, we offer you several options on making that website go life.
	<p>
	There are several free CMS systems that are available out there. They are fairly easy to put together and they are relatively intuitive to administer. We can set it up for you no problem. We use Bitrix, WordPress, Jomala, but our technical expertise allows us to set up websites on any CMS of your choice.
	<p>
	We have developed a proprietary custom Content Management System that we adjust to your particular need and needs of your business. This is a little bit more expensive than other options, but it's the most flexible for you. You can actually tell us how you want the site administration process to work. And we will do it your way. Of course, we always tell you what are the best practices, and what processes work better.
	<p>
	We also specialize in building complex web applications that allow you to run a sophisticated online business. Be it an online store with electronic payments by credit cards and PayPal, an interactive client data driven application, a lead management system or any other system that you your business may need. We will leverage the business process systems you already have like CRM, LMS, and others to coexist with your new website. We develop web applications to run on WebSphere and WebLogic application servers written in Java, .Net applications in C# and ASP.Net to run on a Windows server and PHP application to run on any Unix or Linux server.

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->