<%
	Dim Sobj
	Set Sobj = Server.CreateObject("Persits.MailSender")
	Sobj.Host = "38.99.140.136"

	Sobj.From = "webmaster@torontovka.com" ' Specify sender's email address
	Sobj.FromName = "Torontovka.com" ' Specify sender's name
	Sobj.AddAddress  "vadim.sloutsky@connectv.ca"
	Sobj.IsHTML = True 
	Sobj.CharSet = "UTF-8"
	Sobj.Subject = "What's in Toronto - October"
	Sobj.Body = "test"
	

	Sobj.Send
	If Err <> 0 Then
	   Response.Write "Error encountered: " & Err.Description
	End If
	
	'Sobj.Close
	Set Sobj = Nothing

 

%>