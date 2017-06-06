var cookieStoreDays = 60;
var nameArr = null;
var valueArr = null;

function initializeNameValueArrays(cookieName)
{
	var i;
	var pairs = getItemValuePairs(cookieName);

	// Create name and value arrays to hold all persistent data
	if ( pairs != null ) {

		nameArr = new Array(pairs.length);
		valueArr = new Array(pairs.length);	
	
		// Populate the arrays
	
		var index = 0;
		for ( i = 0; i < pairs.length; i++ ) {
			if ( pairs[i] ) {
				var name = getItemName(pairs[i]);
				var value = getItemValue(pairs[i]);
		
				nameArr[index] = name;
				valueArr[index] = value;	
				index++;	
			}
		}
	}
}


function saveAll() {
	var formCount = document.forms.length;
	var formIndex = 0;
	
	while ( formIndex < formCount ) {
		saveForm(document.forms[formIndex]);
		formIndex++;
	}
}

function findGroupSize(form, element) {
	var size = 0;
	for ( var i = 0; i < form.elements.length; i++ ) 
	{
		if ( form.elements[i] ) 
		{
			if ( element.name == form.elements[i].name ) 
			{
				size++;
			}
		} 
	}
	return size;
}

function getIndex(form, element) {
	var index = 0;
	for ( var i = 0; i < form.elements.length; i++ ) 
	{
		if ( form.elements[i] ) 
		{
			if ( element.name == form.elements[i].name ) 
			{
				if ( element.value == form.elements[i].value) 
				{
					return index;
				}
				index++;
			}
		} 
	}
}


function saveData(name, types) {

	var formCount = document.forms.length;
	var formIndex = 0;
	var cookieName = name;
	var cookieVar;
	var cookieData = "";
	var exp = new Date();
    var expiryDate = exp.getTime() + (cookieStoreDays * 24 * 60 * 60 * 1000);  
    exp.setTime(expiryDate);

	while ( formIndex <= formCount )   // was formIndex < formCount
	{
		var form = document.forms[formIndex];
		
		if ( form ) 
		{
			
			var elementCount = form.elements.length;

		    for(var i=0; i<=elementCount; i++) 
			{
				var element = form.elements[i];
				if ( element ) 
				{
					if ( types.indexOf(":"+element.type+":") != -1 ) 
					{	
						var elementName = element.name;
						var elementValue = "";

						if ( element.type == "radio" ) 
						{
							var groupSize = findGroupSize(form, element);
							
//							alert("size = " + groupSize);
//							alert("Radio " + elementName);

							if ( groupSize > 1 )
							{
								var index = getIndex(form, element);
//								alert("Index = " + index);
								elementName += "." + element.value;
							}				 
							elementValue = element.checked ? "true" : "false";
						}
						else 
						{
	        				elementValue = element.value;
						}

						if ( elementValue == "") {
							elementValue = " ";
						}
						
						cookieData += elementName + ".EQ." + elementValue + "`";		
					}					
				}
			}
		}
		formIndex++;
	}
		
	cookieVar = "" + cookieName + "=" + cookieData + "; expires="+ exp.toGMTString();		// <-- Permanent Cookie
//	cookieVar = "" + cookieName + "=" + cookieData;  // <-- Session Cookie
	
//	window.open().document.write(cookieVar);
	document.cookie = cookieVar;	
	
/*	if ( document.cookie.indexOf(cookieName) != -1 ) 
	{
		alert("Your Data Has Been Stored.");
	}
	else 
	{
		alert("Your Data Has NOT Been Stored.");
	}*/
}



function saveForm(form, cookieName, types) { 
//	var cookieName = name;
	var cookieVar;
	var cookieData = "";
	var exp = new Date();
    var expiryDate = exp.getTime() + (cookieStoreDays * 24 * 60 * 60 * 1000);  
    exp.setTime(expiryDate);

	if ( form ) 
	{
		
		var elementCount = form.elements.length;
	
//		alert("elementCount = " + elementCount);
	
		for(var i=0; i<=elementCount; i++) 
		{
			var element = form.elements[i];
			if ( element ) 
			{
				if ( types.indexOf(":"+element.type+":") != -1 ) 
				{	
					var elementName = element.name;
					var elementValue = "";
		
//					alert("elementName = " + elementName);
					
					if ( element.type == "radio" ) 
					{
						var groupSize = findGroupSize(form, element);
						
//							alert("size = " + groupSize);
//							alert("Radio " + elementName);

						if ( groupSize > 1 )
						{
							var index = getIndex(form, element);
//							alert("Index = " + index);
							elementName += "." + element.value;
						}				 
						elementValue = element.checked ? "true" : "false";
					}
					else 
					{
						elementValue = element.value;
					}

					if ( elementValue == "") {
						elementValue = " ";
					}
					
					cookieData += elementName + ".EQ." + trim(elementValue) + "`";		
				}					
			}
		}
	}


	cookieVar = "" + cookieName + "=" + cookieData + "; expires="+ exp.toGMTString();		// <-- Non-session cookie
//	cookieVar = "" + cookieName + "=" + cookieData;	  // Sami July 5, 2005    <-- Session Cookie

// Test Code
/*	if ( document.cookie.length + cookieVar.length > 4000 ) {
		alert("Over 4000!");
		return;
	}
*/

	document.cookie = cookieVar;	
	
/*	if ( document.cookie.indexOf(cookieName) != -1 ) 
	{
		alert("Your Data Has Been Stored.");
	}
	else 
	{
		alert("Your Data Has NOT Been Stored.");
	}*/
    
}

function findNextChar(val, line) {
	var j = 0;
	var len = line.length;

	while ( j < len ) {
		if ( line.toString().substring(j,j+1) == val) {
			return j;
		}
		j++;
	}
	return -1;
}

function getItemValuePairs(cookieName) {
	var pairs = new Array();
	var item = 1;

	var start = 0;
	var end = 0;
	
//	alert("CookieName = " + cookieName);
	
	var cookee = getCookie(cookieName);
	
//	alert("cookee = " + cookee);
	
//	alert("cookee is null = " + (cookee == null));	
	
	if ( cookee != null) {
		var len = cookee.length;
	
		while ( end < len ) {
			if ( cookee.substring(end,end+1) == "`") {
				pairs[item] = cookee.substring(start, end);
				item++;
				start = end+1;
			}
			end++;
		}
	
		return pairs;
	}
	
	else 
	{
		return null;
	}
//	var len = document.cookie.length;
//	var unescapedCookie = unescape(document.cookie);
	
//	var index = document.cookie.indexOf(cookieName);
	
	
/*	
	while ( end < len ) {
		if ( unescapedCookie.substring(end,end+1) == "`") {
			pairs[item] = unescapedCookie.substring(start, end);
			item++;
			start = end+1;
		}
		end++;
	}
*/	
	
	
}

function getItemName(pair) {
	var equalIndex = findNextChar(".EQ.", pair);

	var name = pair.substring(0, pair.indexOf(".EQ."));

	return name;	
}

function getItemValue(pair) {
	var valueIndex = pair.indexOf(".EQ.")+4;
	var result = pair.substring(valueIndex, pair.length);
	return result;
}

/*
function reloadAll(types) {
	var formCount = document.forms.length;

	var formIndex = 0;

	while ( formIndex < formCount ) {  // was formIndex < formCount
		if ( document.forms[formIndex] ) {
//			alert(document.forms[formIndex].name);
			reloadForm(document.forms[formIndex], types);
		}
		formIndex++;
	}

}
*/

function reloadForm(form, cookieName, types) {
	reloadForm(form, cookieName, types, false);
}

function reloadForm(form, cookieName, types, notify) {
	var i;
	initializeNameValueArrays(cookieName);
	
	if ( nameArr == null || valueArr == null ) {
		if ( notify == true ) {		
			alert("You do not have any stored data. cookie " + cookieName + " not found");
		}
		return;
	}
	
//	alert("Cookie = " + cookieName + "!" );
	
	for ( j = 0; j <= form.elements.length; j++) {
		var element = form.elements[j];
//		alert("elementName = " + element.name + "; elementType = " + element.type);
		
		if ( element ) {
			if ( types.indexOf(":"+element.type+":") != -1 )
			{
				var elementName = element.name;
				
				if ( element.type == "radio" ) 
				{
					size = findGroupSize(form, element);
					if ( size > 1 ) 
					{
						elementName += "." + element.value;
					}
				}
				for ( i = 0; i < nameArr.length; i++) 
				{
					if ( nameArr[i] == elementName ) 
					{
//						alert("found!");
						if ( element.type != "select-one") 
						{ 
							element.value = valueArr[i];
							
//							if ( elementName == "bSIN" )
//							{
//							
//								alert("bSIN value = " + element.value);
//							}
						}
						else if ( element.type == "select-one" ) 
						{
							var numOptions = element.options.length;
							var k;
							for ( k = 0; k < numOptions ; k++ ) 
							{
								if ( element.options[k].value == valueArr[i] ) 
								{
									element.options[k].selected = true;
								}
							}	
						}
						else if ( element.type == "radio" ) 
						{ 
							if ( size > 1 ) 
							{
								var index = getIndex(form, element);
								if ( valueArray[i] == "true" ) 
								{
									element.checked = true;
								}
								else 
								{
									element.checked = false;
								}
							}
							else 
							{
								element.checked = ( valueArray[i] == "true" );
							}							
						}
					}
				}	
			}
		}
	}
}



