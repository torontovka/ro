<%@ LANGUAGE="VBScript" CodePage=1251 %>
<% option explicit %>
<html>
<head><title></title>
<link rel="stylesheet" type="text/css" href="http://www.torontovka.com/css/classes.css">
    <meta http-equiv="Content-Language" content="ru">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251"> 
</head>
<body>


<!--#include virtual="/scripts/classes.vbs"--> 
<!--#include virtual="/scripts/guiapi.vbs"--> 
<!--#include virtual="/scripts/dbapi.vbs"--> 
<!--#include virtual="/scripts/newsapi.vbs"-->
<!--#include virtual="/include/todb.asp"-->


<!-- TOP BANNER -->
<a href="http://www.bestrussiantv.com" target="_new"><img src="http://www.torontovka.com/absolutebm/banners/Torontovka/bestrussiantv_newyear_468x60.gif" border="0"></a><br>
<p>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
	<td width="232" valign="top" class="clsDefaultText">
	<img src="http://www.torontovka.com/images/mail_logo.gif" style="margin-bottom: 8px;">
	<br>
	<!--a href="http://www.torontovka.com/?key=life.night.parties" target="_new">Концерты в Торонто, Лебедев советует и предупреждает</a-->
	
<%
dim dailyNewsList
set dailyNewsList = GetDailyNews

if dailyNewsList.size > 0 then
%>
	<!-- DAILY NEWS -->

		<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px;"><tr><td><img src="http://www.torontovka.com/images/sheaders/news_ru.gif" height="20" alt="Funny and usefull articles and information in Torontovka magazine."></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: solid 2px #c1c1c1">
		<tr>
			<td style="padding: 0px 4px 4px 4px;" class="clsDefaultText">
<%
	for i = dailyNewsList.startIndex() to dailyNewsList.size()
		RenderNewsHeadline( dailyNewsList.data(i) )
	next
%>

			<nobr style="width: 100%; text-align: right; margin-top: 2px;"><a href="http://www.torontovka.com//?key=today.news.indx">Все <%= GetMessage( "Menu.Today.News" ) %> »</a></nobr>
			
			</td>
		</tr>
		</table>

	<!-- / DAILY NEWS -->
<%
end if
%>

<!-- MaxRiga TV Start -->
	<p>
	<b>Видео Обзор Канадских Новостей За Неделю</b><br>
	<a href="mms://38.117.74.151/rtd/maxriga/news.wmv"><img src="http://www.torontovka.com/images/maxriga.jpg" border="0" alt="Видео Обзор Канадских Новостей За Неделю - MaxRigaTV" style="cursor:hand"></a>
	
<!-- MaxRiga TV End -->
	
	<!-- MAGAZINE -->

	<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px;"><tr><td><img src="http://www.torontovka.com/images/sheaders/magazine_ru.gif" height="20" alt="Funny and usefull articles and information in Torontovka magazine."></td></tr></table>
		
		<div id="magazine">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: solid 2px #dfdfdf">
		<tr>
			<td style="padding: 0px 4px 4px 4px" class="clsDefaultText">
<%
	dim sql, oMagCon, oMagRec
	
	set oMagCon = server.createObject( "ADODB.Connection" )
	oMagCon.open application( "tr.connection.string" )
	
	set oMagRec = oMagCon.execute( "SELECT rub.id as rub_id, rub.name as rub_name, rub.description as rub_desc, art.id as art_id, art.title as art_title, art.timeAdded as timeAdded, aut.id as aut_id, aut.name as aut_name FROM art_Rubrika as rub, art_Article as art, art_Author as aut WHERE rub.id = art.rubrika AND art.author = aut.id AND rub.active=1 ORDER BY priority, rub_id, art.timeAdded DESC" )
	
	dim currRubrika : currRubrika = -1
	if not oMagRec.bof and not oMagRec.eof then
		do until oMagRec.eof
			if currRubrika <> cInt( oMagRec( "rub_id" ) ) then
