<% Session.CodePage = 65001  %>
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

'
' Torontovka
'
'strSQL = "SELECT DISTINCT email FROM Emails WHERE email LIKE '%gromov@%' OR email LIKE '%daniil@%'"
strSQL = "SELECT DISTINCT email FROM Emails WHERE CheckStatus = 1"

'
' RussianTix
'
'strSQL = "SELECT email, name, COUNT(*) AS num FROM tix_MEMBERS WHERE status = 1 GROUP BY email, name"

'
' Classified
'
'strSQL = "SELECT DISTINCT email FROM mp_Business AS B WHERE email <> '' AND listing_type > 0 AND email LIKE '%gromov%'"
'strSQL = "SELECT DISTINCT email FROM mp_Business AS B WHERE email <> '' AND listing_type > 0"

'
' Agencies
'
'strSQL = "SELECT DISTINCT email FROM Emails_AA WHERE email LIKE '%gromov@%' OR email LIKE '%daniil@%'"
'strSQL = "SELECT DISTINCT email FROM Emails_AA"

'
'
'strSQL = "SELECT DISTINCT email, bus_id, bus_password FROM mp_Business WHERE (email <> '') AND (listing_type < 1) AND (email LIKE '%gromov%')"
'strSQL = "SELECT DISTINCT email, bus_id, bus_password FROM mp_Business WHERE (email <> '') AND (listing_type < 1)"

Set conn_in = Server.CreateObject("ADODB.Connection")
conn_in.open application( "tr.connection.string" )
'conn_in.open application( "mp.connection.string" )
'conn_in.open "Provider=sqloledb;Driver={SQL Server};Server=127.0.0.1;Address=127.0.0.1,1344;Network=DBMSSOCN;Database=Tickets;Uid=rtd_test;Pwd=VadimTorkav2"

Set rec = Server.CreateObject("ADODB.Recordset")
rec.open strSQL, conn_in, 3, 1, &H0001
%>

<p>
Email count: <b><%= rec.RecordCount %></b> (unique)

<p>
<table cellpadding="6" cellspacing="1" border="1" style="font-family:Arial;font-size:12px;">
<tr>
	<td><b>Number</b></td>
	<td><b>Email</b></td>
	<td><b>Status</b></td>
</tr>

<%
if ( Request.Form("action") = "mail") then
	
	dim objMail
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
	
	rec.MoveFirst
	
	dim htmlBody	: htmlBody = request.form("HtmlBody")
	dim htmlFooter	: htmlFooter = request.form("HtmlFooter")

    response.write rec.eof

	do while not rec.eof

		'if ( J > 4622 ) Then

			Delay(1)
			dim sobj
			set sobj = Server.CreateObject("Persits.MailSender")

			'sobj.Host = "38.99.140.136"
			sobj.Host = "127.0.0.1"
            sobj.Port = "2525"
			sobj.LogonUser "", "danik", "pizda007"

			sobj.AddAddress  rec("email")
			sobj.IsHTML = True
			sobj.CharSet = "UTF-8"
            sobj.Subject = sobj.EncodeHeader( request.form("Subject"), "utf-8" )

			'
			' Torontovka
			'
			sobj.AddReplyTo  "noreply@torontovka.com"
			sobj.From		= "noreply@torontovka.com"
			sobj.FromName	= "Torontovka.com"
			sobj.Body = htmlBody & rec("email") & htmlFooter

			'
			' RussianTix
			'
			'sobj.AddReplyTo	  "noreply@russiantix.com"
			'sobj.From		= "noreply@russiantix.com"
			'sobj.FromName	= "RussianTix.com"
			'sobj.Body = htmlBody

			'
			' SourceWizz
			'
			'sobj.AddReplyTo   "kirill.berlin@sourcewizz.com"
			'sobj.From		= "kirill.berlin@sourcewizz.com"
			'sobj.FromName	= "Kirill Berlin (SourceWizz)"
			'sobj.Body = htmlBody & htmlFooter

			'sobj.Body = replace( replace( htmlBody, "<- ID ->", rec("bus_id") ), "<- PASS ->", rec("bus_password") )

			on error resume next
			sobj.Send
			if err <> 0 Then
				status = "Error (" & err.number & "): " & err.Description
			else
				status = "Sent"
    			sentOn = Now()
	    		strSQL1 = "INSERT INTO EmailsSent (email, sent) VALUES ('"  & rec("email") & "', '" & sentOn & "')"
		    	conn_in.Execute strSQL1
			End If

			'sobj.Close
			Set sobj = Nothing


		'else

		'	status = "Ignored"

		'end if
%>
<tr>
	<td><%= J %></td>
	<td><%= rec("email") %></td>
	<td><%= status %></td>
</tr>
<%
		response.flush
		rec.moveNext
		J = J + 1
		
	Loop
	
	rec.close
	set rec = nothing
	
	conn_in.close
	set conn_in  = nothing
	
end if
%>
</table>	  

<p>
Seems to be sent. Click <a href="./sentMail.asp">here</a> to see how many emails have been sent. 

</body>
</html>
