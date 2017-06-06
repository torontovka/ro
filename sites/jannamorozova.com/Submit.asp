<%@ language=VBScript codepage=1251 %>
<%
option explicit
dim page : page = 5

dim message
message = "Thank you for submitting my Secure Online Application. I will review your data and contact you with a proposal within one business day."

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
		Sendmail = "<b>ERROR:</b> " & Err.Description
	Else
		SendMail = message
	End If
	
    objMail.Close
    Set objMail = Nothing
	
    'DEBUG "Body-After",objMail.Body
    'Session.CodePage=1251
	
end function


dim strMsgBody, sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc

strMsgBody = vbCrLf
strMsgBody = strMsgBody & "Mortage Details" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Type of Loan: " & request.form("FMrtType") & vbCrLf
strMsgBody = strMsgBody & "Purpose of Loan: " & request.form("FLoanPurp") & vbCrLf
strMsgBody = strMsgBody & "Value of Home: " & request.form("FHomeValue") & vbCrLf
strMsgBody = strMsgBody & "Mortgage Amount Required: " & request.form("FMortgageAmountRequested") & vbCrLf
strMsgBody = strMsgBody & "Approx Date Funds Required: " & request.form("FApproxDate") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Personal Information - Applicant 1" & vbCrLf & vbCrLf
strMsgBody = strMsgBody & "Identification" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "First Name: " & request.form("BFirstName") & vbCrLf
strMsgBody = strMsgBody & "Last Name: " & request.form("BLastName") & vbCrLf
strMsgBody = strMsgBody & "Initial: " & request.form("BGivenName") & vbCrLf
strMsgBody = strMsgBody & "Date of Birth: " & request.form("BDOB") & vbCrLf
strMsgBody = strMsgBody & "SIN#: " & request.form("BBorrowerSIN") & vbCrLf
strMsgBody = strMsgBody & "E-Mail Address: " & request.form("BEmailAddr") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Current Living Address" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Number: " & request.form("BAddress1") & vbCrLf
strMsgBody = strMsgBody & "Street Name: " & request.form("BAddress2") & vbCrLf
strMsgBody = strMsgBody & "Street Type: " & request.form("BAddress3") & vbCrLf
strMsgBody = strMsgBody & "Street Dir.: " & request.form("BAddress4") & vbCrLf
strMsgBody = strMsgBody & "Unit: " & request.form("BCurrentUnitNum") & vbCrLf
strMsgBody = strMsgBody & "City/Town: " & request.form("BCurrentCity") & vbCrLf
strMsgBody = strMsgBody & "Province: " & request.form("BCurrentProvince") & vbCrLf
strMsgBody = strMsgBody & "Postal Code: " & request.form("BCurrentCode") & vbCrLf
strMsgBody = strMsgBody & "Home Ph.#: " & request.form("BHomePhone") & vbCrLf
strMsgBody = strMsgBody & "Time at this address: " & request.form("BCurrentAddrTime") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Present Employer" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Occupation Type: " & request.form("Boccupation") & vbCrLf
strMsgBody = strMsgBody & "Name of Employer: " & request.form("BPresEmpName") & vbCrLf
strMsgBody = strMsgBody & "Work Ph.#: " & request.form("BBusinessPhone") & vbCrLf
strMsgBody = strMsgBody & "Length of Employment: " & request.form("BLengthService") & vbCrLf
strMsgBody = strMsgBody & "Annual Income: " & request.form("BAnnualIncome") & vbCrLf
strMsgBody = strMsgBody & "Type of Income: " & request.form("BTypeOfIncome") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Personal Information - Applicant 2" & vbCrLf & vbCrLf
strMsgBody = strMsgBody & "Identification" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "First Name: " & request.form("CFirstName") & vbCrLf
strMsgBody = strMsgBody & "Last Name: " & request.form("CLastName") & vbCrLf
strMsgBody = strMsgBody & "Initial: " & request.form("CGivenName") & vbCrLf
strMsgBody = strMsgBody & "Date of Birth: " & request.form("CDOB") & vbCrLf
strMsgBody = strMsgBody & "SIN#: " & request.form("CoBorrowerSIN") & vbCrLf
strMsgBody = strMsgBody & "E-Mail Address: " & request.form("CEmailAddr") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Current Living Address" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Number: " & request.form("CAddress1") & vbCrLf
strMsgBody = strMsgBody & "Street Name: " & request.form("CAddress2") & vbCrLf
strMsgBody = strMsgBody & "Street Type: " & request.form("CAddress3") & vbCrLf
strMsgBody = strMsgBody & "Street Dir.: " & request.form("CAddress4") & vbCrLf
strMsgBody = strMsgBody & "Unit: " & request.form("CCurrentUnitNum") & vbCrLf
strMsgBody = strMsgBody & "City/Town: " & request.form("CCurrentCity") & vbCrLf
strMsgBody = strMsgBody & "Province: " & request.form("CCurrentProvince") & vbCrLf
strMsgBody = strMsgBody & "Postal Code: " & request.form("CCurrentCode") & vbCrLf
strMsgBody = strMsgBody & "Home Ph.#: " & request.form("CHomePhone") & vbCrLf
strMsgBody = strMsgBody & "Time at this address: " & request.form("CCurrentAddrTime") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Present Employer (Applicant 2)" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Occupation Type: " & request.form("Coccupation") & vbCrLf
strMsgBody = strMsgBody & "Name of Employer: " & request.form("CPresEmpName") & vbCrLf
strMsgBody = strMsgBody & "Work Ph.#: " & request.form("CBusinessPhone") & vbCrLf
strMsgBody = strMsgBody & "Length of Employment: " & request.form("CLengthService") & vbCrLf
strMsgBody = strMsgBody & "Annual Income: " & request.form("CAnnualIncome") & vbCrLf
strMsgBody = strMsgBody & "Type of Income: " & request.form("CTypeOfIncome") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Financial Information" & vbCrLf & vbCrLf
strMsgBody = strMsgBody & "Assets" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Cash savings: " & request.form("ACIB") & " $" & request.form("ACIBValue") & vbCrLf
strMsgBody = strMsgBody & "Automobile (present value): " & request.form("AAutomobile") & " $" & request.form("AAutoValue") & vbCrLf
strMsgBody = strMsgBody & "Value of present home (if owned): $" & request.form("AHomeValue") & vbCrLf
strMsgBody = strMsgBody & "Other: " & request.form("AOther") & " $" & request.form("AOtherValue") & vbCrLf
strMsgBody = strMsgBody & "Total: $" & request.form("ATotalValue") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Liabilities" & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Debts/Loans: " & request.form("LBankLoans") & " $" & request.form("LLoanBalance") & " $" & request.form("LLoanPayment") & vbCrLf
strMsgBody = strMsgBody & "Credit Cards: " & request.form("LCreditCards") & " $" & request.form("LCardBalance") & " $" & request.form("LCardPayment") & vbCrLf
strMsgBody = strMsgBody & "Amount owing on current mortgage(s): " & request.form("LMortgage") & " $" & request.form("LMortgageBalance") & " $" & request.form("LMortgagePayment") & vbCrLf
strMsgBody = strMsgBody & "Finance company loans and other debts: " & request.form("LFinanceCompany") & " $" & request.form("LFinanceBalance") & " $" & request.form("LFinancePayment") & vbCrLf & vbCrLf
strMsgBody = strMsgBody & "Total: $" & request.form("LTotal") & " $" & request.form("LTotalPayment") & vbCrLf & vbCrLf

strMsgBody = strMsgBody & "Net Worth (Total Assets - Total Liabilities): $" & request.form("LNetWorth") & vbCrLf & vbCrLf
strMsgBody = strMsgBody & "Notes: " & request.form("LNoteScreen") & vbCrLf & vbCrLf


toReplyTo	= request.form("BEmailAddr")
sFrom		= ""
sFromName	= request.form("BFirstName") & " " & request.form("BLastName")
toAddress	= "jan_k@rogers.com"
toAddBcc	= ""
toSubj		= "JannaMorozova.com - Online Application"
toBody		= strMsgBody

dim msg
on error resume next
msg = SendMail( sFrom, sFromName, toAddress, toSubj, toBody, toReplyTo, toAddBcc )

response.redirect( "About.asp?msg=" & msg )
%>
