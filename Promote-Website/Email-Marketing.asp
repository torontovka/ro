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
	Do you communicate with your current and prospective clients?
	<p>
	If you sell products or offer services on your website and you know that your site sells for free-traffic (direct traffic and traffic generated from search engines), you can start bring in pre-paid traffic. What that means is you pay search engine a referral fee to forward you potential clients.
	<p>
	Email is a universal tool, which gives you a lot of communication options in variety of ways with respect to your target audience.
	<p>
	<ul>
		<li>Encourage returning visits to your website by publishing a newsletter</li>
		<li>Advertise your special deals and offers by sending electronic coupons</li>
		<li>Send reminders and notifications to your clients</li>
	</ul>
	
	<p>
	We help you to plan and organize effective Email Marketing campaigns, prepare content and properly assemble the Email, broadcast the message, and track the results.

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->