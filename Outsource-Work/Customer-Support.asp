<%
option explicit

dim active_page
active_page = replace( request.serverVariables( "PATH_INFO" ), ".asp", "" )

dim keywords, description, title
title = null
keywords = "software solution, customer care, customer acquisition, representatives, inbound call centers, customer services, customer support"
description = "Roosoft Consulting is a Canadian company working in the IT and Internet industry for over 10 years helping businesses all over the World with their IT and Internet marketing needs."
%>

<!--#include virtual="/include/header.inc.asp"-->

<!--#include virtual="/include/page-top.inc.asp"-->

	<h1><%= title %></h1>
	
	<p>
	We use a high-end software solution that helps our Representatives continuously improve customer care and customer acquisition skills. Many of our clients use our Quality Assurance program to monitor activity and make real-time changes to their applications.
	<p>
	Such unique options include Real Time Digital recordings of data and voice captured and forwarded randomly and sent to our Clients via email or secured FTP.
	<p>
	We develop evaluation forms with our clients to ensure we are rating your service representatives on all pertinent criteria during customer contact. Keeping abreast of the trends and tendencies that become apparent through the use of our program ensures we are running a highly effective and efficient operation for each of our clients. The result of our rigorous Quality Assurance means Accurate Data Capture and a superior inbound call centers customer experience.
	<p>
	Enhancing your customer services experience while cutting the cost dramatically is why many companies choose to outsource Customer Support with RooSoft.

<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->