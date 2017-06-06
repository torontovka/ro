<!--#include file="./include/inc.header.asp"-->
<!--#include file="./include/inc.vbs.asp"-->
<%
function random_id
	
	dim ub, lb
	ub = 999999
	lb = 100000
	
	randomize( second( now ) + 60 )
	random_id = int( ( ub - lb + 1 ) * rnd + lb )
	
end function

dim order_id : order_id = random_id
dim event_id : event_id = cint(request("event"))
dim venue_id

select case event_id
case 15
	venue_id = 1
case 16
	venue_id = 2
case 17
	venue_id = 3
end select
%>
<div class="sub-header">
	<div class="sub-header-text sh-event">Event</div>
	<div class="sub-header-div"></div>
	<div class="sub-header-text">Venue</div>
</div>

<div class="event-row">
	<div class="event-block white" style="background-image: none;">
		<img src="./images/event_thumb_<%= event_id %>.jpg" class="thumb" border="0"/>
		<div class="title"><%= EventName(event_id) %></div>
		<div class="description"><%= EventDescription(event_id) %></div>
		<div class="location"><%= EventLocation(event_id) %></div>
		<div class="short-text"><%= EventText(event_id) %> <!--a href="#">Полный текст</a-->
		</div>
	</div>
	<div class="venue-block white">
		<img src="./images/venue_thumb_<%= venue_id %>.jpg" class="thumb" border="0"/>
		<div class="title"><%= VenueName(venue_id) %></div>
		<div class="location"><%= VenueAddress(venue_id) %></div>
		<!--div class="links"><a href="">Events</a> (1), <a href="#">Reviews</a> (0)</div-->
		<div class="short-text"><%= VenueDescription(venue_id) %> <!--a href="#">Полный текст</a--></div>
	</div>
</div>

<div class="sub-header">
	<div class="sub-header-text sh-tickets">Tickets</div>
	<div class="sub-header-text sh-price">Price</div>
	<div class="sub-header-text sh-qty">Quantity</div>
	<div class="sub-header-div"></div>
	<div class="sub-header-text sh-plan">Seating Plan</div>
</div>

<div id="tickets">

	<form name="payform" name="payform" ACTION="https://www.paypal.com/cgi-bin/webscr" method="post">
		<input type="hidden" name="return" value="http://www.roosoft.ca/sites/showonetickets.com/tickets.asp?event=<%=event_id%>&order=<%=order_id%>">
		<input type="hidden" name="rm" value="2">
		<input type="hidden" name="cmd" value="_xclick">
		<input type="hidden" name="business" value="reklama@torontovka.com">
		<input type="hidden" name="custom" value="<%=order_id%>">
		<input type="hidden" name="notify_url" value="http://www.roosoft.ca/sites/showonetickets.com/process.asp?event=<%=event_id%>">
		<input type="hidden" name="item_name" value="ShowOneTickets.com - Ticket order: <%=order_id%>">
		<input type="hidden" name="tax" value="0.00">
		<input type="hidden" name="amount" value="">
		<input type="hidden" name="no_shipping" value="1">
		<input type="hidden" name="shipping" value="0">
		<input type="hidden" name="currency_code" value="CAD">
		<input type="hidden" name="cancel_return" value="http://www.roosoft.ca/sites/showonetickets.com/tickets.asp?event=<%=event_id%>&order=error">
		<input type="hidden" name="no_note" value="0">
		<input type="hidden" name="orderid" value="<%=order_id%>">
	</form>