%>
				
		
				<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px;">
				<tr>
					<td valign="top"><img src="http://www.torontovka.com/images/li.gif" style="margin: 1px 4px 0px 2px;"></td>
					<td class="clsDefaultText">
						<a href="http://www.torontovka.com/default.asp?key=life.magazine.article&art_id=<%= oMagRec( "art_id" ) %>"><b><%= oMagRec( "art_title" ) %></b></a>
						<br>
						<a href="http://www.torontovka.com/default.asp?key=life.magazine.rubrika&rub_id=<%= oMagRec( "rub_id" ) %>" style="color: #999999;"><%= oMagRec( "rub_name" ) %></a>
					</td>
				</tr>
				</table>

				<table style="margin: 8px 0px 4px 0px" width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0"><tr><td></td></tr></table>
<%
				currRubrika = cInt( oMagRec( "rub_id" ) )
			end if
			oMagRec.moveNext
		loop
	end if
	
	oMagRec.close
	set oMagRec = nothing
	oMagCon.close
	set oMagCon = nothing
%>
			<nobr style="width: 100%; text-align: right;"><a href="http://www.torontovka.com/?key=life.magazine.indx"><%= GetMessage( "Menu.Life.Magazine" ) %> »</a></nobr>

			</td>
		</tr>
		</table>
		</div>
		
	<!-- / MAGAZINE -->
	
	<!-- VIDEO -->
<%
	dim videos
	set videos = New List
	videos.add( CreateVideoObject( "/enter/video/images/shvedova_zolushka.jpg", "mms://38.117.74.151/rtd/shvedova_zolushka.wmv", "Всё на Продажу или Съёмки Спектакля Золушка в Колонии для Несовершеннолетних Преступниц", "", "Toronto, October 26, 2007" ) )
	videos.add( CreateVideoObject( "/enter/video/images/galcev.jpg", "mms://38.117.74.151/rtd/galcev.wmv", "Юрий Гальцев и Геннадий Ветров", "", "Toronto, October 21, 2007" ) )
	videos.add( CreateVideoObject( "/enter/video/images/terem.jpg", "mms://38.117.74.151/rtd/terem.wmv", "Квартет Терем", "", "" ) )
	videos.add( CreateVideoObject( "/enter/video/images/bodrov.jpg", "mms://38.117.74.151/rtd/bodrov.wmv", "Сергей Бодров (Старший)", "", "Toronto, September 8, 2007" ) )
	videos.add( CreateVideoObject( "/enter/video/images/xor_monastir.jpg", "mms://38.117.74.151/rtd/xor_monastir.wmv", "Хор Московского Сретенского Монастыря", "", "Toronto, September 8, 2007" ) )
	videos.add( CreateVideoObject( "/enter/video/images/allakadysh.jpg", "mms://38.117.74.151/rtd/AllaKadysh@Courthouse-NeSprosili.wmv", "Alla Kadysh @ Courthouse", "", "Toronto, May 16, 2007" ) )
	videos.add( CreateVideoObject( "/enter/video/images/baskov.jpg", "mms://38.117.74.151/rtd/baskov.wmv", "Николай Басков", "", "Toronto, March 16, 2007" ) )

	%>
	
	<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px;"><tr><td><img src="http://www.torontovka.com/images/sheaders/video_ru.gif" height="20" alt="Music video, funny clips, interview and much more."></td></tr></table>
		
		<div id="video">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: solid 2px #dfdfdf">
		<tr>
			<td style="padding: 4px" class="clsDefaultText">

<%
	dim i
	for i = videos.startIndex to videos.size %>
			<table cellpadding="0" cellspacing="0" border="0" style="margin: 6px 0px 6px 0px;">
			<tr>
				<td class="clsDefaultText">

					<table cellpadding="0" cellspacing="0" border="0" style="margin: 0px 5px 2px 0px;" align="left">
					<tr>
						<td><a href="<%= videos.data(i).video %>"><img src="<%= videos.data(i).image %>" width="90" border="0" class="clsBorderImage"></a></td>
					</tr>
					</table>
			
					<b><a href="<%= videos.data(i).video %>"><%= videos.data(i).title %></a></b>
					<br><%= videos.data(i).effectiveDate %>
					
				</td>
			</tr>
			</table>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0"><tr><td></td></tr></table>

