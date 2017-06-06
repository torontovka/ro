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
Set conn_in = Server.CreateObject("ADODB.Connection")


'
' Torontovka Newsletter
'
'strSQL = "SELECT DISTINCT email FROM Emails WHERE email LIKE '%daniil.gromov@%'"
'strSQL = "SELECT DISTINCT email FROM Emails WHERE email LIKE '%daniil@%' OR email LIKE '%gromov@%'"
'strSQL = "SELECT DISTINCT email FROM Emails WHERE email LIKE 'webmaster@torontovka.com' OR email LIKE 'vadim.sloutsky@connectv.ca'"
'strSQL = "SELECT 'eraizberg@gmail.com' as email"
'strSQL = "SELECT DISTINCT email FROM Emails WHERE CheckStatus = 1"
'conn_in.open application( "tr.connection.string" )

'
' Torontovka Ads
'
'strSQL = "SELECT DISTINCT email, person FROM classifieds_Ads WHERE email = 'daniil.gromov@gmail.com'"
'strSQL = "SELECT DISTINCT email, person FROM classifieds_Ads WHERE phone = '' AND xdate > '2013-10-06'"
'conn_in.open application( "tr.connection.string" )

'
' Torontovka Classified
'
'strSQL = "SELECT DISTINCT email FROM mp_Business AS B WHERE email <> '' AND listing_type > 0 AND email LIKE '%gromov%'"
'strSQL = "SELECT DISTINCT email FROM mp_Business AS B WHERE email <> '' AND listing_type > 0"
'strSQL = "SELECT DISTINCT email, bus_id, bus_password FROM mp_Business WHERE (email <> '') AND (listing_type < 1) AND (email LIKE '%gromov%')"
'strSQL = "SELECT DISTINCT email, bus_id, bus_password FROM mp_Business WHERE (email <> '') AND (listing_type < 1)"

strSQL = "SELECT DISTINCT email FROM mp_Business WHERE (email LIKE '%.com') OR (email LIKE '%.ca') OR (email LIKE '%.ru')"
conn_in.open application( "mp.connection.string" )

'
' RussianTix
'
'strSQL = "SELECT email, name, COUNT(*) AS num FROM tix_MEMBERS WHERE status = 1 GROUP BY email, name"
'strSQL = "SELECT DISTINCT email FROM tix_MEMBERS"
'strSQL = "SELECT DISTINCT email FROM tix_ORDER WHERE email <> ''"
'strSQL = "SELECT DISTINCT email FROM tix_ORDER WHERE event_id = 162 AND email <> ''"
'strSQL = "SELECT DISTINCT email, * FROM tix_ORDER WHERE event_id = 210 and email <> ''" ' Rozenbaum
'strSQL = "SELECT DISTINCT email, * FROM tix_ORDER WHERE event_id = 219 and email <> ''" ' Oganezov
'strSQL = "SELECT DISTINCT email, * FROM tix_ORDER WHERE event_id = 333 and email <> ''" ' KVN
'conn_in.open application( "russiantix.connection.string" )

'
' Agencies
'
'strSQL = "SELECT DISTINCT email FROM Emails_AA WHERE email LIKE '%gromov@%' OR email LIKE '%daniil@%'"
'strSQL = "SELECT DISTINCT email FROM Emails_AA"

'
' Test
'
'strSQL = "SELECT DISTINCT email FROM Emails WHERE email LIKE 'daniil.gromov@%'"
'conn_in.open application( "tr.connection.string" )


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

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

    'response.write rec.eof

	do while not rec.eof

		'if ( J > 4622 ) Then

			Delay(1)
			dim sobj
			set sobj = Server.CreateObject("Persits.MailSender")

            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

            'sobj.Host =
			'"38.99.140.136"
			'"38.99.140.138" ' valid SMTP server, used to be .138

            ''' MANDRILL '''

			sobj.Host = "smtp.mandrillapp.com"
            sobj.Port = "587"
			sobj.Username = "daniil.gromov@torontovka.com"
			sobj.Password = "FYnae0nz1PQY16k8rZKQ0Q"

            ''' LATEST WORKING '''

			'sobj.Host = "178.238.92.158"
			'sobj.Username = "rtd_mail"
			'sobj.Password = "sendRTDmail"

            ''' SMTP.COM '''

			'sobj.Host = "ssrs.reachmail.net"
			'sobj.Username = "ROOSOFTC\admin"
			'sobj.Password = "L3@a#697"

			sobj.AddAddress  rec("email")
			sobj.IsHTML = True
			sobj.CharSet = "UTF-8"
            sobj.Subject = sobj.EncodeHeader( request.form("Subject"), "utf-8" )
            sobj.AddCustomHeader "X-MC-Tags: " & request.form("Tag")


            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

			'
			' Torontovka Newsletter
			'
			'sobj.AddReplyTo  "noreply@torontovka.com"
			'sobj.From		= "noreply@torontovka.com"
			'sobj.FromName	= "Torontovka.com"
			'sobj.Body = htmlBody & rec("email") & htmlFooter

			'
			' Torontovka Ads
			'
			sobj.AddReplyTo   "reklama@torontovka.com"
			sobj.From		= "reklama@torontovka.com"
			sobj.FromName	= "Torontovka.com"
			'sobj.Body = replace( htmlBody, "[NAME]", rec("person") )
            sobj.Body = htmlBody

			'
			' RussianTix
			'
			'sobj.AddReplyTo	  "noreply@russiantix.com"
			'sobj.From		= "noreply@russiantix.com"
			'sobj.FromName	= "RussianTix.com"
			'sobj.Body = htmlBody

            '
            ' RussianTix (Event)
            '
            ''sobj.AddBcc "daniil.gromov@gmail.com"
			'sobj.AddReplyTo "noreply@russiantix.com"
			'sobj.From = "noreply@russiantix.com"
			'sobj.FromName = "RussianTix.com"
			'sobj.Body = htmlBody

            ' Inject ORDER and NAME
            'dim order_id : order_id = rec("id")
            'dim checksum_total : checksum_total = 0
            'dim checksum_array : checksum_array = split( order_id, "" )
            'dim citem
            'for citem = 1 to len( Order_id )
            '    checksum_total = checksum_total + cint( mid( order_id, citem, 1 ) )
            'next
            'checksum_total = checksum_total * 5
            'dim url : url = "http://www.russiantix.com/receipt.asp?order=" & order_id & "&sid=" & checksum_total
            '
            'sobj.Body = replace( replace( htmlBody, "{NAME}", rec("full_name") ), "{URL}", url )

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

			sobj.Close
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

end if
%>
</table>

<p>
Seems to be sent. Click <a href="./sentMail.asp">here</a> to see how many emails have been sent.

<%
rec.close
set rec = nothing
conn_in.close
set conn_in  = nothing
%>

</body>
</html>