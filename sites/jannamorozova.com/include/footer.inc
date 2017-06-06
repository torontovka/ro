		<div id="row2">
			<div class="indent">
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
					<td width="90" class="row2left"><img alt="" src="images/page1_img2.jpg" class="imgindent"/></td>
					<td>
						<table width="100%" borader="0">
						<tr>
							<td width="33%" class="rate" style="color:#990000"><b><u>Today's Rates</u></b></td>
							<td width="33%"></td>
							<td width="34%"></td>
						</tr>
						<tr>
							<td class="rate">6 Month: <span		  id="r6m"></span></td>
							<td class="rate">1 Year Closed: <span id="r1y"></span></td>
							<td class="rate">2 Year Closed: <span id="r2y"></span></td>
						</tr>
						<tr>	
							<td class="rate">3 Year Closed: <span id="r3y"></span></td>
							<td class="rate">4 Year Closed: <span id="r4y"></span></td>
							<td class="rate">5 Year Closed: <span id="r5y"></span></td>
						</tr>
						<tr>
							<td class="rate">Variable Rate: <span id="rvr"></span></td>
							<td></td>
							<td></td>
						</tr>
						</table>
						
						<script>
							
							function createXMLHttpRequest()
							{
								try { return new XMLHttpRequest(); } catch(e) {}
								try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) {}
								try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch (e) {}
								alert("XMLHttpRequest not supported");
								return null;
							}

							var xhReq = createXMLHttpRequest();
							xhReq.open( "GET", "get_rates.asp", true );

							var requestTimer = setTimeout( function()
							{
								xhReq.abort();
								// Handle timeout situation, e.g. Retry or inform user.
							}, 4000 );
							
							xhReq.onreadystatechange = function()
							{
							
								if ( xhReq.readyState != 4 )  { return; }
								
								clearTimeout( requestTimer );
								
								if ( xhReq.status != 200 )
								{
									// Handle error, e.g. Display error message on page
									return;
								}
								
								var serverResponse = xhReq.responseText;
								var rates = serverResponse.split("|");

								//alert( document.getElementById("r1y") );
								

								document.getElementById("r1y").innerHTML = rates[0];
								document.getElementById("r2y").innerHTML = rates[1];
								document.getElementById("r3y").innerHTML = rates[2];
								document.getElementById("r4y").innerHTML = rates[3];
								document.getElementById("r5y").innerHTML = rates[4];
								document.getElementById("r6m").innerHTML = rates[5];
								document.getElementById("rvr").innerHTML = rates[6];
							};
							
							xhReq.send(null);
						
							/*
							var xmlHttp = null;
							alert("helloworld");	

							try
							{	// Firefox, Opera 8.0+, Safari
								xmlHttp = new XMLHttpRequest();
							}
							catch (e)
							{	// Internet Explorer
							
							}
						
							if ( xmlHttp != null )
							{
								// Set handler
								xmlHttp.onreadystatechange = function ()
								{
									if( xmlHttp.readyState == 4 )
									{
										var response = xmlHttp.responseText;
										var rates = response.split("|");
										alert(response);
										
										document.getElementById("r1y").innerHtml = rates[0];
										document.getElementById("r2y").innerHtml = rates[1];
										document.getElementById("r3y").innerHtml = rates[2];
										document.getElementById("r4y").innerHtml = rates[3];
										document.getElementById("r5y").innerHtml = rates[4];
										document.getElementById("r6m").innerHtml = rates[5];
										document.getElementById("rvr").innerHtml = rates[6];
									}
								};
								
								// Send request
								xmlHttp.open( "GET", "http://www.moneyandmortgage.ca/rates.php", true );
								xmlHttp.send( null );
							}
							else
							{
								// Browser doesn't support Ajax
							}
							*/
						
						</script>
						
					</td>
				</tr>
				</table>
			</div>
		</div>
		
	</div>

	<div id="footer">
		<ul class="menu">
			<li><a href="About.asp">About Me</a></li>
			<!--li><a href="Rates.html">Rates</a></li>
			<li><a href="News.html">News</a></li>
			<li><a href="Help.html">Help</a></li-->
			<li><a href="Apply.asp">Apply Online</a></li>
			<li><a href="Contacts.asp">Contacts</a></li>
			<li class="last"><a href="http://www.moneyandmortgage.ca">My Magazine</a></li>
		</ul>
		2009 &copy; Copyright Janna Morozova. All rights reserved.
	</div>
</div>