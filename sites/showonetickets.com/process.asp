<!--#include file="./include/inc.vbs.asp"-->
<%
response.expires=0
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

str = request.form & "&cmd=_notify-validate"
' post back to PayPal system to validate
set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")

objHttp.open "POST", "https://www.paypal.com/cgi-bin/webscr", false
objHttp.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
objHttp.send str

orderID = Request.Form("custom")
Payment_status = Request.Form("payment_status")
Payment_amount = Request.Form("mc_gross")
Payment_currency = Request.Form("mc_currency")
Txn_id = Request.Form("txn_id")
Receiver_email = Request.Form("receiver_email")
first_name = Request.Form("first_name")
last_name = Request.Form("last_name")
payer_email = Request.Form("payer_email")

' Check notification validation
if (objHttp.status <> 200 ) then
	' HTTP error handling
	
elseif (objHttp.responseText = "VERIFIED") then
	
	dim strMsgBody
	strMsgBody = vbCrLf		& "--------------------------------------" & vbCrLf
	strMsgBody = strMsgBody	& "Order: "			& orderID & vbCrLf
	strMsgBody = strMsgBody	& "TXN (Paypal): "	& Txn_id & vbCrLf
	strMsgBody = strMsgBody	& "Event: "			& EventName(cint(request( "event" ))) & vbCrLf
	strMsgBody = strMsgBody	& "Amount: "		& Payment_amount & vbCrLf
	strMsgBody = strMsgBody	& "Status: "		& Payment_status & vbCrLf
	strMsgBody = strMsgBody	& "--------------------------------------" & vbCrLf & vbCrLf
	strMsgBody = strMsgBody	& "Last Name: "		& last_name & vbCrLf
	strMsgBody = strMsgBody	& "First Name: "	& first_name & vbCrLf
	strMsgBody = strMsgBody	& "Email: "			& payer_email & vbCrLf
	strMsgBody = strMsgBody	& "--------------------------------------" & vbCrLf & vbCrLf
	
	dim sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc
	toReplyTo	= "daniil.gromov@gmail.com"
	sFrom		= "daniil.gromov@gmail.com"
	sFromName	= "ShowOneTickets.com"
	toAddress	= "daniil.gromov@gmail.com"
	toAddBcc	= ""
	toSubj		= "[S1T] " & orderID & " Completed"
	toBody		= replace( replace( replace( replace( replace( strMsgBody, "O.H", "Orcestra - Row H" ), "O.R", "Orcestra - Row R" ), "B.DD", "Balcony - Row DD" ), "VIP", "VIP Lounge" ), "FLR", "Dance Floor" )
	
elseif (objHttp.responseText = "INVALID") then
	' ERROR
	
else
	' ERROR
	
end if

dim msg
on error resume next
msg = SendMail( sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc )

set objHttp = nothing
%>
