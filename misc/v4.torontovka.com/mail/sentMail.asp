<% Response.Expires=-1 %>
<%
' BEGIN USER CONSTANTS
Dim strSQL1         'SQL command to execute
Dim objPagingConn   'The ADODB connection object
Dim objPagingRS     'The ADODB recordset object
Dim I			'Loop counter
Dim SentEmail       'Currently sent email 

Server.ScriptTimeout = 18000

'CONN_STRING = "DSN=rtd; UID=rtd; PWD=p0tsidla;"
strSQL = "Select * from EmailsSent"

Set objPagingConn = Server.CreateObject("ADODB.Connection")
objPagingConn.Open application ( "tr.connection.string" )

' Create recordset and set the page size
Set objPagingRS = Server.CreateObject("ADODB.Recordset")

' Open RS
objPagingRS.Open strSQL, objPagingConn, 3, 1, &H0001 

If (Request.QueryString("action") = "Remove") then
	strSQL1 = "delete from EmailsSent"
	objPagingConn.Execute strSQL1
End If	 
%>
<body bgcolor="ffffe0">
<p>
<% if (objPagingRS.RecordCount <> 0) then %>
There is a total of <b><font color="red" size=+1> <% =objPagingRS.RecordCount %></font></b> sent emails in the system.
<p>
 <table border=1>
   <TR>
     <TD>
		Number
     </TD>
     <TD>
		Email
	</TD>	
	<TD>
		Sent
	</TD>	
   </TR>  
 <% objPagingRS.MoveFirst
 dim oField
  Do while Not objPagingRS.EOF %>
	<% I = I + 1 %>
	<TR>
	<td>
		<% Response.Write I %>
	  </td>	
	  <td>
	  <% Response.Write objPagingRS("email") %>
	  </td>
	  <td>
	  <% Response.Write objPagingRS("sent") %>
	  </td>
	  <% objPagingRS.MoveNext %>
	</TR>
 <% response.flush
 Loop %>
 </table>	  
<p>
<form method="get" action="sentMail.asp">
<input type="hidden" value="Remove" name="action">
Remove everything from Sent Emails table <input type="submit" value="Remove">
</form>
<p>	
<%
 objPagingRS.Close
 set objPagingRS=Nothing 
	
%>
<% else %>
<% objPagingRS.Close
  Set objPagingRS = Nothing
%>
<table width="600">
<tr>
  <td>
The table is empty
  </td>
</tr>
</table>  

<% end if %>
</body>
</html>
