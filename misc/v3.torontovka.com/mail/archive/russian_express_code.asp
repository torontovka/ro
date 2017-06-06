<%
	dim rusExpressList
	set rusExpressList = GetRussianExpressNews
	
	if rusExpressList.size > 0 then %>

	<!-- RUSSIAN EXPRESS -->
		<div id="express">
		<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 4px;"><tr><td><img src="http://www.torontovka.com/images/sheaders/russianexpress_ru.gif" height="20" alt="Russian Express on Torontovka"></td></tr></table>		
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: solid 2px #dfdfdf">
		<tr>
			<td style="padding: 0px 4px 4px 4px;" class="clsDefaultText">
<%
		SetCodePage 1252
		
		for i = rusExpressList.startIndex() to rusExpressList.size()
			RenderNewsHeadline( rusExpressList.data(i) )
		next
		
		RestoreCodePage
%>

			<nobr style="width: 100%; text-align: right; margin-top: 2px;"><a href="http://www.torontovka.com/?key=today.russianexpress.indx"><%= GetMessage( "Label.Today.RussianExpress" ) %> »</a></nobr>
			
			</td>
		</tr>
		</table>
		</div>

	<!-- / RUSSIAN EXPRESS -->

<%
	end if
	
	set rusExpressList = nothing
%>