<%	next %>
			<nobr style="width: 100%; text-align: right; margin-top: 2px;"><a href="http://www.torontovka.com/?key=enter.video.indx"><%= GetMessage( "Menu.Enter.Video" ) %> »</a></nobr>

			</td>
		</tr>
		</table>
		</div>

<%
	set videos = nothing
%>
	<!-- / VIDEO -->

		<!-- BUSINESSES -->

		<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px;"><tr><td><img src="http://www.torontovka.com/images/sheaders/businesses_ru.gif" height="20" alt="Russian Toronto Business Directory. Бизнес Справочник Русского Торонто"></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: solid 2px #dfdfdf">
		<tr>
			<td style="padding: 0px 4px 4px 4px" class="clsDefaultText">

				<table cellpadding="0" cellspacing="0" border="0" style="margin: 8px;">
<%
	dim categories
	set categories = GetCategories
	
	for i = categories.StartIndex to categories.Size
%>
				<tr>
					<td valign="top"><img src="http://www.torontovka.com/images/li.gif" style="margin: 1px 4px 0px 0px;"></td>
					<td valign="top" class="clsDefaultText"><a href="http://www.torontovka.com/?key=masterpages.businesses.indx"><%= categories.data(i).name %></a></td>
				</tr>
				<tr><td colspan="2"><img src="http://www.torontovka.com/images/clear.gif" width="1" height="6" border="0"></td></tr>
<%
	next
%>
				</table>

				<table style="margin: 8px 0px 4px 0px" width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0"><tr><td></td></tr></table>

				<nobr style="width: 100%; text-align: right;"><a href="http://www.torontovka.com/?key=masterpages.businesses.indx"><%= GetMessage( "Menu.MasterPages.Businesses" ) %> »</a></nobr>

			</td>
		</tr>
		</table>
		
	<!-- / BUSINESSES -->

	</td>
	<td><img src="http://www.torontovka.com/images/clear.gif" width="4" height="1" border="0"></td>
	<td width="232" valign="top" class="clsDefaultText">
<%
randomize
dim numberOfAds : numberOfAds = 4
dim adIndex : adIndex = round( rnd() * 100 ) mod numberOfAds
%>
		<!--a href="http://www.torontovka.com/?key=life.dating.indx"><img src="http://www.torontovka.com/images/ads/front_ad_en.jpg" border="0" style="margin: 0px"></a-->

	<!-- EVENTS PROMO -->
	<a href="http://www.torontovka.com/?key=masterpages.businesses.add"><b>Ваш бизнес ещё не в нашем справочнике? Срочно добавьте и дайте миру знать о себе!</b></a>
	<!--object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="232" height="38">
	<param name="movie" value="http://www.torontovka.com/absolutebm/banners/TMK/boogie69.swf?url=$$URL$$">
	<param name="quality" value="high">
	<embed src="http://www.torontovka.com/absolutebm/banners/TMK/boogie69.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="232" height="38"></embed></object>

	<!--a href="http://www.torontovka.com/?key=life.afisha.today&day=19&month=5&year=2007" target="_new"><img src="http://www.torontovka.com/absolutebm/banners/Slon/redflot_232x38.jpg" border="0"></a> <br><br>
	<a href="http://www.torontovka.com/?key=life.afisha.today&day=16&month=6&year=2006#10154" target="_new"><img src="http://www.torontovka.com/absolutebm/banners/Slon/cognac232x38.jpg" border="0"></a> <br><br-->
	<!--a href="http://www.torontovka.com/?key=life.afisha.today&day=16&month=9&year=2006" target="_new"><img src="http://www.torontovka.com/absolutebm/banners/Slon/osvod_232x38.jpg" border="0"></a-->
	<!--a href="http://www.torontovka.com/?key=life.afisha.today&day=5&month=11&year=2005"><img src="http://www.torontovka.com/absolutebm/banners//cccp/russiannight_banner_3bynix.gif" border="0"></a-->
	
	<!--object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="232" height="38">
		<param name="movie" value="http://www.torontovka.com/absolutebm/banners/CasaBlanca/casa blanca 232x38b(1).swf?url=$$URL$$">
		<param name="quality" value="high">
		<embed src="http://www.torontovka.com/absolutebm/banners/CasaBlanca/casa blanca 232x38b(1).swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="232" height="38"></embed>
	</object-->
	
