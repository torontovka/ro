<!--#include file="./include/inc.header.asp"-->
<!--#include file="./include/inc.vbs.asp"-->

<div id="index-promo">
	<span class="title">Би-2: Полковнику никто не пишет...</span><!--span class="title" style="margin-top: -5px;">солист Денис Мацуев</span-->
</div>

<script>

	function signup ()
	{
		var sname = document.getElementById("signup-name").value;
		var smail = document.getElementById("signup-mail").value;

		SendRequest( "http://www.roosoft.ca/sites/showonetickets.com/signup.asp?name=" + sname + "&email=" + smail, "signup" );
	}
	
</script>

<div id="membership-signup">
	<input type="text" name="name" id="signup-name" class="member-signup-name" value="Email"	onclick="if(this.value=='Email'){this.value='';}" onblur="if(this.value.trim()==''){this.value='Email';}"/>
	<input type="text" name="mail" id="signup-mail" class="member-signup-mail" value="Name"	onclick="if(this.value=='Name'){this.value='';}"  onblur="if(this.value.trim()==''){this.value='Name';}"/>
	<img src="./images/btn_signup_relaxed.png" onmouseover="this.src='./images/btn_signup_active.png'" onmouseout="this.src='./images/btn_signup_relaxed.png'" onmousedown="this.src='./images/btn_signup_pressed.png'" onmouseup="this.src='./images/btn_signup_active.png'" onclick="signup();"/>
</div>

<div class="sub-header" style="margin-top: 8px;">
	<div class="sub-header-text sh-events">Events</div>
	<div class="sub-header-div"></div>
	<div class="sub-header-text">Venues</div>
</div>

<div class="event-row">
	<a href="tickets.asp?event=15">
		<div class="event-block dark">
				<img src="./images/event_thumb_15.jpg" class="thumb" border="0"/>
				<div class="title"><%= EventName(15) %></div>
				<div class="description"><%= EventDescription(15) %></div>
				<div class="location"><%= EventLocation(15) %></div>
		</div>
	</a>
	<div class="venue-block dark">
		<a href="tickets.asp?event=15">
			<img src="./images/venue_thumb_1.jpg" class="thumb" border="0"/>
			<div class="title"><%= VenueName(1) %></div>
			<div class="location"><%= VenueLocation(1) %></div>
		</a>
		<!--div class="links"><a href="">Events</a> (1), <a href="#">Reviews</a> (0)</div-->
	</div>
</div>

<div class="event-row">
	<a href="tickets.asp?event=17">
		<div class="event-block dark">
			<img src="./images/event_thumb_17.jpg" class="thumb" border="0"/>
				<div class="title"><%= EventName(17) %></div>
				<div class="description"><%= EventDescription(17) %></div>
				<div class="location"><%= EventLocation(17) %></div>
		</div>
	</a>
	<div class="venue-block dark">
		<a href="tickets.asp?event=17">
			<img src="./images/venue_thumb_3.jpg" class="thumb" border="0"/>
			<div class="title"><%= VenueName(3) %></div>
			<div class="location"><%= VenueLocation(3) %></div>
		</a>
		<!--div class="links"><a href="">Events</a> (1), <a href="#">Reviews</a> (0)</div-->
	</div>
</div>

<!--
<div class="event-row">
	<a href="tickets.asp?event=16">
		<div class="event-block light">
			<img src="./images/event_thumb_16.jpg" class="thumb" border="0"/>
				<div class="title"><%= EventName(16) %></div>
				<div class="description"><%= EventDescription(16) %></div>
				<div class="location"><%= EventLocation(16) %></div>
		</div>
	</a>
	<div class="venue-block light">
		<a href="tickets.asp?event=16">
			<img src="./images/venue_thumb_2.jpg" class="thumb" border="0"/>
			<div class="title"><%= VenueName(2) %></div>
			<div class="location"><%= VenueLocation(2) %></div>
		</a>
		<div class="links"><a href="">Events</a> (1), <a href="#">Reviews</a> (0)</div>
	</div>
</div>
-->

<!--#include file="./include/inc.footer.asp"-->