<%
select case event_id
case 15
%>
	<div class="purchase-row dark">
		<div class="ticket-box" style="background-color: #ff0000;"></div>
		<div class="ticket-name">Orcestra &ndash; Row H &ndash; Seats 8-14</div>
		<div class="ticket-price">$ 0.10</div>
		<div class="ticket-qty"><input type="text" class="ticketQty" name="tickets" id="O.H" value="0" lang="75" onKeyPress="return validateTicketQuantity(this, event);" onClick="this.select();" onKeyUp="calculateTotal();"></div>
	</div>
	<div class="purchase-row light">
		<div class="ticket-box" style="background-color: #ff0000;"></div>
		<div class="ticket-name">Orcestra &ndash; Row R &ndash; Seats 15-24</div>
		<div class="ticket-price">$ 0.12</div>
		<div class="ticket-qty"><input type="text" class="ticketQty" name="tickets" id="O.R" value="0" lang="65" onkeypress="return validateTicketQuantity(this, event);" onClick="this.select();" onKeyUp="calculateTotal();"></div>
	</div>
	<div class="purchase-row dark">
		<div class="ticket-box" style="background-color: #ffaa00;"></div>
		<div class="ticket-name">Balcony  &ndash; Row DD &ndash; Seats 1-11</div>
		<div class="ticket-price">$ 1.25</div>
		<div class="ticket-qty"><input type="text" class="ticketQty" name="tickets" id="B.DD" value="0" lang="55" onkeypress="return validateTicketQuantity(this, event);" onClick="this.select();" onKeyUp="calculateTotal();"></div>
	</div>
<%
case 17
%>
	<div class="purchase-row dark">
		<div class="ticket-box" style="background-color: #ff0000;"></div>
		<div class="ticket-name">Dance floor</div>
		<div class="ticket-price">$ 40.00</div>
		<div class="ticket-qty"><input type="text" class="ticketQty" name="tickets" id="FLR" value="0" lang="0.1" onKeyPress="return validateTicketQuantity(this, event);" onClick="this.select();" onKeyUp="calculateTotal();"></div>
	</div>
	<div class="purchase-row dark">
		<div class="ticket-box" style="background-color: #ffaa00;"></div>
		<div class="ticket-name">VIP Lounge</div>
		<div class="ticket-price">$ 60.00</div>
		<div class="ticket-qty"><input type="text" class="ticketQty" name="tickets" id="VIP" value="0" lang="0.15" onkeypress="return validateTicketQuantity(this, event);" onClick="this.select();" onKeyUp="calculateTotal();"></div>
	</div>
<%
case 16
%>
	<div class="purchase-row dark">
		<div class="ticket-name">Tickets are not yet available</div>
	</div>
<%
end select
%>

	<div class="sub-header">
		<div class="sub-header-text">Delivery Method</div>
	</div>

	<div class="purchase-row light">
		<div class="delivery-box"><input type="checkbox" checked disabled></div>
		<div class="delivery-name">Pickup at the venu</div>
		<div class="delivery-price">$ 0.00</div>
	</div>

	<div class="sub-header">
		<div class="sub-header-text">Total</div>
	</div>

	<div class="purchase-row light">
		<div class="total-item">Tickets:</div>
		<div class="total-amount" id="total-tickets-value">$ 0.00</div>
		<div class="total-qty" id="total-tickets-qty"></div>
	</div>

	<div class="purchase-row light">
		<div class="total-item">Service charge:</div>
		<div class="total-amount" id="total-service-charge"></div>
	</div>

	<div class="purchase-row light">
		<b>
			<div class="total-item">TOTAL:</div>
			<div class="total-amount" id="total-amount-value"></div>
		</b>
	</div>

	<div class="purchase-row dark" style="height:auto;">
		<img src="./images/img_payment_methods.gif" class="pic-payment-methods">
		<img src="./images/btn_pay_relaxed.png" class="btn-pay" onmouseover="this.src='./images/btn_pay_active.png'" onmouseout="this.src='./images/btn_pay_relaxed.png'" onmousedown="this.src='./images/btn_pay_pressed.png'" onmouseup="this.src='./images/btn_pay_active.png'" onclick="<% if event_id = 17 then %>completePurchase(false)<% else %>openSelectTickets()<% end if %>"/>
	</div>

	<div class="purchase-note">
		All sales are final, no exchange or refund.
	</div>

</div>

