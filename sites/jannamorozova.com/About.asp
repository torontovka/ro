<%
option explicit
dim page : page = 2
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	<!--#include file="./include/meta.inc"-->
	
</head>

<body id="index"<% if request("msg") <> "" then %> onload="alert('<%=request("msg")%>');"<% end if %>>

	<!--#include file="./include/header.inc"-->

	<div id="row1">
		<div class="indent">
			<div class="container line">
			
				<div class="column1">
					<div class="column_padding1">
						<img alt="" src="images/janna.jpg" width="160" height="160" />
						<p>
						<strong style="font-size:12px">Janna Morozova</strong>
						<br/>
						Mortgage Specialist
						<p>
						Mobile: (647) 296-5262
						<br>
						Fax: (416) 465-6165
						<p>
						License number: M08004474
					</div>
				</div>
				
				<div class="column2">
					<div class="title1">Welcome</div>
					<br />
					<div class="text1">
						I am a Dedicated Mortgage Professional. I come from an extensive Real Estate background and hold a Masters degree in Civil Engineering from Moscow University. I provide my clients with the easiest and most stress free way of getting a mortgage. I look forward to helping you and your clients with any financial questions and needs.
						<br />
					</div>
					<div class="box">
						<div class="corner_bottom_left">
							<div class="corner_top_right">
								<div class="corner_top_left">
									<div class="indent" style="height:65px;">
										<img alt="" src="images/page1_img1.jpg" class="imgindent" />
										<div style="float:left;margin-top:6px;">
											<strong>Office: </strong>
											<br>
											1118 Center Street
											<br>
											Thornhill, ON L4J 7R9
										</div>
										<div class="title" style="margin-top:50px;"><a href="Contacts.html" class="link" style="padding:0px;">View map</a></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<!--#include file="./include/footer.inc"-->

</body>
</html>