<br>

	<!-- / EVENTS PROMO -->

	<!-- ANNONCEMENTS -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px; border: solid 2px #c1c1c1">
		<tr>
			<td style="padding: 0px 4px 4px 4px; background-color: #<%= hexBackgroundColor %>;" class="clsLargeText">
			<font color="red"><b>С Новым 2008 Годом тебя, дорогой Друг!</b></font> <br><br>Желаем весело и интересно встретить и провести Новый Год в кругу близких и приятных людей.
			<p>
			Твоя Торонтовка.
			
			</td>
		</tr>
		</table>

		</div>

	<!-- / ANNONCEMENTS -->

	<!-- AFISHA -->
	
<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px;"><tr><td><img src="http://www.torontovka.com/images/sheaders/afisha_ru.gif" height="20" alt="Russian Toronto Event Calendar"></td></tr></table>
		
		<div id="afisha">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: solid 2px #dfdfdf">
		<tr>
			<td style="padding: 4px" class="clsDefaultText">
<%
Dim startDate : startDate = Now
Dim endDate : endDate = DateAdd( "M", 2, startDate )

Dim lblWhere : lblWhere = "Место"
Dim lblWhen  : lblWhen  = "Время"
Dim lblNoEvents : lblNoEvents = "На этот день в нашем календаре событий нет. Попробуйте посмотреть события на городском сайте <a href=""http://www.toronto.com"" target=""_new"">www.toronto.com</a>"
Dim lblCalendar : lblCalendar = "Афиша на Месяц"

If GetUserLocale <> "ru" Then
	lblWhere = "Place"
	lblWhen  = "Time"
	lblNoEvents = "There are no events for this month in our calendar. Check out <a href=""http://www.toronto.com"" target=""_new"">www.toronto.com</a>"
	lblCalendar = "Full Calendar"
End If

set oCon = server.createObject("ADODB.Connection")
oCon.open application( "tr.connection.string" )

Dim afishaSql, eventTitle
afishaSql = "SELECT DISTINCT start_date, start_time, title, place, thumb, event_id FROM Calendar WHERE start_date BETWEEN '" & Month( startDate ) & "/" & Day( startDate ) & "/" & Year( startDate ) & "' AND '" & Month( endDate ) & "/" & Day( endDate ) & "/" & Year( endDate ) & "' AND show = 1 ORDER BY start_date"
Set oRec = oCon.execute( afishaSql )

If oRec.eof Or oRec.bof Then
%>
			<%= lblNoEvents %>

			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin: 8px 0px 1px 0px"><tr><td></td></tr></table>
			<nobr style="width: 100%; text-align: right;"><a href="http://www.torontovka.com/default.asp?key=life.afisha.indx"><%= lblCalendar %> »</a></nobr>
<%
Else
	
	Do Until oRec.eof
		
	If eventTitle = oRec( "title" ) Then ' quick fix for the multiple event issue
		oRec.MoveNext
	Else
		
		eventTitle = CStr( oRec( "title" ) )
		Dim sDate : sDate = CDate( oRec( "start_date" ) )