<div id="seating">

	<script>
	
		var transitionInAction = false;
	
		document.getElementsByClassName = function(cl)
		{
			var retnode = [];
			var myclass = new RegExp('\\b'+cl+'\\b');
			var elem = this.getElementsByTagName('*');
			for (var i = 0; i < elem.length; i++)
			{
				var classes = elem[i].className;
				if (myclass.test(classes)) retnode.push(elem[i]);
			}
			return retnode;
		};
		
		function numbersOnly ( field, e, dec )
		{
			if ( field.value == '0' )
				field.value = '';
			
			var key;
			var keychar;
			
			if (window.event)
				key = window.event.keyCode;
			else if (e)
				key = e.which;
			else
				return true;
			
			keychar = String.fromCharCode(key);
			
			// control keys
			if ((key==null) || (key==0) || (key==8) || 
				(key==9) || (key==13) || (key==27) )
				return true;
			
			// numbers
			else if ((("0123456789").indexOf(keychar) > -1))
				return true;
			
			// decimal point jump
			else if (dec && (keychar == "."))
			{
				field.form.elements[dec].focus();
				return false;
			}
			else
				return false;
		}
		
		function calculateTotal ()
		{
			var totalTickets = 0;
			var totalAmount = 0;
			var totalService = 0;
			var tickets = "";
		
			var qtyFields = document.getElementsByClassName('ticketQty');
			for ( var i = 0; i < qtyFields.length; i++ )
			{
				var qty = ( qtyFields[i].value == '' ) ? 0 : parseInt(qtyFields[i].value);

				totalTickets += 0 + qty;
				totalAmount += 0 + qty * parseFloat(qtyFields[i].lang);
				
				if ( parseFloat(qtyFields[i].lang) < 50 )
				{
					totalService += 0 + qty * 2.5;
				}
				else
				{
					totalService += 0 + qty * 3.5;
				}

				//tickets += qtyFields[i].id + "-" + (( qty == '' ) ? 0 : qty) + ","
			}
			
			totalService = ( totalTickets > 9 ) ? 25 : totalService;

			document.getElementById('total-tickets-qty').innerHTML			= totalTickets;
			document.getElementById('total-tickets-value').innerHTML		= '$ ' + (totalAmount).toFixed(2);
			document.getElementById('total-service-charge').innerHTML		= '$ ' + (totalService).toFixed(2);
			document.getElementById('total-amount-value').innerHTML			= '$ ' + (totalAmount + totalService).toFixed(2);
			document.getElementById('confirm-total-amount-value').innerHTML	= '$ ' + (totalAmount + totalService).toFixed(2);

			document.payform['amount'].value = totalAmount + totalService;

			//document.getElementById('total-tickets').value = tickets;
		}

		function validateTicketQuantity ( field, e )
		{
			return numbersOnly( field, e, false );
		}
		
		function switchSeatingPlan ( planId, imgType )
		{
			activeSeatingPlan = planId;
			document.getElementById('seating-plan').src = './images/plan_' + planId + '.' + imgType;
			
			for ( var i = 0; i < seatingPlanTypes.length; i++ )
			{
				if ( planId != seatingPlanTypes[i] )
				{
					document.getElementById( 'bptl-' + seatingPlanTypes[i] ).style.backgroundImage = 'url(./images/btn_sector_relaxed_left.png)';
					document.getElementById( 'bptr-' + seatingPlanTypes[i] ).style.backgroundImage = 'url(./images/btn_sector_relaxed_right.png)';
					document.getElementById( 'bptm-' + seatingPlanTypes[i] ).style.backgroundImage = 'url(./images/btn_sector_relaxed_middle.png)';
					document.getElementById( 'bpt-'  + seatingPlanTypes[i] ).style.color = '#666666';
				}
				else
				{
					document.getElementById( 'bptl-' + seatingPlanTypes[i] ).style.backgroundImage = 'url(./images/btn_sector_pressed_left.png)';
					document.getElementById( 'bptr-' + seatingPlanTypes[i] ).style.backgroundImage = 'url(./images/btn_sector_pressed_right.png)';
					document.getElementById( 'bptm-' + seatingPlanTypes[i] ).style.backgroundImage = 'url(./images/btn_sector_pressed_middle.png)';
					document.getElementById( 'bpt-'  + seatingPlanTypes[i] ).style.color = '#999999';
				}
			}
		}
		
		function closeSelectTickets ()
		{
			// hide popup
			document.getElementById('overlay').style.display = "none";
			document.getElementById('popup').style.display = "none";

			document.getElementById('seats').style.display = "block";
			document.getElementById('message').style.display = "none";
		}
		
		function openSelectTickets ()
		{
			calculateTotal();
			
			// display select seats rows
			var qtyFields = document.getElementsByClassName('ticketQty');
			var tmpHtml = "";
			var qtyTotal = 0;
				
			
			for ( var i = 0; i < qtyFields.length; i++ )
			{
				var qty = ( qtyFields[i].value == '' ) ? 0 : parseInt(qtyFields[i].value);
				if ( qty > 0 )
				{
					for ( var j = 0; j < qty; j++ )
					{
						tmpHtml += document.getElementById( 'ticket-row-' + qtyFields[i].id ).innerHTML;
					}
					qtyTotal += qty;
				}
			}
			
			if ( qtyTotal == 0 )
			{
				alert( "Please, select tickets" );
				return;
			}
				
			document.getElementById('selected-tickets-holder').innerHTML = tmpHtml;
			
			// show popup
			document.getElementById('overlay').style.display = "block";
			document.getElementById('popup').style.display = "block";
		}
		
		function completePurchase ( withTicketSelection )
		{
			if ( transitionInAction )
				return;
				
			var tickets = "";

			if ( withTicketSelection )
			{
				var allSelected = true;
				
				// check selected tickets
				for ( var i = 0; i < ticketTypes.length; i++ )
				{
					// R1[S1|S2|S3],R2[S1|S2|S3],R3[S1|S2|S3]
					
					tickets += ticketTypes[i] + "[";
					
					var selectedSeats = document.getElementsByClassName( 'seat-row-' + ticketTypes[i] );
					for ( var j = 0; j < selectedSeats.length - 1; j++ )
					{
						if ( selectedSeats[j].options.selectedIndex == 0 )
						{
							alert('Please, select seats for all tickets');
							return;
						}
						else
						{
							tickets += selectedSeats[j].options[selectedSeats[j].options.selectedIndex].value + "|";
						}
					}
					
					tickets += "],";
				}

				// UI
				document.getElementById('seats').style.cursor = 'wait';
				document.getElementById('loading').style.visibility = 'visible';
	
				var btnClose = document.getElementById('btn-close');
				if ( btnClose )
				{
					btnClose.onclick = 'return null';
					btnClose.style.cursor = 'wait';
				}

				var btnPay = document.getElementById('btn-pay');
				if ( btnPay )
				{
					btnPay.onclick = 'return null';
					btnPay.onmouseover = 'return null';
					btnPay.onmouseout = 'return null';
				}
			}
			else
			{
				var qtyFields = document.getElementsByClassName('ticketQty');
				var qtyTotal = 0;
				
				for ( var i = 0; i < qtyFields.length; i++ )
				{
					var qty = ( qtyFields[i].value == '' ) ? 0 : parseInt(qtyFields[i].value);
					tickets += qtyFields[i].id + '[' + qty + '],';
					qtyTotal += qty;
				}
				
				if ( qtyTotal == 0 )
				{
					alert( "Please, select tickets" );
					return;
				}
			}
			
			//alert( "http://www.roosoft.ca/sites/showonetickets.com/order.asp?event=<%= event_id %>&order=<%= order_id %>&amount=" + parseFloat(document.payform['amount'].value).toFixed(2) + "&tickets=" + tickets );
			
			// ajax: send order record to email
			SendRequest( "http://www.roosoft.ca/sites/showonetickets.com/order.asp?event=<%= event_id %>&order=<%= order_id %>&amount=" + parseFloat(document.payform['amount'].value).toFixed(2) + "&tickets=" + tickets, "order" );

			transitionInAction = true;
					
			// paypal: 
			document.payform['custom'].value = document.payform['custom'].value;
			document.payform.submit();
		}
		
		function handleOrder ( response )
		{
			if ( response.trim() == 'OK' )
			{
				document.payform.submit();
			}
			else
			{
				//alert( response );
			}
		}
		
		function validateSeatSelection ( self, row_id )
		{
			if ( self.options.selectedIndex == 0 )
			{
				return;
			}
			
			var selectedSeats = document.getElementsByClassName( 'seat-row-' + row_id );
			for ( var i = 0; i < selectedSeats.length - 1; i++ )
			{
				if ( selectedSeats[i] != self )
				{
					if ( selectedSeats[i].options[selectedSeats[i].options.selectedIndex].value == self.options[self.options.selectedIndex].value )
					{
						self.selectedIndex = 0;
					}
				}
			}
		}
		
	</script>

