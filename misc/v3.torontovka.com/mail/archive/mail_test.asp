<!--#include file="../include/top.asp"-->
<!--#include file="../include/mail.inc"-->
</head>
<%
' BEGIN USER CONSTANTS
Dim strSQL1, strSQL2, login, passwd          'SQL command to execute
Dim I, J, sentOn				'Loop counter
Dim SentEmail       'Currently sent email 

Server.ScriptTimeout = 200000

%>
<body bgcolor="ffffe0">
<%

  dim objMail, strFooter, BOUNDARY, TEXT_HEADER
  dim HTML_HEADER, MP_FOOTER, strTextBody, strHTMLBody, strBody, txtBody


   txtBody = Request.Form("HtmlBody")
   'txtBody = return_body (Request.Form("HtmlBody"), replace(objPagingRS("login"), "'", "''"), replace(objPagingRS("passwd"), "'", "''"))
  ' txtBody = txtBody & "<a href=""http://www.torontovka.com/subscribe_conf.asp?confirm=1&email=" & objPagingRS("email") & """>clicking here</a>. </p>  <p> " _
  '			 & "If you do not wish to receive the email broadcast, then either ignore this mail or <a href=""http://www.torontovka.com/subscribe.asp?subscribe=u&email=" & objPagingRS("email") & """>click here</a> to unsubscribe</p>  </td>  </tr></table></body></html>"

  dim sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc
  sFrom = "webmaster@torontovka.com" 
  sFromName = "Torontovka.com" 
  toAddress = "rtdates@yahoo.com"
  toSubj = Request.Form("Subject")
  toBody = txtBody
  toReplyTo =  "webmaster@torontovka.com"
  toAddBcc = "webmaster@torontovka.com, terminal@a3canada.com"
  SendMail sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc
  
'	Dim Sobj
'	Set Sobj = Server.CreateObject("Persits.MailSender")
'	Sobj.Host = "10.0.0.3" ' Specify a valid SMTP server
	'Sobj.Host = "66.246.151.43" ' Specify a valid SMTP server
	'Sobj.Host = "mail.1stservice.ca" ' Specify a valid SMTP server
'	Sobj.Username = "rtd_mail" 'Specify a username for mail
'	Sobj.Password = "sendRTDmail" 'Specify a password for mail
'	Sobj.From = "webmaster@torontovka.com" ' Specify sender's email address
'	Sobj.FromName = "Torontovka.com" ' Specify sender's name
'	Sobj.AddAddress  "webmaster@torontovka.com"
'	Sobj.AddCC "support@a3canada.com"  
'	Sobj.AddReplyTo "webmaster@torontovka.com"
'	Sobj.IsHTML = True 
	
'	Sobj.Subject = Request.Form("Subject")
'	Sobj.Body = txtBody
	
'	On Error Resume Next
'	Sobj.Send
'	If Err <> 0 Then
'	   Response.Write "Error encountered: " & Err.Description
'	End If
	
'	Sobj.Close
'	Set Sobj = Nothing
  
  

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
   Seems to be sent.  
  </td>
</tr>
</table>  
</body>
</html>