%>
			<table cellpadding="0" cellspacing="0" border="0" style="margin: 6px 0px 6px 0px;">
			<tr>
				<td class="clsDefaultText">
<%  	if not isNull( oRec( "thumb" ) ) and oRec( "thumb" ) <> "" then %>
					<table cellpadding="0" cellspacing="0" border="0" style="margin: 0px 5px 2px 0px;" align="left">
					<tr>
						<td><a href="http://www.torontovka.com/default.asp?key=life.afisha.today&day=<%= day( sDate ) %>&month=<%= month( sDate ) %>&year=<%= year( sDate ) %>"><img src="http://www.torontovka.com/life/afisha/thumbs/<%= oRec( "thumb" ) %>" width="100" border="0" class="clsBorderImage"></a></td>
					</tr>
<%			if not isNull( oRec( "event_id" ) ) and oRec( "event_id" ) <> "" then %>
					<tr>
						<td><a href="http://www.torontovka.com/default.asp?key=life.tickets.buyTickets&event_id=<%= oRec( "event_id" ) %>"><img src="http://www.torontovka.com/images/afisha_tickets.gif" border="0" style="margin-top: 2px;"></a></td>
					</tr>
<%			end if %>
					</table>
<%		elseif not isNull( oRec( "event_id" ) ) and oRec( "event_id" ) <> "" then %>
					<table cellpadding="0" cellspacing="0" border="0" style="margin: 0px 5px 2px 0px;" align="left">
					<tr>
						<td><a href="http://www.torontovka.com/default.asp?key=life.tickets.buyTickets&event_id=<%= oRec( "event_id" ) %>"><img src="http://www.torontovka.com/images/afisha_tickets.gif" border="0" style="margin-top: 2px;"></a></td>
					</tr>
					</table>
<%  	end if %>
			
					<%= ( Day( sDate ) & " " & GetMonthName( Month( sDate ) ) & ", " & Year( sDate ) ) %>
					<br>
					<b><a href="http://www.torontovka.com/default.asp?key=life.afisha.today&day=<%= Day( sDate ) %>&month=<%= Month( sDate ) %>&year=<%= Year( sDate ) %>"><%= oRec( "title" ) %></a></b>
					<br>
<%  	If Not IsNull( oRec( "place" ) ) And oRec( "place" ) <> "" Then %>
					<b><%= lblWhere %>:</b> <%= oRec( "place" ) %><br>
<%  	End If %>

<%  	If Not IsNull( oRec( "start_time" ) ) And oRec( "start_time" ) <> "" Then %>
					<b><%= lblWhen %>:</b> <%= oRec( "start_time" ) %>
<%  	End If %>
					
				</td>
			</tr>
			</table>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0"><tr><td></td></tr></table>

<%  	oRec.MoveNext
		
	End If  ' quick fix for the multiple event issue
	
	Loop
%>

			<!--font color="red">Septemer 28 - October 1</font> <b>Toronto Fall Home Show</b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">September 29 - October 1</font> <b>OURA University Fair 2006</b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">September 30 - October 1</font> <b>TMX- TORONTO MUSIC EXPO <br></b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">October 6 - 9</font> <b>International Home Show </b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">October 13</font> <b>Представление фигуриста Курта Броунинга «Gotta Skate VI» </b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">October 13 - 15</font> <b>The Photographic &amp; Digital Imaging Show </b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">October 16</font> <b>Career Concepts - ярмарка работ</b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">October 19 - 22</font> <b>Creative Sewing and Needlework Festival 2006</b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px"><tr><td></td></tr></table>
			<font color="red">October 27 - 29</font> <b>The Baby & Toddler Show 2006 </b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px" ID="Table3"><tr><td></td></tr></table>
			<font color="red">October 28 - 29</font> <b>Esthetique SPA International 2006 </b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px" ID="Table4"><tr><td></td></tr></table>
			<font color="red">October 29</font> <b>Gadsden Vintage Style Antiques & Collectibles Show</b>
			<table width="100%" height="2" cellpadding="0" cellspacing="0" background="http://www.torontovka.com/life/dating/images/profile_div.gif" border="0" style="margin-top: 4px; margin-bottom: 4px" ID="Table5"><tr><td></td></tr></table>
			<nobr style="width: 100%; text-align: right; margin-top: 2px;"><a href="http://www.torontovka.com/default.asp?key=life.afisha.indx"><%= lblCalendar %> »</a></nobr-->
