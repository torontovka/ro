<!--#include file="./include/inc.vbs.asp"-->
<%
dim message : message = ""

function SendMail(sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc)
	
    err.clear
    'Session.CodePage=1251
    'on error resume next
    Dim objMail
    Set objMail = Server.CreateObject("Persits.MailSender")
    if err.number <>0 then
        response.write "<HR>"& err.source &"<BR>"& err.description &"<HR>"
        exit function
    end if
    objMail.Host = "178.238.92.158"   '"38.99.140.138" ' valid SMTP server
    'objMail.Username = "rtd_mail" 
    'objMail.Password = "sendRTDmail" 
    objMail.From = sFrom ' sender's email address
    'objMail.FromName = sFromName ' sender's name
    'debug "sFromName",sFromName
    objMail.FromName = objMail.EncodeHeader(sFromName, "Windows-1251")
    objMail.AddAddress toAddress
    objMail.AddReplyTo toReplyTo
    if (Len(toAddBcc) <> 0) Then
     objMail.AddBCC toAddBcc
    end if
	
    objMail.Charset = "Windows-1251"
    'objMail.Charset = "koi8-r"
	
    'objMail.Subject = toSubj
    objMail.Subject = objMail.EncodeHeader(toSubj, "Windows-1251")
    objMail.Body = toBody
	'objMail.IsHTML = True 
	
    'objMail.ContentTransferEncoding = "8bit"
    objMail.ContentTransferEncoding = "Quoted-Printable"
	
    On Error Resume Next
    objMail.Send
	
	If Err <> 0 Then
		Sendmail = Err.Description
	Else
		SendMail = message
	End If
	
    objMail.Close
    Set objMail = Nothing
	
    'DEBUG "Body-After",objMail.Body
    'Session.CodePage=1251
	
end function

dim strMsgBody
strMsgBody = vbCrLf		& "--------------------------------------" & vbCrLf
strMsgBody = strMsgBody	& "Order: " & request( "order" ) & vbCrLf
strMsgBody = strMsgBody	& "Event: " & EventName(cint(request( "event" ))) & vbCrLf
strMsgBody = strMsgBody	& "Amount: " & request( "amount" ) & vbCrLf
strMsgBody = strMsgBody	& "--------------------------------------" & vbCrLf & vbCrLf
strMsgBody = strMsgBody	& "Tickets: " & vbCrLf

dim rows : rows = split( request("tickets"), ",")
dim i
for i = 0 to ubound( rows )
	
	if rows(i) <> "" then
		
		dim row : row = split( rows(i), "[" )
		dim seats : seats = split( replace( row(1), "]", "" ), "|" )
		
		strMsgBody = strMsgBody & row(0) & ": "
		
		dim j
		for j = 0 to ubound( seats )
			if ( seats(j) <> "" ) then
				strMsgBody = strMsgBody & seats(j) & ", "
			end if
		next
		
		strMsgBody = strMsgBody & vbCrLf
		
	end if
	
next

strMsgBody = strMsgBody & vbCrLf & "--------------------------------------" & vbCrLf & vbCrLf

dim sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc
toReplyTo	= "daniil.gromov@gmail.com"
sFrom		= "daniil.gromov@gmail.com"
sFromName	= "ShowOneTickets.com"
toAddress	= "daniil.gromov@gmail.com"
toAddBcc	= ""
toSubj		= "[S1T] " & request("order") & " Initiated"
toBody		= replace( replace( replace( replace( replace( strMsgBody, "O.H", "Orcestra - Row H" ), "O.R", "Orcestra - Row R" ), "B.DD", "Balcony - Row DD" ), "VIP", "VIP Lounge" ), "FLR", "Dance Floor" )

dim msg
on error resume next
msg = SendMail( sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc )

if ( msg = "" ) then
	response.write "OK"
else
	response.write "Operation failed. Please try again.<br>" & msg
end if
%>
