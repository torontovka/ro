<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title>ShowOneTickets.com - Buy Tickets for Shows, Sport Events, Theater, Club Parties</title>
	
	<meta name="classification" content="">
	<meta name="description" content="">
	<meta name="keywords" content="">

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta http-equiv="Content-Language" content="ru">

	<link href="layout.css" rel="stylesheet" type="text/css">
	<link href="favicon.ico" rel="shortcut icon">

	<script>
	
		String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g, ''); };
	
		function SendRequest ( url, type )
		{
			var xmlHttp = null;
			
			try
			{
				// Firefox, Opera 8.0+, Safari
				xmlHttp = new XMLHttpRequest();
			}
			catch (e)
			{
				// Internet Explorer
				try
				{
					xmlHttp = new ActiveXObject( "Msxml2.XMLHTTP" );
				}
				catch (e)
				{
					try
					{
						xmlHttp = new ActiveXObject( "Microsoft.XMLHTTP" );
					}
					catch (e)
					{
						alert( "Your browser doesn't support AJAX\n" + e.message );
						return false;
					}
				}
			}
		
			if ( xmlHttp != null )
			{
				// Set handler
				xmlHttp.onreadystatechange = function ()
				{
					if( xmlHttp.readyState == 4 )
					{
						/*if ( xmlHttp.status == 200 )
						{
							xmlHttp.responseText
						}
						else
						{
							// Problem getting data
						}*/
		
						switch ( type )
						{
							case "signup":
								alert( xmlHttp.responseText );
								break;
							case "order":
								handleOrder( xmlHttp.responseText );
							default:
								break;
						}
					}
				};
				
				// Send request
				xmlHttp.open( "GET", url, true );
				xmlHttp.send( null );
			}
			else
			{
				// Browser doesn't support Ajax
			}
		}
	
	</script>

</head>

<body>

	<center>
		<div id="page">
			<div id="inner-page">
	
				<div id="header">
					<a href="./default.asp"><img src="./images/logo.png" id="header-logo" border="0"/></a>
				</div>
				
				<div id="content">