<%
End If

oRec.Close
Set oRec = Nothing
oCon.Close
Set oCon = Nothing
%>

			</td>
		</tr>
		</table>
		</div>

	<!-- / AFISHA -->
	
	<!-- MISS AND MISTER TORONTOVKA -->

<%
Dim missId : missId = 2936
Dim misterId : misterId = 2928

Dim missName, misterName, missPic, misterPic
Dim missTitle : missTitle = "Miss and Mister of the Week"
If GetUserLocale() = "ru" Then
	missTitle = "Мисс и Мистер Недели"
End If

set oCon = Server.CreateObject( "ADODB.Connection" )
oCon.open application( "tr.connection.string" )

dim missSql : missSql = "SELECT DISTINCT nick, C.part_id, pic_name FROM dt_Participants AS P, dt_Contest_Photos AS C WHERE ( P.part_id = " & missId & " OR P.part_id = " & misterId & " ) AND P.part_id = C.part_id AND P.cont_id = 1 AND default_ = 1"
set oRec = oCon.execute( missSql )

If Not oRec.eof And Not oRec.bof Then
	
	If oRec( "part_id" ) = missId Then
		missName = CStr( oRec( "nick" ) )
		missPic  = CStr( oRec( "pic_name"  ) )
		oRec.MoveNext
		misterName = CStr( oRec( "nick" ) )
		misterPic  = CStr( oRec( "pic_name"  ) )
	Else
		misterName = CStr( oRec( "nick" ) )
		misterPic  = CStr( oRec( "pic_name"  ) )
		oRec.MoveNext
		missName = CStr( oRec( "nick" ) )
		missPic  = CStr( oRec( "pic_name"  ) )
	End If
%>
<table cellpadding="0" cellspacing="0" border="0" style="margin-top: 8px;"><tr><td><img src="http://www.torontovka.com/images/sheaders/missweek_ru.gif" height="20" alt="Miss and Mister of the Week"></td></tr></table>
		<div id="miss">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border: solid 2px #dfdfdf">
		<tr>
			<td style="padding: 4px; background-color: #<%= hexBackgroundColor %>;">
			
				<table width="100%" cellpadding="4" cellspacing="2" border="0">
				<tr>
					<td align="center" class="clsDefaultText">
						<a href="http://www.torontovka.com/default.asp?key=enter.beauty.view_all&sex=Female"><img src="http://www.torontovka.com/enter/beauty/image.asp?contestID=1&userID=<%= missID %>&pic=1&width=110" width="90" height="90" border="0" class="clsBorderImage"></a>
						<br>
						<a href="http://www.torontovka.com/default.asp?key=enter.beauty.view_all&sex=Female"><%= missName %></a>
					</td>
					<td align="center" class="clsDefaultText">
						<a href="http://www.torontovka.com/default.asp?key=enter.beauty.view_all&sex=Male"><img src="http://www.torontovka.com/enter/beauty/image.asp?contestID=1&userID=<%= misterID %>&pic=1&width=110" width="90" height="90" border="0" class="clsBorderImage"></a>
						<br>
						<a href="http://www.torontovka.com/default.asp?key=enter.beauty.view_all&sex=Male"><%= misterName %></a>
					</td>
				</tr>
				</table>
		
			</td>
		</tr>
		</table>
		</div>
<%
end if

oRec.close
set oRec = nothing
oCon.close
set oCon = nothing
%>

	<!-- / MISS AND MISTER TORONTOVKA -->

	</td>
</tr>
</table>

<p>
</body>
</html>