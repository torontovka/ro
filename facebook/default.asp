<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" version="XHTML+RDFa 1.0" dir="ltr"
  xmlns:content="http://purl.org/rss/1.0/modules/content/"
  xmlns:dc="http://purl.org/dc/terms/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:og="http://ogp.me/ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:sioc="http://rdfs.org/sioc/ns#"
  xmlns:sioct="http://rdfs.org/sioc/types#"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema#">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
    
        <style type="text/css" media="all">
            @import url("css/facebook.css");
        </style>
        
        <script src="http://connect.facebook.net/en_US/all.js"></script>
        
    </head>
    
    <!-- <%= request("signed_request") %> -->
    
    <body class="i18n-en">
    
        <div class="fb-page">
        
            <div id="fb-page-header">
                <p class="fb-page-font">Follow the challengers as they tune their Scions from start to finish. Pick your favourite ride, get tips from pro tuners and much more!</p>
                <a class="button" href=""></a>
            </div>
            
            <div id="fb-page-blocks">
                <div class="block left" id="photos">
                    <p class="text fb-page-font">Art. Music. Wheels. Whatever you are into, there is always something happening. Don’t miss out.</p>
                    <a class="button" href=""></a>
                </div>
                <div class="block right" id="events">
                    <p class="text fb-page-font">Careful. Too much eye candy can give you a stomach ache.</p>
                    <a class="button" href=""></a>
                </div>
            </div>
            
            <div id="fb-page-tickers">
                <a class="ticker left" id="racing" href=""></a>
                <a class="ticker" id="music" href=""></a>
                <a class="ticker right" id="gear" href=""></a>
            </div>
            
            <div id="fb-page-twitter-feed">
                <label class="twitter-feed-title fb-page-font">Scion Canada on Twitter</label>
                <p class="twitter-feed-text fb-page-font">ScionCanada wrote: <span>#xB</span> - "thoroughly practical, completely comfortable wagon. Fuel-efficient safe and well-equipped." say globe&mail. <span>http://bit.ly/gwStnD</span></p>
                <a class="button" href=""></a>
            </div>
            
            <div id="fb-page-footer">
                <a class="button explore" id="explore_tc" href=""></a>
                <a class="button explore" id="explore_xd" href=""></a>
                <a class="button explore" id="explore_xb" href=""></a>
                <a class="button explore" id="explore_iq" href=""></a>
            </div>
            
        </div>
    
        <div id="fb-root"></div>
        
        <script>
		
            window.fbAsyncInit = function()
			{
            	FB.init({
                	appId  : '109122132506298',
              		status : true, // check login status
              		cookie : true, // enable cookies to allow the server to access the session
              		xfbml  : true  // parse XFBML
            	});

        		FB.Canvas.setSize({ width: 520, height: 1150 });
				
				FB.Event.subscribe('edge.create', function( response ) {
				    //console.log(response); //.session
				    alert( 'You just likes the page' );
				});
				
				FB.getLoginStatus(function(response) {
	console.log(response);
  if (response.session) {
    // logged in and connected user, someone you know
  } else {
    // no user session available, someone you dont know
  }
});
				
				//alert(1);
				FB.api({
				
					method  : 'users.getLoggedInUser',
					page_id : '109122132506298' },
					
					function ( response ) {
				        //console.log(response);
						alert (response);
						for ( var i in response ) {
						  	//alert( response[i] );
							/*
							var post = response[i];
							if (post.message) {
							  alert('Message: ' + post.message);
							} else if (post.attachment && post.attachment.name) {
							  alert('Attachment: ' + post.attachment.name);
							}
							*/
  						}
    				}
				);
				
				FB.api('/me', function(response) {
  					console.log( response );
});

				//alert(2);
				//var pageID = '109122132506298';
				//var uid = FB.Facebook.apiClient.get_session().uid;
				//FB.Facebook.apiClient.pages_isFan(pageID, uid, function(result){ alert("LIKE!");});


				//alert(3)
				FB.api({

					method: 'pages.isFan',
					page_id: '109122132506298',
					/*uid: uid*/ },

					function( resp ) {
					    if(resp.error_code) {
						    alert( 'code: ' + resp )
						    console.log( 'code: ' + resp )
						}
						
						if (resp == true) {
						    alert( uid + ' likes the Application.' );
						    console.log( uid + ' likes the Application.' );
						} else if(resp.error_code) {
						    alert( 'message: ' + resp.error_msg );
						    console.log( 'message: ' + resp.error_msg );
						} else {
						    alert( uid + ' doesn\'t like the Application.' );
						    console.log( uid + ' doesn\'t like the Application.' );
						}
					}
				);
          	};
        
          	(function() {
            	var e = document.createElement('script');
            	e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
            	e.async = true;
            	document.getElementById('fb-root').appendChild(e);
          	}());
		  
        </script>

    </body>

</html>
