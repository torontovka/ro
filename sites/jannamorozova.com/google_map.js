var mapList = new Array();  

function setMap( mapObjId ,postalCode )
{
    var curIndex = mapList.length;
    mapList[curIndex]=new Array();
    mapList[curIndex][0]=mapObjId;
    mapList[curIndex][1]=postalCode;
}

function setMapHTML()
{
    if( mapList.length > 0 )
    {
        var curObj = mapList.pop();
        var mapObjId = curObj[0];
        var postalCode = curObj[1];
    
        var map = new GMap2(document.getElementById(mapObjId));
        var geocoder = new GClientGeocoder(); 
        geocoder.getLatLng
        ( 
            postalCode, 
            function(point)
            {
                if(!point) 
                {                    
                } 
                else 
                {                    
                    map.setCenter(point, 15); 
                    var marker = new GMarker(point); 
                    map.addOverlay(marker);                
                }
            }
        );
        
        if( mapList.length > 0 )
            window.setTimeout( setMapHTML , 100 );
    }
}

function startSetMap()
{    
    window.setTimeout( setMapHTML, 1500 );        
}

function iniWin()
{ 
    startSetMap();  
}