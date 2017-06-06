<%	sub print_cw ( show_subitems ) %>
				<img src="/images/sub_web-create.gif" alt="" border="0">
				<div style="margin: 0px 20px 20px 0px; line-height: 24px;" id="cw">
					<a href="/Create-Website/Turn-Key-Solution.asp" class="clsLinkWebC">Turn Key Solution</a>
					<br>
					<a href="/Create-Website/Content-Management-System.asp" class="clsLinkWebC">Content Management System</a>
					<br>
					<a href="/Create-Website/Traffic-Management.asp" class="clsLinkWebC">Traffic Management</a>
					<br>
					<a href="/Create-Website/E-Commerce.asp" class="clsLinkWebC">E-Commerce</a>
					<br>
					<a href="/Create-Website/Portfolio.asp" class="clsLinkWebC">Website Portfolio</a>
				</div>
<%	end sub %>

<%	sub print_pw ( show_subitems ) %>
				<img src="/images/sub_web-promo.gif" alt="" border="0">
				<div style="margin: 0px 20px 20px 0px; line-height: 24px;" id="pw">
					<a href="/Promote-Website/Search-Engine-Optimization.asp" class="clsLinkWebP">Search Engine Optimization</a>
					<br>
					<a href="/Promote-Website/Pay-Per-Click.asp" class="clsLinkWebP">Pay-Per-Click Marketing</a>
					<br>
					<a href="/Promote-Website/Affiliate-Marketing.asp" class="clsLinkWebP">Affiliate Marketing</a>
					<br>
					<a href="/Promote-Website/Email-Marketing.asp" class="clsLinkWebP">Email Marketing</a>
					<br>
					<a href="/Promote-Website/Internet-Marketing-Research.asp" class="clsLinkWebP">Internet Marketing Research</a>
				</div>
<%	end sub %>

<%	sub print_ow ( show_subitems ) %>
				<img src="/images/sub_outsource.gif" alt="" border="0">
				<div style="margin: 0px 20px 20px 1px; line-height: 24px;" id="ow">
					<a href="/Outsource-Work/Software-Development.asp" class="clsLinkOutP">Software Developement</a>
					<br>
					<a href="/Outsource-Work/IT-Project-Management.asp" class="clsLinkOutP">IT Project Management</a>
					<br>
					<a href="/Outsource-Work/Telemarketing.asp" class="clsLinkOutP">Telemarketing</a>
					<br>
					<a href="/Outsource-Work/Customer-Support.asp" class="clsLinkOutP">Customer Support</a>
					<br>
					<a href="/Outsource-Work/Business-Design.asp" class="clsLinkOutP">Business Design</a>
				</div>
<%	end sub %>

<%
select case active_page
case "cw"
	print_cw true
	print_pw false
	print_ow false
case "pw"
	print_pw true
	print_ow false
	print_cw false
case "ow"
	print_ow true
	print_pw false
	print_cw false
end select
%>