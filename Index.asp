		<p>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 40px;" class="clsText">
		<tr>
			<td><img src="/images/clear.gif" alt="" width="20" height="1" border="0"></td>
			<td width="33%" valign="top">
				<img src="/images/arr_web-create.gif" alt="" border="0"><img src="/images/sub_web-create.gif" alt="Create Website - Design + Develope + Manage" title="Create Website - Design + Develope + Manage" border="0">
				<div style="margin: 20px 20px 20px 48px; line-height: 18px;">
					Having an effective website creates an edge over your competition and helps bring new customers.
					<p>
					We offer highly effective information driven web sites that respond to your business needs.
					<p>
					<span style="line-height: 24px;">
<%		for each menu_item in menu_items.keys
			if instr( menu_item, "/Create-Website" ) then %>
						<a href="<%= menu_item %>.asp" class="clsLinkWebC"><%= menu_items( menu_item ) %></a>
						<br>
<%			end if
		next %>
					</span>
				</div>
			</td>
			<td width="34%" valign="top">
				<img src="/images/arr_web-promo.gif" alt="" border="0"><img src="/images/sub_web-promo.gif" alt="" border="0">
				<div style="margin: 20px 20px 20px 48px; line-height: 18px;">
					Making your website visible to potential customers is the key to running a successful business.
					<p>
					Appear in top search results for your targeted search phrases and keep your clients comming back.
					<p>
					<span style="line-height: 24px;">
<%		for each menu_item in menu_items.keys
			if instr( menu_item, "/Promote-Website" ) then %>
						<a href="<%= menu_item %>.asp" class="clsLinkWebP"><%= menu_items( menu_item ) %></a>
						<br>
<%			end if
		next %>
					</span>
				</div>
			</td>
			<td width="33%" valign="top">
				<img src="/images/arr_outsource.gif" alt="" border="0"><img src="/images/sub_outsource.gif" alt="" border="0">
				<div style="margin: 20px 20px 20px 48px; line-height: 18px;">
					Developing IT solutions in a budget effective manner is the key to success of any IT project.
					<p>
					We offer highly effective outsourced project management services based of Agile environment paradigm.
					<p>
					<span style="line-height: 24px;">
<%		for each menu_item in menu_items.keys
			if instr( menu_item, "/Outsource-Work" ) then %>
						<a href="<%= menu_item %>.asp" class="clsLinkOutW"><%= menu_items( menu_item ) %></a>
						<br>
<%			end if
		next %>
					</span>
				</div>
			</td>
			<td><img src="./images/clear.gif" alt="" width="20" height="1" border="0"></td>
		</tr>
		</table>