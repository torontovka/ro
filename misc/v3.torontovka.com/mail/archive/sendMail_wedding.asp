<%@ LANGUAGE="VBScript" CodePage=1251 %>
<!--#include file="../include/top.asp"-->
</head>
<body>
<%
' BEGIN USER CONSTANTS
Dim strSQL1, strSQL2, login, passwd          'SQL command to execute
Dim I, J, sentOn				'Loop counter
Dim SentEmail       'Currently sent email 

Server.ScriptTimeout = 200000

'strSQL = "Select fname, email, nopeople from wedding_guests where email = 'vadim.sloutsky@connectv.ca' or email = 'webmaster@torontovka.com'"
strSQL = "Select fname, email, nopeople from wedding_guests where email is not NULL"
strSQL2 = "Select * from EmailsSent"

Set objPagingConn = Server.CreateObject("ADODB.Connection")
objPagingConn.Open application( "tr.connection.string" )



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

 Function return_body (txtNoguests, txtFName)
	dim txtFooter
	
	txtFooter = "<html><head><title>Vadim And Oksana Wedding Confirmation</title></head><body>"
	
	txtFooter = txtFooter & "<table width=""56%"" height=""387"" border=""0"" bgcolor=""#000000"">"
	txtFooter = txtFooter & "<tr><td width=""45%"" height=""383"" valign=""bottom""><img src=""http://vadimandoksana.com/couple.jpg"" /></td><td width=""55%"" valign=""top""><font color=""#FFFFFF"">"
    txtFooter = txtFooter & "<p>&nbsp;</p>"
    txtFooter = txtFooter & "<p>Dear  " & txtFName & ",</p>"
    txtFooter = txtFooter & "<p>Time  flies, our wedding is less than 2 weeks away and we are delighted to see you  soon. As per your information submitted in our RSVP form, the total number of guests from your family is <b><font color=""red"">" & txtNoguests & "</font></b>. " 
	txtFooter = txtFooter & "Please, kindly  review this information and let us know if there are any changes. </p>"
    txtFooter = txtFooter & "<p>Yours  truly,</p><p>Vadim  &amp; Oksana</p></font><img src=""http://vadimandoksana.com/glasses.jpg"" /></td></tr></table>"

	txtFooter = txtFooter & "</body>"
	txtFooter = txtFooter & "</html>"

 
	return_body = txtFooter 
 End Function
 
 'Insert a loop with distinct emails
 Do while Not objPagingRS.EOF
  'if ( J > 10406) Then 
   txtBody = return_body(objPagingRS("nopeople"), objPagingRS("fname"))
   'txtBody = return_body (Request.Form("HtmlBody"), replace(objPagingRS("login"), "'", "''"), replace(objPagingRS("passwd"), "'", "''"))
  ' txtBody = txtBody & "<a href=""http://www.torontovka.com/subscribe_conf.asp?confirm=1&email=" & objPagingRS("email") & """>clicking here</a>. </p>  <p> " _
  '			 & "If you do not wish to receive the email broadcast, then either ignore this mail or <a href=""http://www.torontovka.com/subscribe.asp?subscribe=u&email=" & objPagingRS("email") & """>click here</a> to unsubscribe</p>  </td>  </tr></table></body></html>"
	Delay(1)
	Dim Sobj
	Set Sobj = Server.CreateObject("Persits.MailSender")
	Sobj.Host = "38.99.140.136"
	'Sobj.Host = "178.238.92.158"   '"38.99.140.138" ' Specify a valid SMTP server
	'Sobj.Host = "10.0.0.3" ' Specify a valid SMTP server
	'Sobj.Host = "66.246.151.43" ' Specify a valid SMTP server
	'Sobj.Host = "mail.1stservice.ca" ' Specify a valid SMTP server
	'Sobj.Username = "rtd_mail" 'Specify a username for mail
	'Sobj.Password = "sendRTDmail" 'Specify a password for mail
	
	'Connectv settings
	'Sobj.Host = "38.117.74.150"
    'Sobj.Username = "opmailuser"
	'Sobj.Password = "ALliance12"
	'Sobj.Port = "587"
	
	Sobj.From = "oksana_m@rogers.com" ' Specify sender's email address
	Sobj.FromName = "VadimAndOksana.com" ' Specify sender's name
	Sobj.AddAddress  objPagingRS("email")
	Sobj.AddReplyTo "oksana_m@rogers.com"
	Sobj.IsHTML = True 
	Sobj.CharSet = "UTF-8"
	Sobj.Subject = "Vadim And Oksana wedding - confirmation"
	Sobj.Body = txtBody
	
	On Error Resume Next
	Sobj.Send
	If Err <> 0 Then
	   Response.Write "Error encountered: " & Err.Description
	End If
	
	'Sobj.Close
	Set Sobj = Nothing

  sentOn = Now()
  strSQL1 = "Insert INTO EmailsSent (email, sent) VALUES ('"  & objPagingRS("email") & "', '" & sentOn & "')"
  objPagingConn.Execute strSQL1
 'end if
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
