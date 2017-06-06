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
	
	<p>Having a storefront on the Web allows you to offer your products to anyone, anywhere, anytime.</p>
	<p>The Internet has revolutionized the whole concept of marketing and sales by eliminating the geographic and time-related barriers between the merchant and consumer. Now, without hiring a single new employee, you can receive and process orders from all over the world.</p>
	<p>Roosoft will set you up with a full-featured e-commerce store on your website using osCommerce.</p>
	<p>osCommerce - an advanced online ecommerce solution that offers a wide range of out-of-the-box features.It is available for free as an Open Source based solution released under the GNU (General Public License).</p>
	<p>You will have the ability to:</p>
	<ul>
		<li>Add unlimited products and images, plus catalog them into your own defined categories</li>
		<li>Access a built-in inventory stock counter so you can keep track of your store stock in real time</li>
		<li>Have on-line credit card transaction capabilities</li>
		<li>View all orders in a secure way</li>
	</ul>

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->