function getCookie(name) {
//	var data = unescape(document.cookie);
	var data = document.cookie;
	
//	window.open().document.write(data);
	
	var offset = data.indexOf(name+"=");	
	var offset2 = data.indexOf(";", offset);
	var len = name.length;

	// 4 is the length of .EQ.
	if ( offset != -1 ) {
		// return data.substring(offset+name.length+4, offset2-1);
		return data.substring(offset+len+1, offset2);

	}
	else {
		return null;
	}
}

function getCookieItem(cookieName, itemName) {
	initializeNameValueArrays(cookieName);
	
//	alert("CookieName = " + cookieName);
//	alert(nameArr);
	if ( !nameArr)
	{
		return null;
	}
	
	for ( var i = 0; i < nameArr.length; i++ ) {
		if ( nameArr[i] == itemName ) {
			return valueArr[i];
		}
	}
	return null;  // change to 'return null'
}

function saveCookie(cookieName, cookieVal)
{
	var expire = new Date();
	expire.setTime (expire.getTime() + cookieStoreDays * 24 * 60 * 60 * 1000);
	document.cookie = cookieName + "=" + cookieVal + "; expires="+expire.toGMTString();   // <-- Permanent Cookie
}


/* DELETE THE COOKIE INDICATED BY THE VARIABLE NAME PASSED TO THIS FUNCTION */
function delEatCookie(name) 
{
	var expire = new Date();
	expire.setTime (expire.getTime() - 2 * 86400001);/* -2 DAYS AGO-STALE COOKIE */
	document.cookie = name + "=*; expires=" + expire.toGMTString();
}

function copyCookie(srcCookie, dstCookie, itemNameArray) {
	var exp = new Date();
    var expiryDate = exp.getTime() + (cookieStoreDays * 24 * 60 * 60 * 1000);
	exp.setTime(expiryDate);
	
	var destStr = "";
	for(var i=0; i<itemNameArray.length; i++) {
		var itemValue = getCookieItem(srcCookie, itemNameArray[i]);
		if ( itemValue == null ) 
		{
			itemValue = "";
		}
		destStr = itemNameArray[i] + ".EQ." + itemValue + "`"; 
	}
	document.cookie = dstCookie + "=" + destStr + "; expires="+ exp.toGMTString();
}


function setCookieItem(cookieName, itemName, itemValue)
{
	var cookee = getCookie(cookieName);
	if (cookee != null ) 
	{
		var oldValue = getCookieItem(cookieName, itemName);
		var itemIndex = cookee.indexOf(itemName+".");		
		if ( itemIndex != -1 && oldValue!=null) 	//		if ( oldValue != null ) 
		{
			var initCookee = cookee.substring(0,itemIndex + itemName.length + 4);
			var endCookee = cookee.substring(itemIndex + itemName.length + 4 + oldValue.length, cookee.length);
			cookee = initCookee + itemValue + endCookee;
		}	
		else 
		{
			cookee += itemName+".EQ."+itemValue+"`";
		}
	}
	else 
	{
		cookee = itemName + ".EQ." + itemValue + "`";
	}
	
	saveCookie(cookieName, cookee);
}

function clearImg(y)
{
	if(browTest()==true){
		OrImg= new Image();
		if(y==1){
			OrImg.src="https://www.secureapp.com/MB/graphics/qualback_off.gif";
			document.images.Back_button.src = OrImg.src;
		}
		else if(y==2){
			OrImg.src="https://www.secureapp.com/MB/graphics/next_off.gif";
			document.images.Next_button.src = OrImg.src;
		}
	}
	else {	}
}

function makeImg(y)
{
	if(browTest()==true){
		Img = new Image();
		if(y==1){
			Img.src = "https://www.secureapp.com/MB/graphics/qualback_on.gif"; 
			document.images.Back_button.src = Img.src;
		}
		else if(y==2){
			Img.src = "https://www.secureapp.com/MB/graphics/next_on.gif"; 
			document.images.Next_button.src = Img.src;
		}	
	}
	else {	}
} 

function browTest()
{
	if((navigator.appVersion.substring(0,3) == 3.0 || navigator.appVersion.substring(0,3) == 4.0)&& navigator.appName.substring(0,8)=="Netscape"){
		return true;
	}
	else{
		return false;
	}
}

function loadImg()
{
	if(browTest()==true) {
		Img = new Image();
		Img.src = "https://www.secureapp.com/MB/graphics/qualback_on.gif"
		Img2 = new Image();
		Img2.src = "https://www.secureapp.com/MB/graphics/next_on.gif";
	}
	else {	}
}

/*__________________DATA FORMATTING__________________*/

/* ROUNDS OFF MONETARY NUMBER TO TWO DECIMALS (PENNIES) */
function roundPen(n)
{
	if(n > 0) 
	{
		pennies = n*100;
		pennies = Math.round(pennies);
		strPennies = "" + pennies;
		len = strPennies.length;
		return strPennies.substring(0, len - 2) + "." + strPennies.substring(len -2, len);
	}
	else 
	{
		return 0;
	}
}

/* THE FOLLOWING FUNCTION CHECKS THAT ALL NUMERIC VALUES ARE REAL NUMBERS AND REMOVES DOUBLE DECIMALS */
function doSum(a) 
{
	var aVal = a.value;
	var counter = 0;
	var b = "";
	for(i=0;i<=aVal.length;i++)
	{
		var u = aVal.charAt(i);
		if((u>="0"&&u<="9")||u==".") {
			if(u==".") { 
				break;
			}
			var b = b + u;
		}
	}
	a.value =  b;
}

/* TESTS VERSIONS FOR WHICH WILL SUPPORT POP UP WINDOWS */
function versTest()
{
	var one = '';
	var two = '';
	
	if (
	(navigator.appName.substring(0,8)=="Netscape" && (navigator.appVersion.substring(0,3) == "3.0" ||  navigator.appVersion.substring(0,3) =="4.0")))
	{
		one='true';
	}

	if(
	 (navigator.appName.substring(0,9) == "Microsoft" && navigator.appVersion.substring(0,3) == "3.0" && navigator.appVersion.indexOf("Macintosh")>=0))
	{
		two='true';
	}
	
	if(one=='true' || two=='true' ||
	(navigator.appName.substring(0,9) == "Microsoft" && navigator.appVersion.indexOf("MSIE 3.0")>=0 && 
	navigator.appVersion.indexOf("Windows 3.1")>=0)	)
	{
		return true;
	}
	else
	{
		return false;
	}
}

