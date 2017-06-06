
<!--#include virtual="/scripts/guiapi.vbs"--> 

<%
Dim email, oCon, oRec, message
email = KillChars( trim( request( "email" ) ) )

set oCon = server.createObject( "ADODB.Connection" )
oCon.open application( "tr.connection.string" )
set oRec = oCon.execute( "SELECT email FROM Emails WHERE email = '" & email & "'" )

if oRec.bof or oRec.eof Then
	
	oRec.close
	set oRec = nothing
	oCon.close
	set oCon = nothing
	
	message = "Your email was not found in our database.\nPlease make sure you've entered a correct email."
	
else
	
	oRec.close
	set oRec = nothing
	
	oCon.execute "UPDATE Emails SET checkstatus = 1 WHERE email = '" & KillChars( email ) &"'"
	oCon.close
	set oCon = nothing
	
	message = "Your email has been confirmed and added to our database.\nNow you will be receiving our updates on what's happening in the city."
	
end If

'response.redirect "/?alertMessage=" & message
%>
<script>
    alert("<%=message%>");
    document.location.href="http://www.torontovka.com";
</script>
