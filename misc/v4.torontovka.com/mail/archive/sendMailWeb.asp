<!--#include file="../include/top.asp"-->
<!--#include virtual="/scripts/guiapi.vbs"-->
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
 
  dim objMail, strFooter, BOUNDARY, TEXT_HEADER, strFrom
  dim HTML_HEADER, MP_FOOTER, strTextBody, strHTMLBody, strBody

	Dim Sobj
	Set Sobj = Server.CreateObject("Persits.MailSender")
	Sobj.Host = "10.0.0.3" ' Specify a valid SMTP server
	'Sobj.Host = "66.246.151.43" ' Specify a valid SMTP server
	'Sobj.Host = "mail.1stservice.ca" ' Specify a valid SMTP server
	Sobj.Username = "rtd_mail" 'Specify a username for mail
	Sobj.Password = "sendRTDmail" 'Specify a password for mail
	Sobj.From = Request.Form("AccountFrom") ' Specify sender's email address
	if Request.Form("AccountFrom") = "president@webguruscanada.com" Then
		strFrom = "Web Gurus Inc."
	else
		strFrom = "Torontovka.com"
	end if
	Sobj.FromName = strFrom ' Specify sender's name
	Sobj.AddAddress  Request.Form("ToEmail")
	Sobj.AddReplyTo Request.Form("AccountFrom")
	Sobj.IsHTML = True 
	
	Sobj.Subject = Request.Form("Subject")
	Sobj.Body = FormatStr( Request.Form("EmailBody") )
	
	On Error Resume Next
	Sobj.Send
	If Err <> 0 Then
	   Response.Write "Error encountered: " & Err.Description
	End If
	
	Sobj.Close
	Set Sobj = Nothing


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
   Email has been sent
  </td>
</tr>
</table>  
</body>
</html>
