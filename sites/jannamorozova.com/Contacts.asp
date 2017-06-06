<%
option explicit
dim page : page = 4
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	<!--#include file="./include/meta.inc"-->

	<script src="maps" type="text/javascript"></script>
	<script src="main.js" type="text/javascript"></script>
	<script src="MT12.js" type="text/javascript"></script>
	<script src="mod_jslinkermod_stats.js" charset="UTF-8" type="text/javascript"></script> 
	<script src="mod_dragmod_controls_apimod_api_gc.js" charset="UTF-8" type="text/javascript"></script>
	<script type="text/javascript" src="google_map.js"></script>
	<script>window.addEvent('domready', iniWin );</script>

</head>

<body id="index_5">

	<!--#include file="./include/header.inc"-->
	
	<div id="row1">
		<div class="indent">
			<div class="container line" style="background:transparent url(images/line_ver.gif) repeat-y scroll 210px 0">
				<div class="column1" style="width:250px">
					<div class="column_padding1">
					
						<div class="title">
							<div class="left_bg">
								<h1>Contacts</h1>
							</div>
						</div>
						
						<strong>Janna Morozova</strong>
						<br/>
						Mortgage Specialist
						<p>
						<span style="width:100px">Mobile:</span> (647) 296-5262
						<br/>
						<span style="width:100px">FAX:</span> (416) 465-6165
						<br/>
						E-mail: <a href="mailto:janna@rogers.com">jan_k@rogers.com</a></p>
						<p>
						1118 center Street
						<br/>
						Toronto, ON L4J 7R9
						<br/>
						Canada
					</div>
				</div>
				<div class="column2" style="width:460px;padding:10px;">
					
					<strong>MAP</strong>
					<br>
			        <div class=googlemap id=map></div>
			        <script type="text/javascript">
			        	setMap( 'map' , 'L4J 7R9' );                  
			        </script>

				</div>
			</div>
		</div>
	</div>

	<!--#include file="./include/footer.inc"-->

</body>
</html>