<%
select case event_id
case 15
%>
	<a class="btn-plan-type" id="bpt-1.1.1" onclick="if ( activeSeatingPlan != '1.1.1' ) { switchSeatingPlan('1.1.1','gif'); }">
		<div class="btn-plan-type-left" id="bptl-1.1.1">
			<div class="btn-plan-type-right" id="bptr-1.1.1">
				<div class="btn-plan-type-middle" id="bptm-1.1.1">ORCHESTRA</div>
			</div>
		</div>
	</a>

	<a class="btn-plan-type" id="bpt-1.1.2" onclick="if ( activeSeatingPlan != '1.1.2' ) { switchSeatingPlan('1.1.2','gif'); }">
		<div class="btn-plan-type-left" id="bptl-1.1.2">
			<div class="btn-plan-type-right" id="bptr-1.1.2">
				<div class="btn-plan-type-middle" id="bptm-1.1.2">BALCONY</div>
			</div>
		</div>
	</a>

	<img src="./images/plan_1.1.1.gif" id="seating-plan" style="display:block;margin-top:30px;position:relative;">
	<script>
		var activeSeatingPlan = '1.1.1';
		var seatingPlanTypes = new Array( '1.1.1', '1.1.2' );
		switchSeatingPlan('1.1.1','gif');
		var ticketTypes = new Array( 'O.H', 'O.R', 'B.DD' );
	</script>
