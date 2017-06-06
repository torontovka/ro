<%@ LANGUAGE="VBScript" CodePage=1251 %>
<html>
<head></head>
<body style="font-family:Arial;font-size:12px;">
<%
if ( Request.Form("action") = "sent") then
	Response.Redirect "SentMail.asp"
End If   

Dim strSQL, login, passwd
Dim I, J, sentOn, SentEmail

Server.ScriptTimeout = 200000

'strSQL = "Select * from EmailsSent"
strSQL = "SELECT DISTINCT email FROM Emails WHERE CheckStatus = 0"
'strSQL = "SELECT DISTINCT email FROM Emails WHERE email LIKE '%gromov@%' OR email LIKE '%daniil@%'"

Set objPagingConn = Server.CreateObject("ADODB.Connection")
objPagingConn.Open application( "tr.connection.string" )
Set objPagingRS = Server.CreateObject("ADODB.Recordset")
objPagingRS.Open strSQL, objPagingConn, 3, 1, &H0001

email = objPagingRS("email")
%>

<p>
Email count: <b><%= objPagingRS.RecordCount %></b> (unique)

<p>
<table cellpadding="6" cellspacing="1" border="1" style="font-family:Arial;font-size:12px;">
<tr>
	<td><b>Number</b></td>
	<td><b>Email</b></td>
</tr>

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
	
	dim htmlBody	: htmlBody = request.form("HtmlBody")
	dim htmlFooter	: htmlFooter = request.form("HtmlFooter")
	
	'Insert a loop with distinct emails
	do while not objPagingRS.eof
		
		'txtBody = return_body(Request.Form("HtmlBody"), objPagingRS("email"))
		'txtBody = return_body (Request.Form("HtmlBody"), replace(objPagingRS("login"), "'", "''"), replace(objPagingRS("passwd"), "'", "''"))
		'txtBody = txtBody & "<a href=""http://www.torontovka.com/subscribe_conf.asp?confirm=1&email=" & objPagingRS("email") & """>clicking here</a>. </p>  <p> " _
		'& "If you do not wish to receive the email broadcast, then either ignore this mail or <a href=""http://www.torontovka.com/subscribe.asp?subscribe=u&email=" & objPagingRS("email") & """>click here</a> to unsubscribe</p>  </td>  </tr></table></body></html>"
		
		'if ( J > 11606 ) Then 
			
			Delay(1)
			Dim Sobj
			Set Sobj = Server.CreateObject("Persits.MailSender")
			Sobj.Host = "38.99.140.136"
			
			Sobj.From = "noreply@torontovka.com" ' Specify sender's email address
			Sobj.FromName = "Torontovka.com" ' Specify sender's name
			Sobj.AddAddress  objPagingRS("email")
			Sobj.AddReplyTo "noreply@torontovka.com"
			Sobj.IsHTML = True 
			Sobj.CharSet = "UTF-8"
			Sobj.Subject = request.form("Subject")
			Sobj.Body = htmlBody & objPagingRS("email") & htmlFooter
			
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
%>
<tr>
	<td><%= J %></td>	
	<td><%= objPagingRS("email") %></td>
</tr>
<%
			'response.flush
			
		'end if
		
	  	objPagingRS.MoveNext
		J = J + 1
		
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
</table>	  

<p>
Seems to be sent. Click <a href="./sentMail.asp">here</a> to see how many emails have been sent. 

</body>
</html>