/* TESTS IF VERSION IS MSIE 3.0 FOR MAC */
function msTest()
{
	if(navigator.appName.substring(0,9) == "Microsoft" && (navigator.appVersion.substring(0,3) == "3.0" && navigator.appVersion.indexOf("Macintosh")>=0))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function nineTest()
{
	if(navigator.appName.substring(0,9) == "Microsoft" && (navigator.appVersion.substring(0,3)=="3.0" || navigator.appVersion.indexOf("MSIE 3.0")>=0) && (navigator.appVersion.indexOf("Macintosh")==-1 || navigator.appVersion.indexOf("Windows 3.1")== -1)
	)
	{
		return true;
	}
	else 
	{
		return false;
	}
}

/*__________________GENERAL FUNCTIONS__________________*/

/* RETURNS THE SELECTED INDEX VALUE OF SELECT LISTS IN THE QUALIFIER TO BE USED IN CALCULATIONS */
function getIndex(field) 
{
	return field.selectedIndex;
}

/* DEFINES STRING ARRAYS WHICH ARE USED THROUGHOUT FOR STATUS BAR AND HELP MESSGAES */
function StringArray(n) 
{
	this.length = n;
	for (var i = 1; i <= n; i++) {
		this[i] = '';
	}
	return this;
}

/* THE FOLLOWING TWO FUNCTIONS DEFINE THE ARRAYS WHICH ARE USED TO STORE ALL THE RATE AND PRODUCT INFORMATION AND THEIR RELATIONSHIPS WITH THE PRODUCTS IN THE TERM SELECT LIST WITHIN THE QUALIFIER FORM FOR EACH LENDER INVOLVED IN THE SYSTEM */
function makeArray2(X,Y)
{
	var Count;
	this.length = X;
	for (var Count=1; Count <= X; Count++)
		this[Count] = new makeArray(Y);
}

function makeArray(NumElements)
{
	var Count;
	this.length = NumElements;
	for (Count=1; Count<=NumElements; Count++)
		this[Count] = 0;

	return(this);
}

// OPENS A WINDOW DISPLAYING A VALIDATION MESSAGE IF THERE IS AN ERROR IN THE USER'S ENTRY OR IF THEY HAVE ATTEMPTED TO CLICK QUALIFY ME AND THERE ARE STILL SOME FIELDS WHICH HAVE BEEN LEFT EMPTY 
function fixpro(n,q)
{
	if(versTest() == true)
	{
		if(msTest()==true)
		{
			var winNam='';
		}
		else
		{
			var slash = location.href.lastIndexOf("/")+1;
			var filNam = location.href.substring(0,slash);
			var winNam = filNam+'qualem.html';
		}
		fix = window.open(winNam,'FIX','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=100');
		if(navigator.appName.substring(0,8) == "Netscape")
		{
			fix.focus();
		}
		fix.document.write('<html><head><title>OME</title>');
		fix.document.write('</head><body><form name=fixer>');
		fix.document.write('<font size=2 face="Arial, Helvetica" color=306798>'+n+'</font><p><FONT SIZE=2 FACE="Arial, Helvetica">'+q+'<p>');
		fix.document.write('<center><input type=button value=OK onClick=self.close()>');
		fix.document.write('</center></form></body></html>');
		fix.document.close();
	}
	else 
	{ 
		alert(n+'\n'+q);
	}
}

/* RETURNS A SPACE IF THERE IS NO ENTRY IN THE FIELD WHEN THE USER CLICKS STORE INFO */
function checknull(theEntry) 
{
	if (theEntry == "") return " "; 
		return theEntry; 
}

function getFieldValue(form, fieldName) {
	var numFields = form.elements.length;
	var index = 0;
	
	while ( index < numFields ) {
		if ( fieldName = form.elements[index].name ) {
			return form.elements[index].value;
		}
		index++;
	}

	return -1; 
}

/* FUNCTION CONFIRMS THAT THE VALUE ENTERED INTO A FIELD FALLS WITHING THE PRE-DETERMINED MINIMUM AND MAXIMUM VALUES, AND DISPLAYS AN ERROR MESSAGE WITH THE ALLOWABLE NUMERIC RANGE FOR THE FIELD DATA IN A POP UP VALIDATION WINDOW */
function checkNumber(input, min, max, msg)
{   
	var str = input.value;
	var num = 0+str;
	if (num < min || max < num) {
		return false;
	}
	input.value = str;
	return true;
}

/* OPENS HELP WINDOW DISPLAYING THE APPROPRIATE HELP MESSAGE FROM THE ARRAY ACCORDING TO THE VALUES PASSED TO THIS FUNCTION FROM THE HELP BUTTON IN THE QUALIFIER FORM */
function message (button)
{
	var linkit = "../help/"+button;
	if(versTest() == true || nineTest() == true){			
		helpwindow = window.open(linkit,'helpscreen','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=250,height=180');
		if(navigator.appName.substring(0,8) == "Netscape") { 
			helpwindow.focus();
		}
	}
	else {
		location.href=linkit;
	}
}

function formatNumber(currencyStr)
{
	currencyStr = new String(currencyStr);
	
	if ( currencyStr.indexOf(",") != -1 )
	{
		currencyStr = currencyStr.replace(",","");
	}
	if ( currencyStr.indexOf(" ") != -1 )
	{
		currencyStr = currencyStr.replace(" ","");
	}
	
	var currVal = currencyStr*1.0;
	var intPart = Math.floor(currVal);
	var intString = new String(intPart);
	var fractPart = (currVal - intPart) * 100;
	var fractString = new String(fractPart).substring(0,2);   // two-decimal places only
	
	var delimitedInt = "";
	var radix = "";
	var separator = "";
	if ( lang == 'en' ) 
	{
		separator = ",";
		radix = ".";
	}
	else if ( lang == 'fr')
	{
		separator = " ";
		radix = ",";
	}

	for ( var i = intString.length; i >= 0 ; i--) 
	{
		delimitedInt = intString.charAt(i) + delimitedInt; 
		
		if ( i!=intString.length && i!=0 && (intString.length-i)%3==0) 
		{
			delimitedInt = separator+delimitedInt;
		}
	}
	
	if ( fractString.length == 0 ) 
	{
		fractString = "00";
	}
	else if ( fractString.length == 1 ) 
	{
		fractString += "0";
	}
	
	return delimitedInt + radix + fractString;
}

function getPreDollar(){
	if ( lang == 'en' ) {
		return "$ ";
	}
	return "";
}

function getPostDollar(){
	if ( lang == 'fr' ) 
	{
		return " $";
	}
	return "";
}
/* FUNCTION THAT ADDS COMMAS TO THE CURRENCY VALUE (i.e. $1000000.00 -> $1,000,000.00) */
function addCommas(currencyValue)
{
	currencyValue = "" + currencyValue;
	var dollars = 0;
	var cents = "";
	if ( currencyValue.indexOf(",") != -1 ) 
	{
		return currencyValue;
	} 
	else if ( currencyValue.indexOf(".") != -1 )
	{
		dollars = currencyValue.substring(0,currencyValue.indexOf("."));
		cents = currencyValue.substring(currencyValue.indexOf("."),currencyValue.length);
	} 
	else if ( currencyValue > 0 )
	{
		dollars = currencyValue;
	} 
	else 
	{
		return currencyValue;
	}
	var returnValue = "";
	for (var i=1;i<=dollars.length;i++)
	{
		if (i % 3 == 1 && i != 1)
		{
			returnValue = "," + returnValue;
		}
		returnValue = dollars.charAt(dollars.length - i) + returnValue;
	}
	returnValue += cents;
	
	return returnValue;
}

// FORMATS A NUMERIC VALUE TO A PERCENTAGE BY CHECKING THE VALUE'S DECIMAL PLACES, ROUNDS IT TO A FIELD-CONFIGURABLE NUMBER OF DECIMAL PLACES, AND ATTACHES THE PERCENTAGE SIGN STRING 
function formatper(val, len, decimal)
{
	var     scale = 1;
	
	for (i = 0; i <= decimal; i++)
		scale *= 10;

	var str = "" + Math.round(parseFloat(val) * scale);

	if (str.length == 0 || str == "0") {
		str = "000";
	}

	str = str + "%";
	i = len - str.length;

	if (scale != 1)		
		i--;

	while (0 < i--) 
		str = " " + str;

	if (scale != 1) {
		var p = len - decimal - 2;
		var a = str.substring(0, p);
		var b = str.substring(p, len);

		return a + "." + b;
	}

	return str;
}

// Performs a one to one copy 
// Correspongs elements froim the fieldsSrc and fieldsDest Arrays must be located in the exact index in their respective arrays
// eg/ [ src1, src2, src3 ] -> [dest1, dest2, dest3] copies src1 to dest1 and src2 to dest2 and src3 to dest3.
function copyFields(formSrc, fieldsSrc, formDest, fieldsDest) 
{

	if ( formSrc == null || formDest == null || fieldsSrc == null || fieldsDest == null ) {
		return;
	}

	if ( fieldsSrc.length != fieldsDest.length ) {
		return;
	}

	var numSrcElements = formSrc.elements.length;
	
//	alert("numSrcElements = " + numSrcElements);
	
	var srcValues = new Array();
	var srcValuesIndex = -1;
	for ( var s = 0; s < numSrcElements; s++) 
	{
		var field = formSrc.elements[s];
		for ( var j = 0; j < fieldsSrc.length; j++)
		{
			if ( field.name == fieldsSrc[j] )
			{	
//				alert(fieldsSrc[j] + " = " + field.value);
				srcValuesIndex++;
				srcValues[srcValuesIndex] = field.value;
				
				break;
			}
		}
		
	}
	
	var numDestElements = formDest.elements.length;
	for ( var d = 0; d < numDestElements; d++) {
		var field = formDest.elements[d];
		for ( var j = 0; j < fieldsDest.length; j++)
		{
//			alert(field.name);
			if ( field.name == fieldsDest[j] )
			{
				field.value = srcValues[j];
				break;
			}
		}
	}
}
	
function addFields(fields) 
{	 
	var sum = 0;
	if ( fields != null ) 
	{
		for ( var i = 0; i < fields.length; i++) 
		{
			if ( fields[i] != null ) {
				var val = fields[i].value * 1.0;
				sum = sum + val;
			}
	//		alert("field = " + fields[i].name + "; sum = " + sum);
		}
	}
	return sum;
}


/*
==================================================================
lTrim(string) : Returns a copy of a string without leading spaces.
==================================================================
*/
function lTrim(str)
/*
   PURPOSE: Remove leading blanks from our string.
   IN: str - the string we want to LTrim
*/
{
   var whitespace = new String(" \t\n\r");

   var s = new String(str);

   if (whitespace.indexOf(s.charAt(0)) != -1) {
      // We have a string with leading blank(s)...

      var j=0, i = s.length;

      // Iterate from the far left of string until we
      // don't have any more whitespace...
      while (j < i && whitespace.indexOf(s.charAt(j)) != -1)
         j++;

      // Get the substring from the first non-whitespace
      // character to the end of the string...
      s = s.substring(j, i);
   }
   return s;
}

/*
==================================================================
rTrim(string) : Returns a copy of a string without trailing spaces.
==================================================================
*/
function rTrim(str)
/*
   PURPOSE: Remove trailing blanks from our string.
   IN: str - the string we want to RTrim

*/
{
   // We don't want to trip JUST spaces, but also tabs,
   // line feeds, etc.  Add anything else you want to
   // "trim" here in Whitespace
   var whitespace = new String(" \t\n\r");

   var s = new String(str);

   if (whitespace.indexOf(s.charAt(s.length-1)) != -1) {
      // We have a string with trailing blank(s)...

      var i = s.length - 1;       // Get length of string

      // Iterate from the far right of string until we
      // don't have any more whitespace...
      while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)
         i--;


      // Get the substring from the front of the string to
      // where the last non-whitespace character is...
      s = s.substring(0, i+1);
   }

   return s;
}

