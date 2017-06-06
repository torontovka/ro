<%	sub print_cw ( show_subitems ) %>
				<img src="/images/sub_web-create.gif" alt="" border="0">
				<div style="margin: 0px 20px 20px 0px; line-height: 24px;" id="cw">
<%		dim menu_item
		for each menu_item in menu_items.keys
			if instr( menu_item, "/Create-Website" ) then
				if ( active_page = menu_item ) then %>
					<span class="clsLinkActive"><%= menu_items( menu_item ) %></span>
					<br>
<%				else
%>
					<a href="<%= menu_item %>.asp" class="clsLinkWebC"><%= menu_items( menu_item ) %></a>
					<br>
<%				end if

			end if
		next %>
				</div>
<%	end sub %>

<%	sub print_pw ( show_subitems ) %>
				<img src="/images/sub_web-promo.gif" alt="" border="0">
				<div style="margin: 0px 20px 20px 0px; line-height: 24px;" id="cw">
<%		dim menu_item
		for each menu_item in menu_items.keys
			if instr( menu_item, "/Promote-Website" ) then
				if ( active_page = menu_item ) then %>
					<span class="clsLinkActive"><%= menu_items( menu_item ) %></span>
					<br>
<%				else
%>
					<a href="<%= menu_item %>.asp" class="clsLinkWebP"><%= menu_items( menu_item ) %></a>
					<br>
<%				end if

			end if
		next %>
				</div>
<%	end sub %>

<%	sub print_ow ( show_subitems ) %>
				<img src="/images/sub_outsource.gif" alt="" border="0">
				<div style="margin: 0px 20px 20px 0px; line-height: 24px;" id="cw">
<%		dim menu_item
		for each menu_item in menu_items.keys
			if instr( menu_item, "/Outsource-Work" ) then
				if ( active_page = menu_item ) then %>
					<span class="clsLinkActive"><%= menu_items( menu_item ) %></span>
					<br>
<%				else
%>
					<a href="<%= menu_item %>.asp" class="clsLinkOutW"><%= menu_items( menu_item ) %></a>
					<br>
<%				end if

			end if
		next %>
				</div>
<%	end sub %>

<%
print_cw true
print_pw false
print_ow false
%>