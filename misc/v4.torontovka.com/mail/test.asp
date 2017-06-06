<html>
<head></head>
<body style="font-family:Arial;font-size:12px;">
<%
Dim strSQL, login, passwd
Dim I, J, sentOn, SentEmail

dim sobj
set sobj = Server.CreateObject("Persits.MailSender")

'sobj.Host = "38.99.140.136"
'sobj.Host = "localhost"
'sobj.LogonUser "", "danik", "pizda007"

sobj.AddReplyTo "noreply@torontovka.com"
sobj.From		= "noreply@torontovka.com"
sobj.FromName	= "Torontovka.com"
sobj.Body		= "SERVER TEST"

sobj.Host		= request( "host" )
sobj.Port = "2525"
sobj.AddAddress request( "email" )


sobj.IsHTML		= True 
sobj.CharSet	= "UTF-8"
sobj.Subject	= "SERVER TEST"

'on error resume next
sobj.Send
Set sobj = Nothing

if err <> 0 Then %>
<p>ERROR: <%= err.number %>: <%= err.Description %></p><br>
<%
else
%>
<p>DONE</p>
<%
End If
%>


</body>
</html>
