	</td>
</tr>
<tr>
	<td>
	
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="clsSmallText" style="margin-top: 30px; margin-bottom: 30px; font-size: 11px;">
		<tr>
			<td><img src="/images/clear.gif" alt="" width="10" height="1" border="0"></td>
			<td align="left" valign="bottom" style="padding: 0px 0px 0px 10px;" width="40%" nowrap>
				<a href="/Company.asp">Company</a> // <a href="/Hosting.asp">Hosting</a> // <a href="/Contacts.asp">Contacts</a>
				<p>
				&copy; 2004-2009<br>Roosoft Consulting Ltd.
			</td>
			<td align="left" valign="bottom" style="padding: 0px 10px 0px 0px;" width="20%" nowrap>
				<b>Create Website</b>
<%		for each menu_item in menu_items.keys
			if instr( menu_item, "/Create-Website" ) then %>
				<br>
				&raquo; <a href="<%= menu_item %>.asp"><%= menu_items( menu_item ) %></a>
<%			end if
		next %>
			</td>
			<td align="left" valign="bottom" style="padding: 0px 10px 0px 0px;" width="20%" nowrap>
				<b>Promote Website</b>
<%		for each menu_item in menu_items.keys
			if instr( menu_item, "/Promote-Website" ) then %>
				<br>
				&raquo; <a href="<%= menu_item %>.asp"><%= menu_items( menu_item ) %></a>
<%			end if
		next %>
			</td>
			<td align="left" valign="bottom" style="padding: 0px 10px 0px 0px;" width="20%" nowrap>
				<b>Outsource Work</b>
<%		for each menu_item in menu_items.keys
			if instr( menu_item, "/Outsource-Work" ) then %>
				<br>
				&raquo; <a href="<%= menu_item %>.asp"><%= menu_items( menu_item ) %></a>
<%			end if
		next %>
			</td>
			<td><img src="/images/clear.gif" alt="" width="10" height="1" border="0"></td>
		</tr>
		</table>
		
	
	</td>
</tr>
</table>

</div>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-4718659-4");
pageTracker._trackPageview();
} catch(err) {}</script>

</body>
</html>
