<!--#include file="../include/top.asp"-->
</head>
<body>
<%
' BEGIN USER CONSTANTS
Dim strSQL1, strSQL2, login, passwd          'SQL command to execute
Dim I, J, sentOn				'Loop counter
Dim SentEmail       'Currently sent email 

Server.ScriptTimeout = 200000

strSQL = "Select distinct email from Emails where email = 'webmaster@torontovka.com'"
'strSQL = "Select distinct email from Emails"
strSQL2 = "Select * from EmailsSent"

Set objPagingConn = Server.CreateObject("ADODB.Connection")
objPagingConn.Open CONN_STRING



' Create recordset and set the page size
Set objPagingRS = Server.CreateObject("ADODB.Recordset")

' Open RS
objPagingRS.Open strSQL, objPagingConn, 3, 1, &H0001 

email = objPagingRS("email")
 
%>
<body bgcolor="ffffe0">
<%
if ( Request.Form("action") = "sent") then
   Response.Redirect "SentMail.asp"
End If   
%>
<p>
There is a total of <b><font color="red" size=+1> <% =objPagingRS.RecordCount %></font></b> unique emails in the system.
<p>
 <table border=1>
   <TR>
     <TD>
		Number
     </TD>
     <TD>
		Email
	</TD>	
	 <TD>
		Confirmed
	</TD>	
   </TR>  
 <% objPagingRS.MoveFirst
 dim oField
  Do while Not objPagingRS.EOF %>
	<% I = I + 1 %>
	<TR>
	<td>
		<% Response.Write I %>
	  </td>	
	  <td>
	  <% Response.Write objPagingRS("email") %>
	  <% 'Response.Write oField.Value %>
	  </td>
	  <td>
	  	
	  </td>
	  <% objPagingRS.MoveNext %>
	</TR>
 <% Loop %>
 </table>	  
<p>		