/*
=============================================================
trim(string) : Returns a copy of a string without leading or trailing spaces
=============================================================
*/
function trim(str)
/*
   PURPOSE: Remove trailing and leading blanks from our string.
   IN: str - the string we want to Trim

   RETVAL: A Trimmed string!
*/
{
   return rTrim(lTrim(str));
}

/* OLD FUNCTIONS */

function doSum(a,bar,bat){
   a.value = check(a.value,bar,bat);
}

function check(a,bar,bat) 
{
	var dotFound = false;
	var aVal = a.value;

//	alert(aVal);
	
   	var b = "";
   	for(i=0;i<=aVal.length;i++)
	{
   		var u = aVal.charAt(i);
   		if(bar == "1")
		{
			if(u!=" ")
			{
				var b = b+u
			}
		}
   		if(bat == "2")
		{
			if(u>="0"&&u<="9")
			{
				var b = b + u;
			}
			if ( u=="." && dotFound == false) {
				var b = b + u;
				dotFound = true;
			}			
		}
   	}
	a.value= b;
}
	

function comaDel(element,lth,rex,bar,bat)
{	
	a = element.value;

	if ( a == '' ) 
	{
		return;
	}
		
	var b = "";
	for(i=0;i<=a.length;i++)
	{
		var u = a.charAt(i);
		if(rex=="1")
		{			
			if( u >= "0" &&  u <= "9" || u==".")
			{
				u="";
			}
		}
		if(bar=="2")
		{
			if(u==" ")
			{
				u="";
			}
		}
		if(bat=="3")
		{
			if(u==".")
			{
				break;
			}
			if(isNumberChar(u) == "0")
			{
				u="";
			}
		}
		if(bat=="4")
		{
			if(isNumberChar(u) == "0")
			{
				u="";
			}
		}
		if(u ==","||u=="'"||u=="\"")
		{
			u="";
		}
		
		b = b + u;
	}
	if(b.length > (lth*1.0))
	{
		b = b.substring(0,(lth*1.0));
	}
	element.value = b;
}
	
function postDel(a,lth,rex,bar,bat)
{	
	var valid = true;
	
	comaDel(a,6,0,2,0);
	
	var b = "";
	post=a.value
	
	for(i=0;i<=post.length;i++)
	{
		var u = post.charAt(i);
		
		var b = b + u;
	}
	if(b.length<6 && b.length > 0)
	{
	
		alert("Postal Code must be 6 characters Long")
		// alert(getStaticText('popups','PC6Chars'));
//		a.focus();
		valid = false;
//		return "";
		
	}
	
	var p1=post.charAt(0);
	var p2=post.charAt(1);
	var p3=post.charAt(2);
	var p4=post.charAt(3);
	var p5=post.charAt(4);
	var p6=post.charAt(5);
	
	var p1UC=p1.toUpperCase();
	var p3UC=p3.toUpperCase();
	var p5UC=p5.toUpperCase();
	
	
	
	if (isAlphaChar(p1UC)&&isNumberChar(p2)&&isAlphaChar(p3UC)&&isNumberChar(p4)&&isAlphaChar(p5UC)&&isNumberChar(p6))
	{
		b = p1UC + p2 + p3UC + p4 + p5UC + p6;
	}
	else	
	{	
		alert("You have entered an improper Canadian Postal Code")
		//alert(getStaticText('popups', 'PCImproper'))
//		a.focus();
		valid = false;
//		a.value = '';
//		return;
	}
	
	if(b.length > (lth*1.0))
	{
		b = b.substring(0,(lth*1.0));
	}
//	return b;

	if ( valid ) 
	{
		a.value = b;
	}
	else 
	{
		a.value = '';
	} 
}
	
function isAlphaChar(chr) 
{
	var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxyz';

	return (alphabet.indexOf(chr) != -1);
}

function isNumberChar(chr) {
	var alphabet = '0123456789';
	
	return (alphabet.indexOf(chr) != -1);
}

/* CALCULATES LOAN TO VALUE RATIO */
function LTVcalc(mortgage, mortgage2, appraise){
//	return (MORTGAGE/APPRAISE) + (MORTGAGE2/APPRAISE);
	return (( mortgage * 1.0 + mortgage2 * 1.0 ) / appraise);
}

/* CALCULATES TOTAL MORTGAGE FINANCING */
function calcTotal(MORTGAGE, LTV)
{
	if(LTV<=.75){
		return MORTGAGE * 1.00;
	}
	else if(LTV>.75&&LTV<=.80){
		return MORTGAGE*1.01;   // 1.0125
	}
	else if(LTV>.80&&LTV<=.85){
		return MORTGAGE*1.0175;   // 1.02
	}
	else if(LTV>.85&&LTV<=.90){
		return MORTGAGE*1.02;    // 1.025
	}
	else if(LTV>.90){
		return MORTGAGE*1.0325;  // 1.0375
	}
}

// CALCULATES GDS AND TDS RATIOS 
function Ratios(PAY1, PAY2, HEAT, TAX, DEBT, INCOME)
{
	return (PAY1/INCOME)+(PAY2/INCOME)+(HEAT/INCOME)+(TAX/INCOME)+(DEBT/INCOME);
}


// CALCULATES MORTGAGE PAYMENT ACCORDING TO VALUES ENTERED INTO THE QUALIFIER BY THE USER
function calcPay(MORTGAGE, AMORT, RATE, COMPOUND, FREQ)
{

	var compound = COMPOUND/12;
	var monTime = AMORT * 12;
	var yrRate = RATE/COMPOUND;
	var rdefine    = Math.pow((1.0 + yrRate),compound)-1.0;
	var PAYMENT = (MORTGAGE*rdefine * (Math.pow((1.0 + rdefine),monTime)))/  ((Math.pow((1.0 + rdefine),monTime)) - 1.0);
	if(FREQ==12) {
		return PAYMENT;
	}
	else if(FREQ==26||FREQ==24) {
		return PAYMENT/2.0;
	}
	else if(FREQ==52) {
		return PAYMENT/4.0;
	}
}

function helppopUp(URL, language, height)
{
	helpURL = ""+"/" + language + "/"+URL;
//	alert("helpURL = " + helpURL);
	
	day = new Date();
	id = day.getTime();
	eval("page" + id + " = window.open(helpURL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=475,height="+height+"');");
}

function popUp(URL)
{
alert("URL = " + URL);
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=500,height=400');");
}

function checkPhoneNumberLength(field)
{
	var a = field.value;
	
	if ( a.length < 10 )
	{
		field.value = "";
		alert("All phone numbers must be 10 digits long");
	}
}

/*__________________GLOBAL VARIABLES__________________*/
mother="lendata";
chkDate = 'datedata';
lendinfo = "NoQual";
numDays=60;
numDateDays = 4;
today=new Date();
waitWin();

//PARSES THE COOKIE FOR VARIABLES
function GetCk(n)
{
	return parseCookie(lendinfo,n);
}

function makeArray(NumElements)
{
	var Count;
	this.length = NumElements;
	for (Count=1; Count<=NumElements; Count++)
		this[Count] = 0;
	return(this);
}

//PURPOSE OF MORTGAGE
GetPurp = new makeArray(10);
GetPurp[0] = "NA";
GetPurp[1] = "Purchase";
GetPurp[2] = "Switch/Transfer";
GetPurp[3] = "Equity Take Out";
GetPurp[4] = "Refinance";
GetPurp[5] = "Construction - one advance";
GetPurp[6] = "Construction - multiple advances";
GetPurp[7] = "Purchase and Improvement";
GetPurp[8] = "Port";
GetPurp[9] = "Pre-Approval";
	
//PAYMENT FREQUENCY
GetPFrq = new makeArray(6);
GetPFrq[0] = "NA";
GetPFrq[1] = "Monthly";
GetPFrq[2] = "Semi-Monthly";
GetPFrq[3] = "Bi-Weekly";
GetPFrq[4] = "Weekly";

//BUILDING TYPE
GetBTyp = new makeArray(9);
GetBTyp[0] = "NA";
GetBTyp[1] = "Single Family Res";
GetBTyp[2] = "Semi-Detatched";
GetBTyp[3] = "Duplex";
GetBTyp[4] = "Triplex";
GetBTyp[5] = "Recreational";
GetBTyp[6] = "Mobile Home";
GetBTyp[7] = "Row";
GetBTyp[8] = "Stacked";

//OCCUPANCY
GetOcc = new makeArray(4);
GetOcc[0] = "NA";
GetOcc[1] = "Owner Occupied";
GetOcc[2] = "Rented";

//SEWAGE
GetSew = new makeArray(5);
GetSew[0] = "NA";
GetSew[1] = "Municipal";
GetSew[2] = "Septic";
GetSew[3] = "None";

//PRODUCT CODE


//LENDER CODES
GetLen = new StringArray(1);
GetLen['COP01'] = "Co-operative Trust";

/*VARIABLES FROM COOKIE*/
PURP = "";
var VARI = new makeArray(25);
VARI[0] = "";
VARI[1] = "";
VARI[2] = "";
VARI[3] = "";
VARI[4] = "";
VARI[5] = "";
VARI[7] = "";
VARI[8] = "";
VARI[9] = "";
VARI[10] = "";
VARI[11] = "";
VARI[12] = "";
VARI[13] = "";
VARI[14] = "";
VARI[15] = "";
VARI[16] = "";
VARI[17] = "";
VARI[18] = "";
VARI[19] = "";
VARI[20] = "";
VARI[21] = "";
VARI[22] = "";
VARI[23] = "";
VARI[24] = "";

