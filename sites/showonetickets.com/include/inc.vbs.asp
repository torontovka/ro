<%
set EventName = server.createObject( "Scripting.Dictionary" )
EventName.add 15, "Не Отрекаются Любя"
EventName.add 16, "Валерий Гергиев и Мариинский оркестр, солист Денис Мацуев"
EventName.add 17, "БИ-2"

set EventDescription = server.createObject( "Scripting.Dictionary" )
EventDescription.add 15, "Четверг, 3 сентября 2009 &ndash; 8:00pm"
EventDescription.add 16, "Суббота, 14 марта 2010 &ndash; 7:30pm"
EventDescription.add 17, "Суббота, 20 сентября 2009 &ndash; 9:00pm"

set EventLocation = server.createObject( "Scripting.Dictionary" )
EventLocation.add 15, "MTCC, John Basset Theatre"
EventLocation.add 16, "Place Des Arts, Salle Wilfrid-Pelletier"
EventLocation.add 17, "The MOD Club"

set EventText = server.createObject( "Scripting.Dictionary" )
EventText.add 15, "После нескольких лет разлуки встречаются два главных героя, бывшие звездытеатральной сцены, бывшие супруги. В новый театральный проект их пригласилиуспешный продюсер и известный режиссер. И новый спектакль - шанс вернуться нетолько на сцену, но и друг к другу."
EventText.add 16, "Valery Gergiev, the charismatic Russian conductor, is one of the most sought-after musicians in the world today. He will lead the Mariinsky Orchestra from Saint Petersburg, one of the finest orchestras on the planet and which he has been conducting for more than twenty  years."
EventText.add 17, "Да! Да! Это Би-2! Впервые в Торонто! Мега-звёзды русского рока представляют новый альбом, а также радуют нас своими знаменитыми и популярными хитами! Энергетический драйв гарантирован - пропустить невозможно!"

set VenueName = server.createObject( "Scripting.Dictionary" )
VenueName.add 1, "Metro Toronto Convention Centre, John Basset Theatre"
VenueName.add 2, "Place Des Arts"
VenueName.add 3, "The Mod Club"

set VenueLocation = server.createObject( "Scripting.Dictionary" )
VenueLocation.add 1, "Toronto, Ontario"
VenueLocation.add 2, "Montreal, Quebec"
VenueLocation.add 3, "Toronto, Ontario"

set VenueDescription = server.createObject( "Scripting.Dictionary" )
VenueDescription.add 1, "This 1,330 seat, multi-purpose theatre is a self-contained venue within the North Building. It has its own separate entrance on Front Street and a comfortable lobby."
VenueDescription.add 2, "With the addition of a fifth hall and the integration of the Musee d'art contemporain de Montreal, Place des Arts became the largest and most prestigious and multi-purpose cultural complex in Canada."
VenueDescription.add 3, "The place is big enough to hold three downtown bars. Which, coincidentally, serves as a fitting metaphor for a place that's trying to pack three different themes: lounge, dance club and - on certain nights - theatre, under one upscale banner."

set VenueAddress = server.createObject( "Scripting.Dictionary" )
VenueAddress.add 1, "255 Front St. West, Toronto, Ontario M5V2W6"
VenueAddress.add 2, "260 boul. de Maisonneuve Ouest, Montreal Quebec, H2X1Y9"
VenueAddress.add 3, "722 College St., Toronto, Ontario"
%>