<%
case 17
%>
	<a class="btn-plan-type" id="bpt-3.1.1" onclick="if ( activeSeatingPlan != '3.1.1' ) { switchSeatingPlan('3.1.1','jpg'); }">
		<div class="btn-plan-type-left" id="bptl-3.1.1">
			<div class="btn-plan-type-right" id="bptr-3.1.1">
				<div class="btn-plan-type-middle" id="bptm-3.1.1">VIP LOUNGE</div>
			</div>
		</div>
	</a>

	<a class="btn-plan-type" id="bpt-3.1.2" onclick="if ( activeSeatingPlan != '3.1.2' ) { switchSeatingPlan('3.1.2','jpg'); }">
		<div class="btn-plan-type-left" id="bptl-3.1.2">
			<div class="btn-plan-type-right" id="bptr-3.1.2">
				<div class="btn-plan-type-middle" id="bptm-3.1.2">DANCE FLOOR</div>
			</div>
		</div>
	</a>

	<img src="./images/plan_3.1.1.jpg" id="seating-plan" style="margin-top: 10px;">
	<script>
		var activeSeatingPlan = '3.1.1';
		var seatingPlanTypes = new Array( '3.1.1', '3.1.2' );
		switchSeatingPlan('3.1.1','jpg');
		var ticketTypes = new Array( 'VIP', 'FLR' );
	</script>
<%
end select
%>