var BV = new makeArray(70);

    BV[3] = "Purpose of Loan";
    BV[4] = "Value of Home";
    BV[5] = "Mortgage Amount Required";
    BV[6] = "Approx. Date Funds Required";
    BV[7] = "Contact Email";
    BV[8] = "Title";
	BV[9] = "First Name";
    BV[10] = "Last Name";
    BV[12] = "Date of Birth";
    BV[13] = "Social Insurance Number";
    BV[14] = "Marital Status";
    BV[15] = "Home Phone Number";
    BV[17] = "Work Phone Number";
    BV[10] = "Email Address";
    BV[25] = "Current Address Number";
    BV[26] = "Current Address Street Name";
    BV[30] = "Current City";
    BV[31] = "Current Province";
    BV[32] = "Current Postal Code";
    BV[33] = "Current Address Length of Time";
    BV[34] = "Residential Status";
    BV[46] = "Occupation";
    BV[47] = "Industry Sector";
    BV[48] = "Present Employer Name";
    BV[50] = "Present Employer Phone Number";
    BV[52] = "Present Employer Address Number";
    BV[53] = "Present Employer Address Street Name";
    BV[57] = "Present Employer City";
    BV[58] = "Present Employer Province";
    BV[59] = "Present Employer Postal Code";
    BV[62] = "Present Employer Length of Employment";
    BV[63] = "Years in Line of Business";
    BV[64] = "Present Employer Annual Income";
    BV[65] = "Present Employer Type of Income";
    BV[68] = "Previous Employer Name";
	//BV[67] = "Previous Employer Address";
    //BV[68] = "Previous Employer City";
    //BV[69] = "Previous Employer Province";
    BV[72] = "Previous Occupation Type";
    BV[73] = "Previous Employer Length of Employment";
    BV[74] = "Previous Employer Annual Income";


       var PV = new makeArray(26);
    PV[255] = "Property Address Street Number";
    PV[256] = "Property Address Street Name";
    PV[260] = "Property City";
    PV[261] = "Property Province";
    PV[262] = "Property Postal Code";
    PV[267] = "Number of Bedrooms";
    PV[268] = "Number of Units";
    PV[269] = "Age of Building";
    PV[270] = "Dwelling Style";
    PV[271] = "Tenure";
    PV[272] = "Environmental Hazard";
    PV[273] = "Home Improvement";
    PV[276] = "Lot Size";
    PV[279] = "Garage Type";
    PV[280] = "Garage Size";
    PV[281] = "Household Heating";
    PV[285] = "Property Value Source";
    PV[288] = "Down Payment Source";
    PV[289] = "Estimated Closing Date";
    PV[290] = "Original Mortgage Amount";
    PV[291] = "Improvements Description";
    PV[292] = "Improvements Value";
    PV[293] = "Previous Closing Date";
    PV[294] = "Previous Sale Price";

    var LV = new makeArray(10);
    LV[306] = "First Time Home Buyer";
    LV[307] = "Present Borrower with this This Lender";

/* EMAIL VALIDATION FUNCTION */

function emailCheck (emailStr, mode) {

// if null then do not check anything
	if (emailStr.length>0)
	{	
		var sModeTxt = '';
		
		if (mode==1)
		{
			var sModeTxt="Applicant 1: ";
		}
		if (mode==2)
		{
			var sModeTxt="Applicant 2: ";
		}
		if (mode==3)
		{
			var sModeTxt="Partner: ";
		}

		var checkTLD=1;
		var knownDomsPat=/^(com|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum)$/;
		var emailPat=/^(.+)@(.+)$/;
		var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]";
		var validChars="\[^\\s" + specialChars + "\]";
		var quotedUser="(\"[^\"]*\")";
		var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
		var atom=validChars + '+';
		var word="(" + atom + "|" + quotedUser + ")";
		var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
		var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");
		var matchArray=emailStr.match(emailPat);

		if (matchArray==null) 
		{
			alert(sModeTxt + "Email address seems incorrect (check @ and .'s)");
			return false;
		}
		var user=matchArray[1];
		var domain=matchArray[2];
		
		for (i=0; i<user.length; i++) 
		{
			if (user.charCodeAt(i)>127) 
			{
				alert(sModeTxt + "Ths username contains invalid characters.");
				return false;
			}
		}
		
		for (i=0; i<domain.length; i++) 
		{
			if (domain.charCodeAt(i)>127) 
			{
				alert(sModeTxt + "Ths domain name contains invalid characters.");
				return false;
			}
		}

		// See if "user" is valid 		
		if (user.match(userPat)==null) 
		{		
			// user is not valid			
			alert(sModeTxt + "The username doesn't seem to be valid.");			
			return false;
		}

		var IPArray=domain.match(ipDomainPat);
		if (IPArray!=null) 
		{
			for (var i=1;i<=4;i++) 
			{
				if (IPArray[i]>255) 
				{
					alert(sModeTxt + "Destination IP address is invalid!");
					return false;
   				}
			}
			return true;
		}
 
		var atomPat=new RegExp("^" + atom + "$");
		var domArr=domain.split(".");
		var len=domArr.length;
		for (i=0;i<len;i++) 
		{
			if (domArr[i].search(atomPat)==-1) 
			{
				alert(sModeTxt + "The domain name does not seem to be valid.");
				return false;
			}
		}

		if (checkTLD && domArr[domArr.length-1].length!=2 && domArr[domArr.length-1].search(knownDomsPat)==-1) 
		{
			alert(sModeTxt + "The address must end in a well-known domain or two letter " + "country.");
			return false;
		}

		if (len<2) 
		{
			alert(sModeTxt + "This address is missing a hostname!");
			return false;
		}
		return true;
	}
}

/* CHECK FOR ALPHA AND NUMBERIC VALUES */

function isNumberChar (InString)  {
	if(InString.length!=1) 
		return (false);
	RefString="1234567890";
	if (RefString.indexOf (InString, 0)==-1) 
		return (false);
	return (true);
}

function isAlphaChar (InString)  {
	if(InString.length!=1) 
		return (false);
	RefString="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	if (RefString.indexOf (InString, 0)==-1) 
		return (false);
	return (true);
}

/*__________________COOKIE FUNCTIONS__________________*/

function checkMandatoryFields()
{
	var mortgage = new Array("fLoanPurp", "fHomeValue", "fMortgageAmountRequested", "fApproxDate", "fMrtType");
	var appMand = new Array( "FirstName","LastName", "DOB", "EmailAddr", "Address1", "Address2", "CurrentCity", "CurrentProvince", 
								"CurrentCode", "HomePhone", "CurrentAddrTime", "Occupation", "PresEmpName", "LengthService", 
								"AnnualIncome", "TypeOfIncome");
	
	// Checking Mortgage Mandatory Fields
	for(var i=0; i< mortgage.length; i++)
	{
		var element = document.getElementById(mortgage[i]);
		if ( element.value == "" || element.selectedIndex == 0 )
		{
			alert("Please fill out all mandatory fields");
			return false;
		}		
	}

	// Checking Applicant Mandatory Fields		
	for (var i = 0; i < appMand.length; i++)
	{
		var element = document.getElementById("b"+appMand[i]);
		if ( element.value == "" || element.selectedIndex == 0 )
		{
			alert("Please fill out all mandatory fields");
			return false;
		}
	}	
	
	var liabilities = new Array("finance", "mortgage", "card", "loan");
	for(var i=0; i<liabilities.length; i++)
	{
		var where = document.getElementById(liabilities[i]+"Where").value;
		var amount = document.getElementById(liabilities[i]+"Balance").value;
		var payment = document.getElementById(liabilities[i]+"Payment").value;
		
		if ( amount != "" && amount != 0 && (payment == 0 || where == ""))
		{
			alert("Liabilities owing must have monthly mortgage payment and financial institution entered.");
			return false;
		}
	}
	
	return true;
}


/* STORES ALL THE VALUES ENTERED INTO THE APPLICATION IN A SERIES OF HTTP COOKIES (ONE FOR EACH SECTION) WHEN THE USER CLICKS ON STORE INFO. IF THERE IS A TEXT FIELD WITH NO VALUE ENTERED, A SPACE IS SAVED AS THE VALUE OF THAT FIELD */
function appwrite(FinVal,StartVal,cookName,debug)
{
	var cookVar=cookName;
	var expire = new Date();
	var DATA = 'E';

	expire.setTime (expire.getTime() + (numDays * 24 * 3600000));

	for(i=StartVal;i<=FinVal;i++)	{
		if(cookName=='appcookie2'){
			var getVal = (i + 86)-6;
		}
		if(cookName!='appcookie2') {
			var getVal = i-1;
		}
if(i==3||i==8||i==27||i==28||i==31||i==34||i==46||i==47||i==54||i==55||i==65||i==259||i==260||i==263||i==272||i==274||i==275||i==283||i==286||i==287||i==296){		

		if (document.forms[0].elements[getVal].name == "DownPymntSource"){
			var list = " ";
				for (var count=0; count<document.forms[0].elements[getVal].length; count++) {
				
					if (document.forms[0].elements[getVal].options[count].selected){
					list += "1,";
					}
				else{
					list += "0,";
					}
				}
			list.length = (list.length - 1);
			DATA = DATA + '`' + list;
	
		}
		else{
			DATA = DATA + '`' + document.forms[0].elements[getVal].selectedIndex;
			}
		}
	else {
		DATA = DATA + '`' + checknull(document.forms[0].elements[getVal].value);}
	if (debug) { alert('('+i+')'+getVal+':['+checknull(document.forms[0].elements[getVal].name)+'] :['+checknull(document.forms[0].elements[getVal].value)+']');}	
	}

	//}
	document.cookie = cookVar +"=" + escape(DATA) + ";expires=" + expire.toGMTString();
}

