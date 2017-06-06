<%
option explicit

dim active_page : active_page = ""

dim keywords, description, title
keywords = "Toronto, Canada, Moscow, Russia, Contacts"
description = "Roosoft Consulting is a Canadian company working in the Internet and IT industry for over 10 years creating and promoting websites, developing complex software solutions."
title = "Contacts"

dim msg : msg = request.cookies( "msg" )
%>

<!--#include virtual="/include/header.inc.asp"-->

<!--#include virtual="/include/page-top.inc.asp"-->

	<h1>Contacts</h1>

<!--	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 20px;">
	<tr>
		<td><img src="/images/flag_can.gif" alt="" border="0"></td>
		<td width="40%" style="padding: 10px;">
			<div class="clsAddressTitle">Toronto, Canada</div>
			<div class="clsAddress">19 Silverpine Ave.<br>Tel.: +1 (416) 721-4260</div>
		</td>
		<td><img src="/images/flag_rus.gif" alt="" border="0"></td>
		<td width="60%" style="padding: 10px;">
			<div class="clsAddressTitle">Moscow, Russia</div>
			<div class="clsAddress">44 Karamishevskaya Nab.<br>Tel.: +7 (906) 047-4124</div>
		</td>
	</tr>
	</table>

	<p>
	<br>
	<h2>Get a Quote</h2>
	<br>
-->

<%	if ( msg <> "" ) then %>

	<div style="margin-left: 20px; font-style: italic;" class="clsText"><%= msg %></div>

<%
		response.cookies( "msg" ) = ""
	else %>

	<form style="margin: 0px;" action="/Application.asp" method="post">
		<table border="0" cellspacing="0" cellpadding="0" style="margin-left: 0px;">
			<tr>
				<td>
					<div class="clsSmallText" style="width: 280px; line-height: 14px;">Full Name:</div>
					<input type="text" class="text" style="width: 280px; margin-bottom: 6px; padding: 4px 0px 4px 4px;" name="name">
				</td>
				<td>
					<div class="clsSmallText" style="width: 280px; line-height: 14px;">Company Name:</div>
					<input type="text" class="text" style="width: 280px; margin-bottom: 6px; padding: 4px 0px 4px 4px;" name="company">
				</td>
			</tr>
			<tr>
				<td>
					<div class="clsSmallText" style="width: 280px; line-height: 14px;">Country:</div>
					<input type="text" class="text" style="width: 280px; margin-bottom: 6px; padding: 4px 0px 4px 4px;" name="country">
				</td>
				<td>
					<div class="clsSmallText" style="width: 280px; line-height: 14px;">City:</div>
					<input type="text" class="text" style="width: 280px; margin-bottom: 6px; padding: 4px 0px 4px 4px;" name="city">
				</td>
			</tr>
			<tr>
				<td>
					<div class="clsSmallText" style="width: 280px; line-height: 14px;">Email:</div>
					<input type="text" class="text" style="width: 280px; margin-bottom: 6px; padding: 4px 0px 4px 4px;" name="email">
				</td>
				<td>
					<div class="clsSmallText" style="width: 280px; line-height: 14px;">Phone:</div>
					<input type="text" class="text" style="width: 280px; margin-bottom: 6px; padding: 4px 0px 4px 4px;" name="phone">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="clsSmallText">Subject:</div>
					<input type="text" class="text" style="width: 570px; margin-bottom: 6px; padding: 4px 0px 4px 4px;" name="subject">
			
					<div class="clsSmallText">Message:</div>
					<textarea style="width: 570px; height: 120px; margin-bottom: 12px; padding: 4px 0px 4px 4px;" name="message"></textarea>
					
					<br/>
					<div style="width: 580px; text-align: center;"><input type="submit" value="   Send   " style="height: 30px; width: 90px;"></div>
				</td>
			</tr>
		</table>
	</form>

<!--
	<table border="0" cellspacing="0" cellpadding="2" style="margin-left: 20px;">
	<tr>
		<td valign="middle" class="clsSmallText">Name:</td>
		<td valign="top"><input type="text" style="width: 200px;" name="name"></td>
	</tr>
	<tr>
		<td valign="middle" class="clsSmallText">Email:</td>
		<td valign="top"><input type="text" style="width: 200px;" name="email"></td>
	</tr>
	<tr>
		<td valign="middle" class="clsSmallText">Subject:</td>
		<td valign="top"><input type="text" style="width: 400px;" name="subject"></td>
	</tr>
	<tr>
		<td valign="top" class="clsSmallText" style="padding-top: 6px;">Message:&nbsp;&nbsp;</td>
		<td valign="top"><textarea style="width: 400px; height: 200px;" name="message"></textarea></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="   Send   " style="font-family: Arial; font-size: 12px; height: 30px; width: 90px;"></td>
	</tr>
	</table>
-->
	

<% end if %>
	
<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->