<%
url = "http://www.moneyandmortgage.ca/rates.php" 
set xmlhttp = CreateObject("MSXML2.ServerXMLHTTP") 
xmlhttp.open "GET", url, false 
xmlhttp.send "" 
response.write xmlhttp.responseText 
set xmlhttp = nothing 
%>