/* THIS FUNCTION IS CALLED UPON WHEN THE USER CLICKS THE STORE INFO BUTTON. IT SENDS THE APPROPRIATE INFORMATION TO SAVE EACH COOKIE IN THE SERIES FOR THE APPLICATION TO THE SAVE COOKIE FUNCTION ABOVE */
function saveCooksOld()
{
if(lendinfo==" "){
alert('You must start at the Mortgage Qualifier');
	location.href="../apps/inambapp1.asp";
}
else{
if(navigator.appName.substring(0,9) == "Microsoft" && (navigator.appVersion.substring(0,3)=="3.0" || navigator.appVersion.indexOf("MSIE 3.0")>=0) && (navigator.appVersion.indexOf("Windows 3.1")>=0)
)
{alert('Your Browser Cannot Store This Application.');}
else{	
	// Modified JA 2000/09/05
	appwrite(88,1,'appcookie1',false); /* APPLICANT 1 */
	appwrite(88,8,'appcookie2',false); /* APPLICANT 2 */
	appwrite(296,255,'propcookie',false); /* PROPERTY */
	appwrite(352,297,'fincookie',false); /* FINANCIAL */
	appwrite(376,353,'loncookie',false); /* LOAN DETAILS */
	fixpro('Your Data Has Been Stored.');
}
}
}

function reloadCooks()
{
	reloadForm(document.end, "mccText", ":text:");
	reloadForm(document.end, "mccSelect", ":select-one:");
	var notes = document.getElementById("lNoteScreen");		
	notes.value = getCookieItem("mccNotes", "LNoteScreen");
	
}


function saveCooks()
{
	saveForm(document.end, "mccText", ":text:");
	saveForm(document.end, "mccSelect", ":select-one:");		
	var notes = document.getElementById("lNoteScreen");
	//alert("notes.hasChildNodes() = " + notes.hasChildNodes());
	//alert("notes.value = " + notes.value);
	var text = notes.value;
	setCookieItem("mccNotes", "LNoteScreen", text);
}
/* THIS FUNCTION IS CALLED UPON WHEN THE USER CLICKS THE RELOAD INFO BUTTON. IT SENDS THE APPROPRIATE INFORMATION TO UPDATE THE FORM FROM THE SERIES OF COOKIES TO THE UPDATE FORM FUNCTION ABOVE */
function reloadCooksOld()
{

if(lendinfo==" "){
	alert('You must start at the Mortgage Qualifier.');
	location.href="../qual/ingmbapp1.asp";
}
else{
if(GetCookie('appcookie1')==" " && GetCookie('appcookie2')==" " &&  GetCookie('propcookie')==" " && GetCookie('loncookie')==" ")
{fixpro('You do not have any Stored Application Data.');}
else{

// Modifed JA 2000/09/05
UpdateForm(88,1,'appcookie1',false); /* APPLICANT 1 */
UpdateForm(88,8,'appcookie2',false); /* APPLICANT 2 */
UpdateForm(296,255,'propcookie',false); /* PROPERTY */
UpdateForm(352,297,'fincookie',false); /* FINANCIAL */
UpdateForm(376,353,'loncookie',false); /* LOAN DETAILS */
}
}
}

/* RETURNS A SPACE IF THERE IS NO ENTRY IN THE FIELD WHEN THE USER CLICKS STORE INFO */
function checknull(theEntry)
{
if (theEntry =="") return " ";
return theEntry;
}

/*__________________DATA FORMATTING__________________*/

/* THE FOLLOWING FUNCTION CHECKS THAT ALL NUMERIC VALUES ARE REAL NUMBERS AND REMOVES DOUBLE DECIMALS */ 
function doSum(a,bar,bat){ 
   a.value = check(a.value,bar,bat);
}
function check(a,bar,bat) {
var aVal=a.value;
   var b = "";
   for(i=0;i<=aVal.length;i++){
   var u = aVal.charAt(i);
   if(bar == "1"){if(u!=" "){var b = b+u}}
   if(bat == "2"){if((u>="0"&&u<="9")||u=="." ){var b = b + u;}}
   }
a.value= b;
}

/* THE FOLLOWING FUNCTION IS USED TO CHECK THE VALIDITY OF THE NUMBERS ENTERED INTO THE FINANCIAL INFORMATION SECTION BEFORE THEY ARE USED TO CALCULATE RESULTS */
function numCheck(a) 
{

   var pest = 0;
   var b = "";
   for(i=0;i<=a.length;i++)
   {
   var u = a.charAt(i);
      if((u>="0"&&u<="9")||u==".")
      {
      	if(u=="."){var pest = pest+1
      	if(pest==2){break;}}
var b = b + u; }}
return b;
}

/* CHECKS THAT DATES ARE ENTERED INTO THE FIELDS IN THE CORRECT FORMAT ILLUSTRATED. ALSO CHECKS THAT THE VALUES ENTERED FOR DAY AND MONTH ARE VALID */

function Disp(a,txt,x){
a.select();
a.focus();
a.value="";
fixpro('You have entered '+x+ ' as the '+txt+ '. This is not valid.');
return;
}
//FUNCTION RETURNS THE NUMBER OF DAYS IN FEBRUARY FOR THE GIVEN YEAR
function getFebDays(Year)
{
if(((Year % 4)==0) && ((Year % 100)!=0)|| (( Year %400)==0)){
	return (1);
}
else{
	return (0);
}
}

function getDaysofYear(x,y)
{
if(getFebDays(y)==1){
	leap=29;
}
else{
	leap=28;
}
monDays = new StringArray(13)
monDays['01'] = 31;
monDays['02'] = leap;
monDays['03'] = 31;
monDays['04'] = 30;
monDays['05'] = 31;
monDays['06'] = 30;
monDays['07'] = 31;
monDays['08'] = 31;
monDays['09'] = 30;
monDays['10'] = 31;
monDays['11'] = 30;
monDays['12'] = 31;
return monDays[x];
}

function CloCheckDat(x,ret){

var month = x.substring(0,2);
var day = x.substring(2,4);
var year =  x.substring(4,8);
var dateassy = (month + '/' + day + '/' + year)
if (today.getTime() > Date.parse(dateassy)){
	alert ("You have entered " + x + " as the closing date. The closing date must be greater than todays date.")
ret.focus()
}
}

    function DChk(x,n,a,mthchk,yearchk){

    var txtval = "";
    if(today.getYear()<100){
    	var tday= (1900+(today.getYear()*1.0));
    }
    else{
    	var getyrStr = today.getYear()+'';
    	if(getyrStr.length<4){
    		var tday = (1900+(today.getYear()*1.0));
    	}
    	else{
    		var tday = today.getYear()*1.0;
    	}
    }

    if(n=="m"&&(x >11||x<0)){
    var txtval = 'month';
    }
    if(n=="ms"&&(x >12||x<1)){
    var txtval = 'month';
    }
    if(n=="d"&&(x > getDaysofYear(mthchk,yearchk)||x < 1)){
    var txtval='day';
    }
    if(n=="y"&&(x > tday)){	
    var txtval = 'year';
    }
    if(txtval != ""){
    Disp(a,txtval,x);return true;}
    else{return false;}
    }


    /* DATE VALIDATION CONTROL FUNCTION */
    function chekDat(a,leth)
    {
    if(a.value==""){
    }
    else{
    box = a.value;

    if (box.length != leth)
    {
    var datcal = ''+box;
    Disp(a,"date",datcal);
    return;}

    if(leth=="4"){
    DChk((box.substring(2,4) * 1.0),"m",a);
    }

    if(leth=="8"){
    var yr = box.substring(4,8);
    var mth = box.substring(0,2);
    	if(DChk((box.substring(0,2) * 1.0),"ms",a,mth,yr)==false){
    		if(DChk((box.substring(2,4) * 1.0),"d",a,mth,yr)==false){
    			DChk((box.substring(4,8) * 1.0),"y",a,mth,yr);
    		}
    	}
    }
    }
    }

    /* Closing DATE VALIDATION CONTROL FUNCTION */
    
   function CloDChk(x,n,a,mthchk,yearchk){
    var txtval = "";
    if(today.getYear()<100){
    	var tday= (1900+(today.getYear()*1.0));
    }
    else{
    	var getyrStr = today.getYear()+'';
    	if(getyrStr.length<4){
    		var tday = (1900+(today.getYear()*1.0));
    	}
    	else{
    		var tday = today.getYear()*1.0;
    	}
    }

    if(n=="m"&&(x >12||x<0)){
    var txtval = 'month';
    }
    if(n=="ms"&&(x >12||x<1)){
    var txtval = 'month';
    }
    if(n=="d"&&(x > getDaysofYear(mthchk,yearchk)||x < 1)){
    var txtval='day';
    }
    if(n=="y"&&(x > tday + 10000)){	
    var txtval = 'year';
    }
    if(txtval != ""){
    Disp(a,txtval,x);return true;}
    else{return false;}
    }


