<%
Dim strSQL, login, passwd
Dim I, J, sentOn, SentEmail

strSQL = "SELECT email FROM Emails"
Set conn_in = Server.CreateObject("ADODB.Connection")
conn_in.open application( "tr.connection.string" )

Set rec = Server.CreateObject("ADODB.Recordset")
rec.open strSQL, conn_in, 3, 1, &H0001


do while not rec.eof
%>
<%= rec("email") & vbclrf %>
<%
rec.moveNext
Loop

rec.close
set rec = nothing
conn_in.close
set conn_in  = nothing
%>