<% 
if ( Request.Form("action") = "mail") then
 
  dim objMail, strFooter, BOUNDARY, TEXT_HEADER
  dim HTML_HEADER, MP_FOOTER, strTextBody, strHTMLBody, strBody
  J = 0
  
  Sub Delay(DelaySeconds)
		SecCount = 0
		Sec2 = 0
		While SecCount < DelaySeconds + 1
			Sec1 = Second(Time())
			If Sec1 <> Sec2 Then
				Sec2 = Second(Time())
				SecCount = SecCount + 1
			End If
		Wend 
  End Sub
  
 objPagingRS.MoveFirst

 Function return_body (txtBody)
	dim txtFooter
	'txtFooter = "<tr>"
	'txtFooter = txtFooter & "<td valign=bottom colspan=3>"
	
	'txtFooter = txtFooter & "	<!-- GREY EMPTY STUFF -->"
	'txtFooter = txtFooter & "	<table height=9 width=100% cellpadding=0 cellspacing=0 border=0>"
	'txtFooter = txtFooter & "	<tr>"
	'txtFooter = txtFooter & "		<td bgcolor=#D8DDE3><img src=http://www.torontovka.com/images/clear.gif height=8 width=150></td>"
	'txtFooter = txtFooter & "		<td bgcolor=#FFFFFF><img src=http://www.torontovka.com/images/clear.gif height=8 width=1></td>"
	'txtFooter = txtFooter & "		<td bgcolor=#D8DDE3 width=100% ><img src=http://www.torontovka.com/images/clear.gif height=8 width=500></td>"
	'txtFooter = txtFooter & "		<td bgcolor=#FFFFFF><img src=http://www.torontovka.com/images/clear.gif height=8 width=1></td>"
	'txtFooter = txtFooter & "	</tr>"
	'txtFooter = txtFooter & "	<tr>"
	'txtFooter = txtFooter & "		<td colspan=4 bgcolor=#FFFFFF><img src=http://www.torontovka.com/images/clear.gif height=1 width=1></td>"
	'txtFooter = txtFooter & "	</tr>"
	'txtFooter = txtFooter & "	</table>"
	'txtFooter = txtFooter & "	<!-- / GREY EMPTY STUFF -->"
	'	
	txtFooter = txtFooter & "	<table height=25 width=100% cellpadding=0 cellspacing=0 border=0>"
	txtFooter = txtFooter & "	<tr>"
	txtFooter = txtFooter & "		<td bgcolor=#FFCC33 align=left><img src=http://www.torontovka.com/images/clear.gif height=18 width=4 align=absmiddle><a href=http://www.torontovka.com/mail/subscribe.asp?subscribe=u&email=" & objPagingRS("email") & " class=clsCopyright>Unsubscribe from this newsletter</a></td>"
	txtFooter = txtFooter & "		<td bgcolor=#FFCC33 align=right><img src=http://www.torontovka.com/images/clear.gif height=18 width=4 align=absmiddle><a href=http://www.torontovka.com/?key=life.dating.user_agreement class=clsCopyright>User Agreement</a></td>"
	txtFooter = txtFooter & "	</tr>"
	'txtFooter = txtFooter & "		<tr>"
	'txtFooter = txtFooter & "		<td bgcolor=#FFFFFF colspan=2><img src=http://www.torontovka.com/images/clear.gif height=1 width=1></td>"
	'txtFooter = txtFooter & "	</tr>"
	'txtFooter = txtFooter & "	<tr>"
	'txtFooter = txtFooter & "		<td bgcolor=#D85600 colspan=2><img src=http://www.torontovka.com/images/clear.gif height=6 width=1></td>"
	'txtFooter = txtFooter & "	</tr>"
	txtFooter = txtFooter & "	</table>"
	
	txtFooter = txtFooter & "</td>"
	txtFooter = txtFooter & "</tr>"
	txtFooter = txtFooter & "</table>"

	txtFooter = txtFooter & "</body>"
	txtFooter = txtFooter & "</html>"

 
	return_body = txtBody & txtFooter 
 End Function
 
 'Insert a loop with distinct emails
 Do while Not objPagingRS.EOF
  'if ( J > 1310) Then 
   txtBody = return_body(Request.Form("HtmlBody"))
   'txtBody = return_body (Request.Form("HtmlBody"), replace(objPagingRS("login"), "'", "''"), replace(objPagingRS("passwd"), "'", "''"))
  ' txtBody = txtBody & "<a href=""http://www.torontovka.com/subscribe_conf.asp?confirm=1&email=" & objPagingRS("email") & """>clicking here</a>. </p>  <p> " _
  '			 & "If you do not wish to receive the email broadcast, then either ignore this mail or <a href=""http://www.torontovka.com/subscribe.asp?subscribe=u&email=" & objPagingRS("email") & """>click here</a> to unsubscribe</p>  </td>  </tr></table></body></html>"

	Dim Sobj
	Set Sobj = Server.CreateObject("Persits.MailSender")
	Sobj.Host = "10.0.0.3" ' Specify a valid SMTP server
	'Sobj.Host = "66.246.151.43" ' Specify a valid SMTP server
	'Sobj.Host = "mail.1stservice.ca" ' Specify a valid SMTP server
	Sobj.Username = "rtd_mail" 'Specify a username for mail
	Sobj.Password = "sendRTDmail" 'Specify a password for mail
	Sobj.From = "webmaster@torontovka.com" ' Specify sender's email address
	Sobj.FromName = "Torontovka.com" ' Specify sender's name
	Sobj.AddAddress  objPagingRS("email")
	Sobj.AddReplyTo "webmaster@torontovka.com"
	Sobj.IsHTML = True 
	
	Sobj.Subject = "Toronto Events in August"
	Sobj.Body = txtBody
	
	On Error Resume Next
	Sobj.Send
	If Err <> 0 Then
	   Response.Write "Error encountered: " & Err.Description
	End If
	
	Sobj.Close
	Set Sobj = Nothing
  sentOn = Now()
  strSQL1 = "Insert INTO EmailsSent (email, sent) VALUES ('"  & objPagingRS("email") & "', '" & sentOn & "')"
  objPagingConn.Execute strSQL1
  'end if
  Delay(2)
  J = J + 1
  	objPagingRS.MoveNext
 Loop

 objPagingRS.Close
 set objPagingRS=Nothing
end if  

 ''''''''''''''''''''''' CDONTS Component '''''''''''''''''''''''''''''''''''''
'  Set objMail = Server.CreateObject("CDONTS.NewMail")
'	objMail.From   = "Torontovka.com"
'	objMail.Value("Reply-To") = "webmaster@torontovka.com"
'	objMail.To = objPagingRS("email")
'	objMail.Subject    = Request.Form("Subject") 
'	objMail.Body   = txtBody
'	objMail.BodyFormat = 0
'	objMail.MailFormat = 0
'	objMail.Send 
'   Set objMail = Nothing 
''''''''''''''''''''''End Component Code''''''''''''''''''''''''''''''''''''''''''
	
%>

<table width="600">
<tr>
  <td>
   Seems to be sent. Click <a href="./sentMail.asp">here</a> to see how many emails have been sent. 
  </td>
</tr>
</table>  
</body>
</html>