function CloChekDat(a,leth)
    {
    if(a.value==""){
    }

    else{
    box = a.value;

    if (box.length != leth)
    {
    var datcal = ''+box;
    Disp(a,"date",datcal);
    return;}

    if(leth=="4"){
    CloDChk((box.substring(2,4) * 1.0),"m",a);
    }

    if(leth=="8"){
    var yr = box.substring(4,8);
    var mth = box.substring(0,2);
    
    if(CloDChk(box.substring(0,8),"fd",a,mth,yr)==false){
    	
    	if(CloDChk((box.substring(0,2) * 1.0),"ms",a,mth,yr)==false){
    		if(CloDChk((box.substring(2,4) * 1.0),"d",a,mth,yr)==false){
    			
    						CloDChk((box.substring(4,8) * 1.0),"y",a,mth,yr)
    		}
    	
    }
    }

    }
    }
	}


/* MAKES SURE TEXT IS CORRECT LENGTH AND TRUNCATES ANY CHARACTERS AFTER THE SPECIFIED LENGTH.*/

function comaDel2(a,lth,rex,bar,bat) 
{
var b = "";

for(i=0;i<=a.length;i++)
{
var u = a.charAt(i);
if (bat==4 && i==0)
	{
		if(u=="0"){u="";
			if (u=="."){break;}	
}
}
if(rex=="1"){if( u >= "0" &&  u <= "9" || u=="."){u=""}}
if(bar=="2"){if(u==" "){u=""}}
if(bat=="3"){if(u=="."){
break;}
if(isNumberChar(u) == "0"){u="";}}
if(bat=="4"){if(isNumberChar(u) == "0"){u="";}}
if(u ==","||u=="'"||u=="\""){u="";}
var b = b + u;
}
if(b.length > (lth*1.0)){b = b.substring(0,(lth*1.0));}
return b;
}

//POSTAL CODE VALIDATION(TM)

/*function postDel(a,lth,rex,bar,bat)
{
if(a.value==""){ }

else{a.value = postDel2(a,lth,rex,bar,bat);}
}*/

function postDel2(a,lth,rex,bar,bat) 
{

var b = "";
post=a.value

for(i=0;i<=post.length;i++)
{
var u = post.charAt(i);

var b = b + u;
}
if(b.length<6){

alert("Postal Code must be 6 characters Long")
a.focus();
return "";

}

var p1=post.charAt(0);
var p2=post.charAt(1);
var p3=post.charAt(2);
var p4=post.charAt(3);
var p5=post.charAt(4);
var p6=post.charAt(5);

var p1UC=p1.toUpperCase();
var p3UC=p3.toUpperCase();
var p5UC=p5.toUpperCase();

if (isAlphaChar(p1UC)&&isNumberChar(p2)&&isAlphaChar(p3UC)&&isNumberChar(p4)&&isAlphaChar(p5UC)&&isNumberChar(p6)){} 

else

{

alert("You have entered an improper Canadian Postal Code")
a.focus();
return "";
}

if(b.length > (lth*1.0)){b = b.substring(0,(lth*1.0));}
return b;
}
 
//CALCULATE LOT SIZE  

function calcLotSize() 
{
var w = document.forms[0].LotWidth.value
var d = document.forms[0].LotDepth.value
	
	LotCalc= w * d;

		document.forms[0].LotSize.value = LotCalc;
	}

/* VALIDATE EMPLOYMENT STATUS BY EMPLOYER INFO ENTERED */

function checkEmpStatus(){
if (document.forms[0].CCurrentEmployStatus.selectedIndex=="1") {
		 if (document.forms[0].Coccupation.selectedIndex!="7"||document.forms[0].CIndustrySector.selectedIndex!="13"||document.forms[0].CPresEmpName.value!="N/A"){
	(document.forms[0].CCurrentEmployStatus.selectedIndex="0")
	
		}
	}

if(document.forms[0].CCurrentEmployStatus.selectedIndex=="0"){

for (i=123;i<=143;i++){
			if (i==127||i==129||i==130||i==133||i==134||i==136||i==140||i==141) {
					(document.forms[0].elements[i].value="")
					} 	
						if (i==131||i==132||i==135||i==142) {
						(document.forms[0].elements[i].selectedIndex="0")
	}
	
}
}
}	
//CLOSING DATE VALIDATION  - MAX 90 DAYS (TM)  

function dayToDays(closeVar)
{
		return(Math.floor(closeVar.getTime() / (1000 * 60 * 60 * 24)))
}

function daysTill(inDate) 
{
	now =  new Date
			return dayToDays(inDate) - dayToDays(now)
}


function chkClose(a){
input=a.value
		closeYr=input.substring(4,8)
		closeDay=input.substring(2,4);
		closeMonth=input.substring(0,2);
					futuredate= new Date(closeYr,(closeMonth*1)-1,closeDay)	
	if ((input)=="")
{
		return
}
				
	if (daysTill(futuredate)< 1){
				alert("The closing date must be greater than todays Date")
		a.focus();
		return "";
		
}
		
	if ((daysTill(futuredate))>90) {
						alert("The closing date must be less than 90 Days")
a.focus();
return "";
}

}



function isNumberChar (InString)  {
	if(InString.length!=1) 
		return (false);
	RefString="1234567890";
	if (RefString.indexOf (InString, 0)==-1) 
		return (false);
	return (true);
}

function isAlphaChar (InString)  {
	if(InString.length!=1) 
		return (false);
	RefString="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	if (RefString.indexOf (InString, 0)==-1) 
		return (false);
	return (true);
}

/* TESTS VERSIONS FOR WHICH WILL SUPPORT POP UP WINDOWS */
function versTest()
{
var one = '';
var two = '';

if (
(navigator.appName.substring(0,8)=="Netscape" && (navigator.appVersion.substring(0,3) == "3.0" ||  navigator.appVersion.substring(0,3) =="4.0")))
{var one='true';}
if(
 (navigator.appName.substring(0,9) == "Microsoft" && navigator.appVersion.substring(0,3) == "3.0" && navigator.appVersion.indexOf("Macintosh")>=0))
{var two='true';}

if(one=='true' || two=='true' ||
(navigator.appName.substring(0,9) == "Microsoft" && navigator.appVersion.indexOf("MSIE 3.0")>=0 && 
navigator.appVersion.indexOf("Windows 3.1")>=0)
)
{return true;}
else
{return false;}

}

/* TESTS IF VERSION IS MSIE 3.0 FOR MAC */
function msTest()
{
if(navigator.appName.substring(0,9) == "Microsoft" && 		(navigator.appVersion.substring(0,3) == "3.0" && navigator.appVersion.indexOf("Macintosh")>=0))
{return true;}
else
{return false;}

}


function nineTest()
{
if(navigator.appName.substring(0,9) == "Microsoft" && (navigator.appVersion.substring(0,3)=="3.0" || navigator.appVersion.indexOf("MSIE 3.0")>=0) && (navigator.appVersion.indexOf("Macintosh")==-1 || navigator.appVersion.indexOf("Windows 3.1")== -1)
)
{return true;}
else
{return false;}
}

/*OPENS PLEASE WAIT WINDOW WHEN FORM IS LOADING*/
function waitWin()
{
if(versTest() == true){
if(msTest()==true){var winNam='';}
else{
		var slash = location.href.lastIndexOf("/")+1;
		var filNam = location.href.substring(0,slash);
//		var winNam = filNam+'appem.html';
}

wait = window.open(winNam,'WAIT','toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=no,copyhistory=no,width=300,height=75,outerWidth=350,outerHeight=125');
if(navigator.appName.substring(0,8) == "Netscape"){wait.focus();}
wait.document.write('<html><head><title>OME</title>');
wait.document.write('</head><body bgcolor=ffffff>');
wait.document.write('<p><center><font size=3 face="Arial, Helvetica">PLEASE WAIT...</font></center> <br> <font size=2 face="Arial, Helvetica" color=0000ff>The application form is loading, ');
wait.document.write('this window will close automatically.</font><p>');
wait.document.write('</center></body></html>');
wait.document.close();
}
else{wait='nowindow';}
}


/* OPENS WINDOW FOR PRESENCE & DATA VALIDATION */
 function fixpro(n)
{
var call = ""+fixpro.caller+"";
var sent = 'A value for this question must be entered or selected before the application can be sent.';

	if(versTest() == true){
		if(msTest()==true){
			var winNam='';
		}
		else{
			var slash = location.href.lastIndexOf("/")+1;
			var filNam = location.href.substring(0,slash);
//			var winNam = filNam+'appem.html';
		}
fix = window.open(winNam,'FIX','toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=no,copyhistory=no,width=300,height=100,outerWidth=350,outerHeight=150');
		if(navigator.appName.substring(0,8) == "Netscape"){
			fix.focus();
		}
fix.document.write('<html><head><title>OME</title>');
fix.document.write('</head><body bgcolor=ffffff><form name=fixer>');
fix.document.write('<font size=2 face="Arial, Helvetica" color=0000ff>'+n+'</font><p>');

if(call.indexOf("VSend")>=0){
	fix.document.write('<font size=2 face="Arial, Helvetica">'+sent+'</font>');
}
fix.document.write('<p><center><input type=button value=OK onClick=self.close()>');
fix.document.write('</center></form></body></html>');
fix.document.close();

	}
	else{
if(call.indexOf("VSend")>=0){
var alsent = sent
}
else{var alsent="";}
	
		alert(n+'\n'+ alsent);
	}
}

