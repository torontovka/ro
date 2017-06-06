<%
dim menu_items, menu_item
set menu_items = server.createObject( "Scripting.Dictionary" )

menu_items.add "/Create-Website/Turn-Key-Solution", "Turn Key Solution"
menu_items.add "/Create-Website/Content-Management-System", "Content Management System"
menu_items.add "/Create-Website/Traffic-Management", "Traffic Management"
menu_items.add "/Create-Website/E-Commerce", "E-Commerce"
menu_items.add "/Create-Website/Portfolio", "Website Portfolio"

menu_items.add "/Promote-Website/Search-Engine-Optimization", "Search Engine Optimization"
menu_items.add "/Promote-Website/Pay-Per-Click", "Pay-Per-Click Marketing"
menu_items.add "/Promote-Website/Affiliate-Marketing", "Affiliate Marketing"
menu_items.add "/Promote-Website/Email-Marketing", "Email Marketing"
menu_items.add "/Promote-Website/Internet-Marketing-Research", "Internet Marketing Research"

menu_items.add "/Outsource-Work/Software-Development", "Software Developement"
menu_items.add "/Outsource-Work/IT-Project-Management", "IT Project Management"
menu_items.add "/Outsource-Work/Telemarketing", "Telemarketing"
menu_items.add "/Outsource-Work/Customer-Support", "Customer Support"
menu_items.add "/Outsource-Work/Business-Design", "Business Design"

'
if ( description = "" ) then
	description = "Roosoft Consulting is a Canadian company working in the IT and Internet industry for over 10 years helping businesses all over the World with their IT and Internet marketing needs."
end if
'
if ( keywords = "" ) then
	keywords = "Create Website, Promote Website, Print Design, Web Hosting, Outsource Development, Outsource Telemarketing, Outsource Support, Outsource IT, Project Management"
end if
'
dim meta_title
if ( title = "" ) then
	meta_title = "Roosoft Consulting &ndash; One Stop Internet Marketing Shop"
elseif ( isnull( title ) ) then
	meta_title = menu_items( active_page ) & " &ndash; Roosoft Consulting &ndash; One Stop Internet Marketing Shop"
else
	meta_title = title & " &ndash; Roosoft Consulting &ndash; One Stop Internet Marketing Shop"
end if
title = menu_items( active_page )
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

	<title><%= meta_title %></title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta http-equiv="Content-Language" content="en">

	<link href="/css/styles.css" rel="stylesheet" type="text/css">
	<link href="/css/iefix.css" rel="stylesheet" type="text/css">
	<link href="/css/lightbox.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="/lib/lightbox.js"></script>

	<meta name="keywords" content="<%= keywords %>">
	
	<meta name="description" content="<%= description %>">
	
	<meta name="verify-v1" content="Uwi9C+3BOWTQya86b7b5dDKv+P9IRMekXIrjCa9Pt8Q=" />

	<meta name="classification" content="IT Services, Web Design and Developement, IT Developement Outsousing, Internet Marketing, Telemarketing, Customer Support">

	<meta name="revisit-after" content="15 days">

	<!--script type="text/javascript" src="/lib/jquery-1.2.2.pack.js"></script-->
	<!--script type="text/javascript" src="/lib/animatedcollapse.js"></script-->

	<script type="text/javascript">
	
		function init ()
		{
			//animatedcollapse.init();
			
			var cachedImages = new Array();
			cachedImages[0] = new Image(140,76);
			cachedImages[0].src = "/images/button_getquote_off.png"; 
			cachedImages[1] = new Image(140,76);
			cachedImages[1].src = "/images/button_getquote_on.png"; 
			
			initLightbox();
		}
		
		function toggleButton ( button_action )
		{
			document.getElementById( "button-getquote" ).style.background = "url( /images/button_getquote_" + button_action + ".png )";
			//document.getElementById( "button-getquote-text" ).style.textDecoration = ( button_action == "on" ) ? "underline": "none";
		}
		
	</script>

</head>
<body onload="init();">

<div style="background: url( /images/bg_bottom.gif ) bottom repeat-x;">

<table class="page" align="center" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td style="height: 1px;"><img src="/images/clear.gif" width="1" height="1"></td>
</tr>
<tr>
	<td valign="top" align="center">
	
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px;">
		<tr>
			<td><img src="/images/clear.gif" alt="" width="5" height="1" border="0">
			
			</td><td><img src="/images/menu_div.gif"></td>
		
			<td class="clsMenuItem" nowrap><a href="/Company.asp">Company</a></td><td><img src="/images/menu_div.gif"></td>
		
			<td class="clsMenuItem" nowrap><a href="/Create-Website/Turn-Key-Solution.asp">Create Website</a></td><td><img src="/images/menu_div.gif"></td>
		
			<td class="clsMenuItem" nowrap><a href="/Promote-Website/Search-Engine-Optimization.asp">Promote Website</a></td><td><img src="/images/menu_div.gif"></td>
		
			<td class="clsMenuItem" nowrap><a href="/Outsource-Work/Software-Development.asp">Outsource Work</a></td><td><img src="/images/menu_div.gif"></td>
		
			<td class="clsMenuItem" nowrap><a href="/Outsource-Work/Business-Design.asp">Business Design</a></td><td><img src="/images/menu_div.gif"></td>
		
			<td class="clsMenuItem" nowrap><a href="/Hosting.asp">Hosting</a></td><td><img src="/images/menu_div.gif"></td>
		
			<td class="clsMenuItem" nowrap><a href="/Contacts.asp">Contacts</a></td><td><img src="/images/menu_div.gif"></td>
			
			<td><img src="/images/clear.gif" alt="" width="5" height="1" border="0"></td>
		
		</tr>
		</table>

		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding: 30px 25px 0px 25px;">
		<tr>
			<td><a href="/"><img src="/images/logo.gif" alt="Roosoft Consulting Ltd." width="273" height="55" border="0"></a></td>
			<td align="right"><img src="/images/telephone.gif" alt="" width="389" height="18" border="0"></td>
		</tr>
		</table>

		<p>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background: url( /images/top_block_bg.gif) top repeat-x;" id="promo">
		<tr>
			<td><img src="/images/top_block_left.gif" alt="" width="24" height="107" border="0"></td>
			<td width="33%"><img src="/images/promo-1.png" alt="" width="270" height="54" border="0"></td>
			<td><img src="/images/top_block_div.gif" alt="" width="3" height="107" border="0"></td>
			<td width="34%" style="padding-left: 10px;"><img src="/images/promo-2.png" alt="" width="281" height="54" border="0"></td>
			<td><img src="/images/top_block_div.gif" alt="" width="3" height="107" border="0"></td>
			<td width="33%" style="padding-left: 10px;"><img src="/images/promo-3.png" alt="" width="269" height="54" border="0"></td>
			<td><img src="/images/top_block_right.gif" alt="" width="24" height="107" border="0"></td>
		</tr>
		</table>