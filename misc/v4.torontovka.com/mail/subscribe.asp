<!--#include virtual="/include/mail.inc"-->
<!--#include virtual="/scripts/guiapi.vbs"-->

<%
Dim email : email = FormatStr( trim( request( "email" ) ) )
Dim subscribe : subscribe = request( "subscribe" )
Dim passed : passed = 0
Dim message

If ( len( email ) < 1 or inStr( email, "your@email.com" ) > 0 ) Then
	message = "Please enter your email address"
	passed = 1
ElseIf ( inStr( email, "@" ) = 0 or inStr( email, "." ) = 0 ) Then
	message = "Please enter a valid email address."
	passed = 1
ElseIf ( inStr( email, "/" ) > 0 or inStr( email, "'" ) > 0 or inStr( email, " " ) > 0 ) Then
	message = "Please do not include special characters or spaces in your email address."
	passed = 1
End If

strSQL = "SELECT * FROM Emails WHERE email = '" & email & "'"

If passed = 0 Then
	
	Set oCon = server.createObject("ADODB.Connection")
	oCon.Open application( "tr.connection.string" )
	
	Set oRec = server.createObject("ADODB.Recordset")
	oRec.Open strSQL, oCon,  3, 1, &H0001
	
	If ( subscribe = "s" ) Then

		If oRec.RecordCount > 0 Then
			
			oRec.Close
			Set oRec = Nothing
			oCon.Close
			Set oCon = Nothing
			
			message = "Thanks for your interest, but you are already a subscriber."
			
		Else
			
			oRec.Close
			set oRec = nothing
			
			strSQL = "INSERT INTO Emails (email) VALUES ('" & email &"')"
			oCon.execute strSQL
			oCon.close
			set oCon = nothing
			
			dim txtBody, sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc
			txtBody = "Thank you for registering with Torontovka Newsletter." & vbCrlf
			txtBody = txtBody  & "Please confirm your subscription by going to http://www.torontovka.com/mail/subscribe_conf.asp?email=" & email & vbCrlf
			txtBody = txtBody  & vbCrlf & "Our newsletter includes most interesting news and events of the week."
			txtBody = txtBody  & vbCrlf & "If you have not subscribed to the broadcast, please either ignore this email"
			txtBody = txtBody  & vbCrlf & "or unsubscribe by going to http://www.torontovka.com/mail/subscribe.asp?from_email=true&subscribe=u&email=" & email & vbCrlf
			txtBody = txtBody  & vbCrlf & "Regards, Torontovka.com team."
			
			sFrom = "webmaster@torontovka.com"
			sFromName = "Torontovka.com"
			toReplyTo = "webmaster@torontovka.com"
			toAddress = email
			toSubj = "Newsletter subscription confirmation"
			toBody = txtBody
			toAddBcc = ""
			
			SendEmailMsg sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc, "Newsletter_Confirm", false
			message = "You have been subscribed.\nYour email has been added to our database and you should receive\nan email confirmation, please respond to it."
			
	 	 End If
		
	Else
		
		If ( oRec.RecordCount > 0 ) Then

			oRec.Close
			Set oRec = Nothing

		    strSQL = "UPDATE Emails SET checkstatus = 0 WHERE email = '" & email &"'"  ''' "DELETE FROM Emails WHERE email = '" & email &"'"
			oCon.Execute strSQL

			oCon.Close
			Set oCon = Nothing

			message = "You have been unsubscribed."
			
		Else
			
			oRec.Close
			Set oRec = Nothing
			oCon.Close
			Set oCon = Nothing

			message = "Your email was not found in our database.\nPlease make sure you entered a correct email address."

		End If

	End If
	
End If

'response.redirect "/?alertMessage=" & message
'response.end

'if not isEmpty( request( "from_email" ) ) then
'	response.redirect "/?alertMessage=" & message
'else
%>

<html>                
<head>

    <script language="JavaScript" src="/scripts/tools.js"></script>
	<script>
	
		alert( "<%= message %>" );
		document.location = "/"

	</script>	

</head>
<body>

</body>
</html>

<%
'end if %>