</div>

	<div class="overlay" id="overlay" style="display:none;"></div>

	<div class="popup" id="popup" style="display:none;">
		<div class="wrapper">
			<div id="seats" class="form">

				<div class="sub-header">
					<div class="sub-header-text">Selected Tickets</div>
					<img src="./images/close.png" style="float:right;margin:7px 7px 0px 0px;cursor:pointer;" border="0" onclick="closeSelectTickets();">
				</div>
				
				<div id="selected-tickets-holder"></div>
				
				<div class="sub-header">
					<div class="sub-header-text">Amount</div>
				</div>
			
				<div class="purchase-row light">
					<b>
						<div class="total-item" style="width:40px;">TOTAL:</div>
						<div class="total-amount" id="confirm-total-amount-value"></div>
					</b>
				</div>
				
				<div class="purchase-row dark" style="height:auto;">
					<img src="./images/img_payment_methods.gif" class="pic-payment-methods">
					<img src="./images/btn_pay_relaxed.png" class="btn-pay" onmouseover="this.src='./images/btn_pay_active.png'" onmouseout="this.src='./images/btn_pay_relaxed.png'" onmousedown="this.src='./images/btn_pay_pressed.png'" onmouseup="this.src='./images/btn_pay_active.png'" onclick="completePurchase(true)"/><div id="loading">Please wait...</div>
				</div>
				
			</div>
			<div id="message" class="light">
				<div class="sub-header">
					<div class="sub-header-text">ALERT</div>
					<img src="./images/close.png" id="btn-close" style="float:right;margin:7px 7px 0px 0px;cursor:pointer;" border="0" onclick="closeSelectTickets();">
				</div>
				
				<div id="message-text"></div>
			</div>
		</div>
		
	</div>

	<div id="ticket-row-O.H" style="display:none;">
		<div class="purchase-row dark">
			<div class="ticket-box" style="background-color: #ff0000;"></div>
			<div class="ticket-name">Orcestra &ndash; Row H</div>
			<div class="ticket-price">Select seat:</div>
			<div class="ticket-qty">
				<select class="seat-row-O.H" onchange="validateSeatSelection(this,'O.H')">
					<option value=""></option>
					<option value="8" >8</option>
					<option value="9" >9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
				</select>
			</div>
		</div>
	</div>
		
	<div id="ticket-row-O.R" style="display:none;">
		<div class="purchase-row light">
			<div class="ticket-box" style="background-color: #ff0000;"></div>
			<div class="ticket-name">Orcestra &ndash; Row R</div>
			<div class="ticket-price">Select seat:</div>
			<div class="ticket-qty">
				<select class="seat-row-O.R" onchange="validateSeatSelection(this,'O.R')">
					<option value=""></option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
				</select>
			</div>
		</div>
	</div>
		
	<div id="ticket-row-B.DD" style="display:none;">
		<div class="purchase-row dark">
			<div class="ticket-box" style="background-color: #ffaa00;"></div>
			<div class="ticket-name">Balcony  &ndash; Row DD</div>
			<div class="ticket-price">Select seat:</div>
			<div class="ticket-qty">
				<select class="seat-row-B.DD" onchange="validateSeatSelection(this,'B.DD')">
					<option value=""></option>
					<option value="1" >1</option>
					<option value="2" >2</option>
					<option value="3" >3</option>
					<option value="4" >4</option>
					<option value="5" >5</option>
					<option value="6" >6</option>
					<option value="7" >7</option>
					<option value="8" >8</option>
					<option value="9" >9</option>
					<option value="10">10</option>
					<option value="11">11</option>
				</select>
			</div>
		</div>
	</div>

	<script>
<% if ( request( "order" ) = "error" ) then %>

		document.getElementById('seats').style.display = "none";
		document.getElementById('message-text').innerHTML = "<b>ERROR</b><br><br>Your order was not completed. Please try agian or contact administration.<br><br>Tel: (416) 555-1234";
		document.getElementById('message').style.display = "block";

		document.getElementById('overlay').style.display = "block";
		document.getElementById('popup').style.display = "block";

<% elseif ( request( "order" ) <> "" ) then %>

		document.getElementById('seats').style.display = "none";
		document.getElementById('message-text').innerHTML = "Your order was processes successfully.<br><br><b>Order: <%= request( "order" ) %></b><br><br>To get the ticket at the venue, please, bring your printed <b>PAYPAL RECIEPT</b> and a <b>PHOTO ID</b> to the cashier.<br><br>Enjoy the show.";
		document.getElementById('message').style.display = "block";

		document.getElementById('overlay').style.display = "block";
		document.getElementById('popup').style.display = "block";

<% else %>

		document.getElementById('seats').style.display = "block";
		document.getElementById('message').style.display = "none";

<% end if %>

		calculateTotal();
		
	</script>

<!--#include file="./include/inc.footer.asp"-->