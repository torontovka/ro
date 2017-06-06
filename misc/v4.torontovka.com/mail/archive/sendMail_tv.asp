<%@ LANGUAGE="VBScript" CodePage=1251 %>
<!--#include file="../include/top.asp"-->
</head>
<body>
<%
' BEGIN USER CONSTANTS
Dim strSQL1, strSQL2, login, password          'SQL command to execute
Dim I, J, sentOn				'Loop counter
Dim SentEmail       'Currently sent email 

Server.ScriptTimeout = 200000

strSQL = "SELECT DISTINCT email FROM tv_user_billto "
'strSQL = "SELECT DISTINCT email FROM tv_user_billto ub, tv_user u WHERE ub.user_id = u.user_id AND u.is_active = 0 and email > 'ursachiim@mail.ru'"
'strSQL = "SELECT DISTINCT email FROM tv_user_billto WHERE email='vadim.sloutsky@connectv.ca'"
'strSQL = "SELECT DISTINCT p.email  FROM date_Members m, date_Profile p WHERE m.isEnabled = 1 and m.id = p.member and p.gender = 2 "
'strSQL = "SELECT DISTINCT email, login, password  FROM date_Members WHERE isEnabled = 1" 
'strSQL = "SELECT DISTINCT email, login, password FROM date_Members WHERE email = 'president@webguruscanada.com'"
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
	 <TD>
		Login
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
 
  dim strFooter, BOUNDARY, TEXT_HEADER
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

 Function return_body (txtBody, login, passwd)
	return_body = txtBody & "<TABLE WIDTH=100% CELLPADDING=7 CELLSPACING=0 BORDER=0><TR><TD align=center><p class=""clsDefaultText""><a name=login></a>System Information:<br><b>Login</b> = <font color=""red"">" & login & "</font><br> <b>Password</b> = <font color=""red"">" & passwd & "</font></TD></TR></TABLE></BODY></HTML>" 
 End Function
  
 'Insert a loop with distinct emails
 Do while Not objPagingRS.EOF
  'if ( j > 8051) Then 
   'txtBody = Request.Form("HtmlBody")  
   'txtBody = return_body (Request.Form("HtmlBody"), replace(objPagingRS("login"), "'", "''"), replace(objPagingRS("password"), "'", "''"))
  ' txtBody = txtBody & "<a href=""http://www.torontovka.com/subscribe_conf.asp?confirm=1&email=" & objPagingRS("email") & """>clicking here</a>. </p>  <p> " _
  '			 & "If you do not wish to receive the email broadcast, then either ignore this mail or <a href=""http://www.torontovka.com/subscribe.asp?subscribe=u&email=" & objPagingRS("email") & """>click here</a> to unsubscribe</p>  </td>  </tr></table></body></html>"

    Dim Sobj
	Set Sobj = Server.CreateObject("Persits.MailSender")
	Sobj.Host = "178.238.92.158"   '"38.99.140.138" ' Specify a valid SMTP server
	Sobj.Username = "info.bestrussiantv" 
    Sobj.Password = "BestTV_1045"
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
	
	Sobj.From = "support@bestrussiantv.com" ' Specify sender's email address
	Sobj.FromName = "BestRussianTV.com" ' Specify sender's name
	Sobj.AddAddress  objPagingRS("email")
	Sobj.AddReplyTo "help@bestrussiantv.com"
	Sobj.IsHTML = True 
	Sobj.CharSet = "UTF-8"
	Sobj.Subject = "News and Updates"
	Sobj.Body = Request.Form("HtmlBody")
	
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
  
  Delay(1)
  J = J + 1
  objPagingRS.MoveNext
 Loop

 objPagingRS.Close
 set objPagingRS=Nothing
end if  
	
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