/* TESTS THE VALIDITY OF THE USER'S ENTRY FOR SIN NUMBER ACCORDING TO A GENERAL SIN NUMBER VALIDATION CALCULATION */
function getit(a)
{
if(a.value==""){}
else{

if((a.name=="BBorrowerSIN" && a.value==document.forms[0].CoBorrowerSIN.value) || (a.name=="CoBorrowerSIN" && a.value==document.forms[0].BBorrowerSIN.value))
{a.select();a.focus();a.value="";fixpro('Every person has a unique Social Insurance Number. You have entered the same number for more than one applicant. Please enter a correct Social Insurance Number.'); return;} 

var l = a.value;
var i = 0;
var b = "";
while (i < l.length ){
var u = l.charAt(i);
if(  u >= "0" &&  u <= "9" ) b += u;
i++;}
if(b.length != 9)
{a.select();
a.focus();a.value="";fixpro('You must enter a valid 9 digit Social Insurance Number.');}
else 
{var x = (b.charAt(0) * 1.0) + (b.charAt(2) * 1.0) + (b.charAt(4) * 1.0) + (b.charAt(6) * 1.0);
var y = b.charAt(1) +"" + b.charAt(3) + ""  + b.charAt(5) + "" + b.charAt(7);
var z = y*2;
var z2 = "" + z;
if(z2.length==4){
var w = x + (z2.charAt(0) *1.0) + (z2.charAt(1) * 1.0) + (z2.charAt(2) *1.0) + (z2.charAt(3) * 1.0);}
if(z2.length==3){
var w = x + (z2.charAt(0) *1.0) + (z2.charAt(1) * 1.0) + (z2.charAt(2) *1.0);}
if(z2.length==5){
var w = x + (z2.charAt(0) *1.0) + (z2.charAt(1) * 1.0) + (z2.charAt(2) *1.0) + (z2.charAt(3) * 1.0)+ (z2.charAt(4) * 1.0);}

var w2 = "" + w;
var q = (w2.substring(w2.length-1,w2.length))*1.0;
var k = 10 - q;
var l = w + k;
var pr = "" + (l - w);
var p = pr.substring(pr.length-1,pr.length);
var m = b.charAt(8);

if(m != p)
{a.select();
a.focus();
a.value="";fixpro('You must enter a valid 9 digit Social Insurance Number.');}}
}
}

/*__________________HELP__________________*/

/* OPENS A HELP WINDOW DISPLAYING THE APPROPRIATE HELP MESSAGE FROM THE ARRAY ACCORDING TO THE VALUES PASSED TO THIS FUNCTION FROM THE HELP LINK IN THE MORTGAGE APPLICATION FORM */
function winopen(name)
{
var linkit = "../help/"+name;
if(versTest() == true || nineTest() == true){
		
helpwindow = window.open(linkit,'helpscreen','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=250,height=180');
if(navigator.appName.substring(0,8) == "Netscape")
{helpwindow.focus();}
}
else{location.href=linkit;}
}

function StringArray(n)
{
this.length = n;
for (var i = 1; i <= n; i++)
this[i] = '' 
return this
}


function winopen1(page)
{
var linkit = "../help/" + page;
		
helpwindow = window.open(linkit,'openwindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=400,height=400');
if(navigator.appName.substring(0,8) == "Netscape")
{openwindow.focus();}

}



/*__________________CALCULATIONS__________________*/

/* SENDS THE VALUE FROM THE FINANCIAL INFORMATION SECTION TO A FORMATTING FUNCTION TO ENSURE THAT THE VALUE IS NUMERIC AND IN THE PROPER FORMAT. THIS FUNCTION IS CALLED EVERYTIME A VALUE FIELD IS CHANGED IN THE APPLICATION. */
function networths(input)
{
if(input.value == null || input.value.length ==0)
{input.value=0; networthx();}
else{input.value = numCheck(input.value);
networthx();}
}


/* DETERMINES THE RESULTING VALUES FOR THE TOTAL ASSETS, LIABILITIES AND NET WORTH AND ASSIGNS THE RESULT VALUES TO THE APPROPRIATE FIELDS IN THE MORTGAGE APPLICATION FORM */
function networthx()
{
	var assets = new Array("acib", "auto", "home", "other");
	var liabilities = new Array("finance", "mortgage", "card", "loan");
	
	var totAssets = 0;
	var totLiable = 0;
	var totMonPay = 0;	
	
	for(var i=0;i<liabilities.length;i++)
	{
		var liability = document.getElementById(liabilities[i]+"Balance");
		var monpay = document.getElementById(liabilities[i]+"Payment");
		totLiable += liability.value * 1.0;
		totMonPay += monpay.value * 1.0;
	}


	for(var i = 0; i < assets.length; i++)
	{
		var asset = document.getElementById(assets[i]+"Value");
		totAssets += asset.value * 1.0;
	}
	
	var net = totAssets - totLiable;
	document.getElementById("lTotalPayment").value = totMonPay;
	document.getElementById("aTotalValue").value = totAssets;
	document.getElementById("lTotal").value = totLiable;
	document.getElementById("lNetWorth").value = net;
}

/*__________________GENERAL FUNCTIONS__________________*/

/* PASSES INFORMATION FROM THE MORTGAGE QUALIFIER WHICH MUST BE INCLUDED IN THE APPLICATION FORM WHEN IT IS SENT TO HIDDEN FIELDS AT THE END OF THE APPLICATION IN THE CORRECT FORMAT REQUIRED. THIS FUNCTION IS CALLED ON LOAD OF THE APPLICATION FORM */

function hidFields(Start)
{
//var i=0;
//for(trp=Start;trp<=Start+24;trp++){
//var q = trp-1;
//var c = trp-Start;
//alert("value: "  + document.forms[0].elements[q].name) 
//document.forms[0].elements[q].value = VARI[c];
//}
//REMOVES SPACES FROM INTEREST RATES IN HIDDEN FIELDS
check(document.forms[0].DLoanValueRatio,0,2);
check(document.forms[0].DGDS,0,2);
check(document.forms[0].DTDS,0,2);
check(document.forms[0].DInterestRate,0,2);

}


 /*__________________DATA PRESENCE VALIDATION__________________*/

    function ControlSub()
	{
    	if(lendinfo==" ")
		{
    		alert('You must start at the Mortgage Qualifier');
    		location.href="CBasemtgApp1.asp";
    	}
		else
		{
    		hidFields(352);
    		
    		var post = document.forms[0].BCurrentCode.value.toUpperCase();
			
    		if(post=="M4W9Z9"){
    			document.forms[0].BLenderCode.value="CEB01"
    		}
			
    		if(post=="M5C9Z9"){
    			document.forms[0].BLenderCode.value="OME01"
    		}
    		
			if(checkMandatoryFields() == true) 
			{
				document.forms[0].submit();
    		}
    	}
    }

function checkBusHours()
{
	return true;
}




function VSend(y,i){

if(y==1||y==3){
	valTitle = "Applicant " + y +": ";
	var x = BV[i]
}

if(y==2){
	valTitle = "Applicant " + y +": ";
	var x = BV[i]
}



if(y==4){
	valTitle="Property Info: ";
	x = PV[i]
}
if(y==5){
	valTitle="Loan Details: ";
	x = LV[i]
}
fixpro(valTitle+""+x);
}



function  copyAddr()    
{
	var fields = new Array("Address1", "Address2", "Address3", "Address4", "CurrentUnitNum", "CurrentCity", "CurrentProvince", "CurrentCode", "HomePhone");
	for(var i=0; i<fields.length; i++)
	{
		var source = document.getElementById("b"+fields[i]);
		var destination = document.getElementById("c"+fields[i]);
				
		if ( source.type == "text" ) 
		{
			destination.value = source.value;
		}
		else
		{
			destination.selectedIndex = source.selectedIndex;
		}
		
	}
}


function browTest()
{
if((navigator.appVersion.substring(0,3) == 3.0 || navigator.appVersion.substring(0,3) == 4.0)&& navigator.appName.substring(0,8)=="Netscape"){
	return true;
}
else{
	return false;
}
}

function makeImg()
{
if(browTest()==true){
Img = new Image();
Img.src = "https://www.secureapp.com/MB/graphics/back_on.gif"; 
document.images.Back_button.src=Img.src;
}
else{}

} 

function clearImg()
{
if(browTest()==true){
OrImg= new Image();
OrImg.src="https://www.secureapp.com/MB/graphics/back_off.gif";
document.images.Back_button.src=OrImg.src;
}
else{}
}

function loadImg()
{
if(browTest()==true){
Img = new Image();
Img.src = "https://www.secureapp.com/MB/graphics/back_on.gif"
} 
else{}
}