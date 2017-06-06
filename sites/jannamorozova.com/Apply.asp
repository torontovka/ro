<%
option explicit
dim page : page = 3
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	<!--#include file="./include/meta.inc"-->

	<link href="mcc_styles.css" rel="stylesheet" type="text/css">

	<script src="application.js" type="text/javascript"></script>
	
	<style>
	
		h2
		{
			/*border-top:1px solid #666600;*/
			margin-bottom:10px;
			margin-top:20px;
			padding-top:10px;
			width:640px;
		}
		h3
		{
			margin-bottom:10px;
			margin-top:10px;
		}
		textarea
		{
			background-color: #ffffff;
		}

	</style>

</head>
<body id="index_5">

	<script type="text/javascript">function Go(){return}</script>

	<!--#include file="./include/header.inc"-->
		
	<div id="row1">
		<div class="indent">
			<div class="container line" style="background: transparent;">
				<div class="column2">
					
					<div class="title" style="margin-bottom:0px;">
						<div class="left_bg">
							<h1 style="width:400px;">Secure Online Application</h1>
						</div>
					</div>
					
					<br>
					<div style="width:190px;float:right;"><span class="required">*</span>&nbsp;Mandatory fields</div>							

					<div>

						<form name="end" action="Submit.asp" method="post">
				
						<table width="640" border="0" cellpadding="8" cellspacing="0">
						<tr>
							
						</tr>
						</table>
				
						<h2>Mortage Details</h2>
				
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">		
						<tbody>
							<tr>
								<td>Type of Loan:<span class="required">&nbsp;*</span><br>		
									<select name="FMrtType" id="fMrtType">
									<option selected="selected">Choose
									</option><option value="Approval">Approval
									</option><option value="Pre-Approval">Pre-Approval
									</option>
									</select>	
								</td>
								<td>Purpose of Loan:<span class="required">&nbsp;*</span><br>
									<select name="FLoanPurp" id="fLoanPurp">
									<option selected="selected">Choose
									</option><option value="Purchase">Purchase
									</option><option value="Refinance">Refinance
									</option><option value="Switch">Switch
									</option>
									</select>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>Value of Home:<span class="required">&nbsp;*</span><br><input name="FHomeValue" onblur="comaDel(this,8,0,0,3)" size="8" id="fHomeValue"></td>
								<td>Mortgage Amount Required:<span class="required">&nbsp;*</span><br><input name="FMortgageAmountRequested" onblur="comaDel(this,8,0,0,3)" size="15" id="fMortgageAmountRequested"></td>		
								<td>Approx Date Funds Required:<span class="required">&nbsp;*</span><br><input name="FApproxDate" onchange="comaDel(this,8,0,0,3);CloDChk(this,8);" size="10" id="fApproxDate"> (MMDDYYYY)</td>
							</tr>
						</tbody>
						</table>
						
						<h2>Personal Information - Applicant 1</h2>
				
						<h3>Identification</h3>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr align="bottom">
								<td>
									First Name:<span class="required">&nbsp;*</span>
									<br>
									<input name="BFirstName" onchange="comaDel(this,15,1,0,0)" size="15" id="bFirstName">
								</td>
								<td>
									Last Name:<span class="required">&nbsp;*</span>
									<br>
									<input name="BLastName" onchange="comaDel(this,20,1,0,0)" size="20" id="bLastName">
								</td>	
								<td>
									Initial:<br><input name="BGivenName" onchange="comaDel(this,1,1,0,0)" size="2">
								</td>
							</tr>	
							<tr valign="bottom">
								<td>
									Date of Birth:<span class="required">&nbsp;*</span>
									<br>
									<input name="BDOB" onchange="comaDel(this,8,0,0,3);chekDat(this,8);" size="8" id="bDOB"> (MMDDYYYY)
								</td>
								<td>
									SIN#:<span class="required">&nbsp;
									<br>
									<input name="BBorrowerSIN" onblur="getit(this);comaDel(this,9,0,0,4);" size="11">&nbsp;&nbsp;</span>
								</td>
							    <td>
									E-Mail Address:<span class="required">&nbsp;*</span>
									<br><input name="BEmailAddr" onblur="emailCheck(this.value,1)" maxlength="50" size="30" id="bEmailAddr">		
								</td>
							</tr>
						</tbody>
						</table>
				
				
						<h3>Current Living Address</h3>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
						<tr valign="bottom">
							<td>Number:<span class="required">&nbsp;*</span><br><input name="BAddress1" onchange="comaDel(this,5,0,0,3)" size="4" id="bAddress1"></td>
							<td>Street Name:<span class="required">&nbsp;*</span><br><input name="BAddress2" onchange="comaDel(this,25,0,0,0)" size="18" id="bAddress2"></td>
							<td>Street Type:<br>
										<select name="BAddress3" id="bAddress3"> 
												<option selected="selected" value=" ">choose
												</option><option value=" ">None
												</option><option value="Avenue">Avenue
												</option><option value="Boulevard">Boulevard
												</option><option value="Circle">Circle
												</option><option value="Court">Court
												</option><option value="Crescent">Crescent
												</option><option value="Drive">Drive
												</option><option value="Gate">Gate
												</option><option value="Lane">Lane
												</option><option value="Place">Place
												</option><option value="Road">Road
												</option><option value="Street">Street
												</option><option value="Terrace">Terrace
												</option><option value="Trail">Trail
												</option><option value="Way">Way
												</option>
										</select> 
							</td>
							<td>Street Dir.:<br>
										<select name="BAddress4" size="1" id="bAddress4"> 
										<option selected="selected" value=" ">choose
										</option><option value=" ">None
										</option><option value="E">East
										</option><option value="W">West
										</option><option value="N">North
										</option><option value="S">South
										</option><option value="NE">North East
										</option><option value="NW">North West
										</option><option value="SE">South East
										</option><option value="SW">South West
										</option>
										</select>
							</td>
							<td>Unit:
							<br>
							<input name="BCurrentUnitNum" onchange="comaDel(this,4,0,0,0)" size="3" id="bCurrentUnitNum"></td>
						</tr>
						</tbody>
						</table>
					
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">        
						<tbody>
							<tr valign="bottom">
								<td width="80">City/Town:<span class="required">&nbsp;*</span><br>		
									<input name="BCurrentCity" onchange="comaDel(this,15,1,0,0)" size="15" id="bCurrentCity">
								</td>
						        <td width="175">Province:
									<span class="required">&nbsp;*</span><br>	
									<select name="BCurrentProvince" id="bCurrentProvince"> 
									<option selected="selected" value=" ">choose
									</option><option value="AB">Alberta
									</option><option value="BC">British  Columbia
									</option><option value="MB">Manitoba
									</option><option value="NB">New Brunswick
									</option><option value="NF">Newfoundland
									</option><option value="NS">Nova Scotia
									</option><option value="NT">Northwest Territories
									</option><option value="NU">Nunavut
									</option><option value="ON">Ontario
									</option><option value="QC">Quebec
									</option><option value="PE">P.E.I.
									</option><option value="SK">Saskatchewan
									</option><option value="YK">Yukon
									</option>
									</select> 
								</td>
								<td width="100" align="left">
									Postal Code:<span class="required">&nbsp;*</span><br>
									<input name="BCurrentCode" onblur="postDel(this,6,0,2,0);" onchange="/*comaDel(this,6,0,2,0);*/" size="8" id="bCurrentCode">
								</td>
							</tr>
						</tbody>
						</table>
					
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">        
						<tbody>
							<tr valign="bottom">
								<td>
									Home Ph.#:<span class="required">&nbsp;*</span><br>
									<input name="BHomePhone" onchange="comaDel(this,10,0,0,4); checkPhoneNumberLength(this)" size="12" id="bHomePhone"> (incl. area code)
								</td> 
								<td  align="left">
									Time at this address:<span class="required">&nbsp;*</span><br>
									<input name="BCurrentAddrTime" onblur="comaDel(this,4,0,0,3);chekDat(this,4);" size="4" id="bCurrentAddrTime"> (YYMM)
								</td>
							</tr>
						</tbody>
						</table>
					
						<h3>Present Employer</h3>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr valign="bottom">
								<td>Occupation Type:<span class="required">&nbsp;*</span><br>
										<select name="Boccupation" id="bOccupation"> 
										<option selected="selected" value="N/A">choose
										</option><option value="01">Manager
										</option><option value="02">Clerical
										</option><option value="03">Labourer/Tradesperson
										</option><option value="04">Retired
										</option><option value="05">Professional
										</option><option value="06">Self Employed
										</option><option value="99">Other
										</option>
										</select> 
								</td>
							    <td>Name of Employer:<span class="required">&nbsp;*</span>
									<br><input name="BPresEmpName" onchange="comaDel(this,25,0,0,0)" size="25" id="bPresEmpName"> 
								</td>
								<td>Work Ph.#:<br>
									<input name="BBusinessPhone" onchange="comaDel(this,10,0,0,4); checkPhoneNumberLength(this)" size="12"> (incl. area code)
								</td>
							</tr>
							<tr valign="bottom">
							    <td width="200">
									Length of Employment: <span class="required">&nbsp;*</span>
									<br>
									<input name="BLengthService" onblur="comaDel(this,4,0,0,3);chekDat(this,4);" size="4" id="bLengthService"> (YYMM)
								</td>
							    <td width="200">
									Annual&nbsp;Income:<span class="required">&nbsp;*</span>
									<br>
									<input name="BAnnualIncome" onchange="comaDel(this,8,0,0,3)" size="8" id="bAnnualIncome">
								</td>
							    <td>
									Type of Income:<span class="required">&nbsp;*</span>
									<br>
									<select name="BTypeOfIncome" id="bTypeOfIncome"> 
										<option selected="selected" value="N/A">choose
										</option><option value="Salary/Hourly">Salary/Hourly
										</option><option value="Commission">Commission
										</option><option value="Pension">Pension
										</option><option value="Alimony">Alimony
										</option><option value="Other">Other
										</option>
									</select> 
								</td>
							</tr>
						</tbody>
						</table>
				
				
						<!--APPLICANT 2_____________________________//-->
				
						<h2>Personal Information - Applicant 2</h2>
						
						<h3>Identification</h3>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr valign="bottom">
								<td>
									First Name:
									<br>
									<input name="CFirstName" onchange="comaDel(this,15,1,0,0)" size="15" id="cFirstName">
								</td>
								<td>
									Last Name:
									<br>
									<input name="CLastName" onchange="comaDel(this,20,1,0,0)" size="20" id="cLastName">
								</td>
								<td width="40%">
									Initial:<br><input name="CGivenName" onchange="comaDel(this,1,1,0,0)" size="2">
								</td>
							</tr>
							<tr valign="bottom">
								<td>
									Date of Birth:<br>
									<input name="CDOB" onchange="comaDel(this,8,0,0,3);chekDat(this,8);" size="8" id="cDOB">
								</td>
								<td>
									SIN#:
									<br>
									<input name="CoBorrowerSIN" onchange="getit(this);comaDel(this,9,0,0,4);" size="11">&nbsp;&nbsp;
									<input name="CMartialStatus" type="hidden"> 
								</td>
								<td></td>
							</tr>
							<tr>    
								<td>
									E-Mail Address:
									<br>
									<input name="CEmailAddr" onblur="emailCheck(this.value,2)" maxlength="50" size="30" id="cEmailAddr">
								</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
						</table>
				
						<h3>Current Living Address</h3>
			
						<a href="javascript:onClick=copyAddr()">Copy Applicant 1 Address</a>	
						<p>
						
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr valign="bottom">
								<td>
									Number:
									<br>
									<input name="CAddress1" onchange="comaDel(this,5,0,0,3)" size="4" id="cAddress1">
								</td>
								<td>
									Street Name:
									<br>
									<input name="CAddress2" onchange="comaDel(this,25,0,0,0)" size="18" id="cAddress2">
								</td>
							    <td>
									Street Type:<br>
									<select name="CAddress3" id="cAddress3"> 
										<option selected="selected" value=" ">choose
										</option><option value=" ">None
										</option><option value="Avenue">Avenue
										</option><option value="Boulevard">Boulevard
										</option><option value="Circle">Circle
										</option><option value="Court">Court
										</option><option value="Crescent">Crescent
										</option><option value="Drive">Drive
										</option><option value="Gate">Gate
										</option><option value="Lane">Lane
										</option><option value="Place">Place
										</option><option value="Road">Road
										</option><option value="Street">Street
										</option><option value="Terrace">Terrace
										</option><option value="Trail">Trail
										</option><option value="Way">Way
										</option>
									</select>
								</td>
								<td>
									Street Dir.:
									<br>
									<select name="CAddress4" size="1" id="cAddress4"> 
										<option selected="selected" value=" ">choose
										</option><option value=" ">None
										</option><option value="E">East
										</option><option value="W">West
										</option><option value="N">North
										</option><option value="S">South
										</option><option value="NE">North East
										</option><option value="NW">North West
										</option><option value="SE">South East
										</option><option value="SW">South West
										</option>
									</select>
								</td>
								<td>
									Unit:<br>
									<input name="CCurrentUnitNum" onchange="comaDel(this,4,0,0,0)" size="3" id="cCurrentUnitNum">
								</td>
							</tr>
						</tbody>
						</table>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">        
						<tbody>
							<tr valign="bottom">
						        <td width="125">
									City/Town:
									<br>
									<input name="CCurrentCity" onchange="comaDel(this,15,1,0,0)" size="15" id="cCurrentCity">
								</td>
						        <td width="175">
									Province:
									<br>	
									<select name="CCurrentProvince" id="cCurrentProvince"> 
										<option selected="selected" value=" ">choose
										</option><option value="AB">Alberta
										</option><option value="BC">British  Columbia
										</option><option value="MB">Manitoba
										</option><option value="NB">New Brunswick
										</option><option value="NF">Newfoundland
										</option><option value="NS">Nova Scotia
										</option><option value="NT">Northwest Territories
										</option><option value="NU">Nunavut
										</option><option value="ON">Ontario
										</option><option value="QC">Quebec
										</option><option value="PE">P.E.I.
										</option><option value="SK">Saskatchewan
										</option><option value="YK">Yukon
										</option>
									</select> 
								</td>
								<td width="100" align="left">
									Postal Code:
									<input name="CCurrentCode" onblur="postDel(this,6,0,2,0);" onchange="comaDel(this,6,0,2,0);" size="8" id="cCurrentCode">
								</td>
							</tr>
						</tbody>
						</table>
															
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr valign="bottom">
								<td>
									Home Ph.#:
									<br>
									<input name="CHomePhone" onchange="comaDel(this,10,0,0,4); checkPhoneNumberLength(this)" size="12" id="cHomePhone">  (incl. area code)
								</td>		
								<td width="200" align="left">
									Time at this address:
									<br>
									<input name="CCurrentAddrTime" onblur="comaDel(this,4,0,0,3);chekDat(this,4);" size="4" id="cCurrentAddrTime"> (YYMM)
								</td>
							</tr>
						</tbody>
						</table>
				
						<h3>Present Employer (Applicant 2)</h3>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							 <tr valign="bottom">
							    <td>
									Occupation Type:
									<br>
									<select name="Coccupation" id="cOccupation"> 
									<option selected="selected" value="N/A">choose
									</option><option value="01">Manager
									</option><option value="02">Clerical
									</option><option value="03">Labourer/Tradesperson
									</option><option value="04">Retired
									</option><option value="05">Professional
									</option><option value="06">Self Employed
									</option><option value="99">Other
									</option>
									</select> 
								</td>
							    <td colspan="1">
									Name of Employer:
									<br>
									<input name="CPresEmpName" onchange="comaDel(this,25,0,0,0)" size="25" id="cPresEmpName"> 				
								</td>
								<td colspan="2">
									Work Ph.#:
									<br>
									<input name="CBusinessPhone" onchange="comaDel(this,10,0,0,4); checkPhoneNumberLength(this)" size="12"> (incl. area code)
								</td>
							</tr>
							<tr valign="bottom">
							    <td>
									Length of Employment:
									<br>
									<input name="CLengthService" onblur="comaDel(this,4,0,0,3);chekDat(this,4);" size="4" id="cLengthService"> (YYMM)
								</td>
							    <td valign="bottom">
									Annual Income:
									<br>
									<input name="CAnnualIncome" onchange="comaDel(this,7,0,0,3)" size="7" id="cAnnualIncome">
								</td>
							    <td>
									Type of Income:
									<br>
									<select name="CTypeOfIncome" id="cTypeOfIncome">
										<option selected="selected" value="N/A">choose
										</option><option value="Salary/Hourly">Salary/Hourly
										</option><option value="Commission">Commission
										</option><option value="Pension">Pension
										</option><option value="Alimony">Alimony
										</option><option value="Other">Other
										</option>
									</select>
								</td>
							</tr>
						</tbody>
						</table>
				
						<!-- FINANCIAL -->
				
						<h2>Financial Information</h2>
				
						<h3>Assets</h3>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr>
								<td bgcolor="#D3CEAF"><b>Type</b></td>
								<td bgcolor="#D3CEAF"><b>Where/Financial<br>Institution(s)</b></td>
								<td bgcolor="#D3CEAF"><b>Amount/Value</b></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Cash savings</td>
								<td bgcolor="#FFFFFF"><input name="ACIB" onchange="comaDel(this,15,0,0,0)"></td>
								<td bgcolor="#FFFFFF">$<input name="ACIBValue" onblur="comaDel(this,8,0,0,3);networths(this);" size="8" id="acibValue"></td>
							</tr>
							<tr>
								<td bgcolor="#F1F2E3">Automobile: present value</td>
								<td bgcolor="#F1F2E3"><input name="AAutomobile" onchange="comaDel(this,25,0,0,0)"></td>
								<td bgcolor="#F1F2E3">$<input name="AAutoValue" onblur="comaDel(this,8,0,0,3);networths(this);" size="8" id="autoValue"></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Value of present home (if owned)</td>
								<td bgcolor="#FFFFFF">&nbsp;</td>
								<td bgcolor="#FFFFFF">$<input name="AHomeValue" onblur="comaDel(this,8,0,0,3);networths(this);" size="8" id="homeValue"></td>
							</tr>
							<tr>                     
								<td bgcolor="#F1F2E3">Other</td>
								<td bgcolor="#F1F2E3"><input name="AOther" onchange="comaDel(this,25,1,0,0)"></td>
								<td bgcolor="#F1F2E3">$<input name="AOtherValue" onblur="comaDel(this,8,0,0,3);networths(this);" size="8" id="otherValue"></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF"><b>Total</b></td>
								<td bgcolor="#FFFFFF"><br></td>
								<td bgcolor="#FFFFFF">$<input name="ATotalValue" onchange="comaDel(this,10,0,0,3);networthx();" size="8" id="aTotalValue"></td>
							</tr>
						</tbody>
						</table>
					
						<h3>Liabilities</h3>
				
						<table width="640" bgcolor="#ffffff" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr>
								<td width="150" bgcolor="#D3CEAF"><b>Type</b></td>
								<td width="150" bgcolor="#D3CEAF"><b>Where/Financial<br>Institution(s)</b></td>
								<td width="125" bgcolor="#D3CEAF"><b>Balance Owing</b></td>
								<td width="129" bgcolor="#D3CEAF"><b>Monthly Payment</b></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Debts / Loans</td>
								<td bgcolor="#FFFFFF"><input name="LBankLoans" onchange="comaDel(this,15,1,0,0)" size="20" id="loanWhere"></td>
								<td bgcolor="#FFFFFF">$<input name="LLoanBalance" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="loanBalance"></td>
								<td bgcolor="#FFFFFF">$<input name="LLoanPayment" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="loanPayment"></td>
							</tr>
							<tr>
								<td bgcolor="#F1F2E3">Credit Cards</td>
								<td bgcolor="#F1F2E3"><input name="LCreditCards" onchange="comaDel(this,15,1,0,0);" size="20" id="cardWhere"></td>
								<td bgcolor="#F1F2E3">$<input name="LCardBalance" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="cardBalance"></td>
								<td bgcolor="#F1F2E3">$<input name="LCardPayment" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="cardPayment"></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Amount owing on current mortgage(s)</td>
								<td bgcolor="#FFFFFF"><input name="LMortgage" onchange="comaDel(this,30,1,0,0)" size="20" id="mortgageWhere"></td>
								<td bgcolor="#FFFFFF">$<input name="LMortgageBalance" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="mortgageBalance"></td>
								<td bgcolor="#FFFFFF">$<input name="LMortgagePayment" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="mortgagePayment"></td>
							</tr>
							<tr>
								<td bgcolor="#F1F2E3">Finance company loans and other debts <br></td>
								<td bgcolor="#F1F2E3"><input name="LFinanceCompany" onchange="comaDel(this,25,1,0,0)" size="20" id="financeWhere"></td>
								<td bgcolor="#F1F2E3">$<input name="LFinanceBalance" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="financeBalance"></td>
								<td bgcolor="#F1F2E3">$<input name="LFinancePayment" onblur="comaDel(this,8,0,0,3);networths(this)" size="8" id="financePayment"></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">Total</td>
								<td bgcolor="#FFFFFF"><br></td>
								<td bgcolor="#FFFFFF">$<input name="LTotal" onchange="comaDel(this,10,0,0,3);networthx()" size="8" id="lTotal"></td>
								<td bgcolor="#FFFFFF">$<input name="LTotalPayment" onchange="comaDel(this,10,0,0,3);networthx();" size="8" id="lTotalPayment"></td>
							</tr>
						</tbody>
						</table>
							
						<table width="640" align="center" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr>
								<td class="app_tablemainhdr" align="left">Net Worth (Total Assets - Total Liabilities) = $<input name="LNetWorth" onchange="comaDel(this,10,0,0,3);networthx();" size="10" id="lNetWorth"></td>
							</tr>
						</tbody>
						</table>
				
						<h2>Other Information</h2>
				
						Additional Note for Financial Information: (Max. 500 Characters)
						<br>
						<textarea style="width:640px;height:100px;" name="LNoteScreen" cols="72" rows="5" maxlength="500" onchange="comaDel(this,500,0,0,0)" id="lNoteScreen"></textarea>
				
						<table width="640" border="0" cellpadding="8" cellspacing="0">
						<tbody>
							<tr>
								<td style="padding:0px;">
									I/we warrant and confirm that the information given in the mortgage
									application form is true and correct and I/we understand that it is
									being used to determine my/our credit responsibility. You are
									authorized to obtain any information you may require for these purposes
									from other sources (including, for example, credit bureau) and each
									such source is hereby authorized to provide you with such information.
									I/we also understand that the information given in the mortgage
									application form as well as other information you obtain in relation to
									my credit history may be disclosed to potential mortgage lenders,
									financial intermediary and mortgage insurers, organizations providing
									technological or other support services required in relation to this
									application and any other parties with whom I/we propose to have a
									financial relationship.
									<br>
									<br>
									<b>Online Applications</b>
									<p> 
									<b>Please read the paragraph above prior to sending completed
									application. By transmitting the online mortgage application you are
									accepting the terms of the paragraph noted above.</b>
								</td>
							</tr>
						</tbody>
						</table>
						
						<p>
						<!--
						<a href="javascript:saveCooks()" onmouseover="self.status='Save Your Data';return true;"><img alt="Save Your Data" src="CbasexMtgApp2.asp_files/MB_buttonstore.gif" border="0"></a>
						<a href="javascript:ControlSub();" onmouseover="parent.status='Send Application';return true;"><img alt="Send Application" src="CbasexMtgApp2.asp_files/send_application.gif" border="0"></a>
						<a href="javascript:reloadCooks()" onmouseover="self.status='Reload Data';return true;"><img alt="Reload Data" src="CbasexMtgApp2.asp_files/reload_data.gif" border="0"></a>
						-->

						<a href="javascript:ControlSub();" onmouseover="parent.status='Send Application';return true;">Submit Application</a>

				
						<input name="FAgentNameSpare" type="hidden">
						<input name="FOfficeNameSpare" type="hidden">
						<input name="DContactEmail" type="hidden">
						<input name="BFaxNumber" type="hidden">
						<input name="BBusinessFax" type="hidden"> 
						<input name="BCellPhone" type="hidden"> 
						<input name="BPagerNumber" type="hidden">
						<input name="BMartialStatus" type="hidden">   
						<input name="BMOC" type="hidden">  
						<input name="BResidentStatus" type="hidden">
						<input name="BDependents" type="hidden">
						<input name="BLandlord" type="hidden">
						<input name="BAccommodation" type="hidden">
						<input name="Bsalutation" type="hidden">
						<input name="BLandlordNum" type="hidden"> 
						<input name="BPreviousAddr1" type="hidden"> 
						<input name="BPreviousAddr2" type="hidden"> 
						<input name="BPreviousAddr3" type="hidden"> 
						<input name="BPreviousAddr4" type="hidden"> 
						<input name="BPreviousUnitNum" type="hidden"> 
						<input name="BPreviousCity" type="hidden">
						<input name="BPreviousProvince" type="hidden"> 
						<input name="BPreviousCode" type="hidden"> 
						<input name="BEmploymentStatus" type="hidden"> 
						<input name="BIndustrySector" type="hidden">
						<input name="BPresContactName" type="hidden">
						<input name="BPresContactPhone" type="hidden">
						<input name="BPresFaxNumber" type="hidden"></tr>
						<input name="BEmpAddress1" type="hidden">
						<input name="BEmpAddress2" type="hidden">
						<input name="BEmpAddress3" type="hidden">
						<input name="BEmpAddress4" type="hidden">
						<input name="BEmpUnitNum" type="hidden">
						<input name="BEmpCity" type="hidden">
						<input name="BEmpProvince" type="hidden">
						<input name="BEmpCode" type="hidden">
						<input name="BTypeOfBus" type="hidden"> 
						<input name="BPresPosition" type="hidden">
						<input name="BYrsInLineOfBus" type="hidden">
						<input name="BOtherIncomeSource" type="hidden">
						<input name="BOtherIncome" type="hidden">
						<input name="BPrevEmpName" type="hidden">
						<input name="BPrevEmpAddress1" type="hidden">
						<input name="BPrevEmpCity" type="hidden">
						<input name="BPrevEmpProvince" type="hidden"> 
						<input name="BPrevOccupation" type="hidden"> 
						<input name="BPrevLengthService" type="hidden">
						<input name="BPrevAnnualIncome" type="hidden">
						<input name="BPrevEmpAddress2" type="hidden"> 
						<input name="BPrevEmpAddress3" type="hidden"> 
						<input name="BPrevEmpAddress4" type="hidden"> 
						<input name="BPrevEmpUnitNum" type="hidden"> 
						<input name="BPrevEmpCode" type="hidden"> 
						<input name="BIncomeType1" type="hidden"> 
						<input name="BIncomeAmount1" type="hidden"> 
						<input name="BIncomeType2" type="hidden"> 
						<input name="BIncomeAmount2" type="hidden"> 
						<input name="BIncomeType3" type="hidden"> 
						<input name="BIncomeAmount3" type="hidden"> 
						<input name="BIncomeType4" type="hidden"> 
						<input name="BIncomeAmount4" type="hidden"> 
						<input name="BNoteScreen" type="hidden">
						<input name="Csalutation" type="hidden">
						<input name="CBusinessFax" type="hidden"> 
						<input name="CCellPhone" type="hidden"> 
						<input name="CPagerNumber" type="hidden">
						<input name="CMOC" type="hidden"> 
						<input name="CResidentStatus" type="hidden">
						<input name="CDependents" type="hidden"> 
						<input name="CAccommodation" type="hidden">
						<input name="CLandlord" type="hidden">
						<input name="CLandlordNum" type="hidden"> 
						<input name="CPreviousAddr1" type="hidden"> 
						<input name="CPreviousAddr2" type="hidden"> 
						<input name="CPreviousAddr3" type="hidden"> 
						<input name="CPreviousAddr4" type="hidden"> 
						<input name="CPreviousUnitNum" type="hidden"> 
						<input name="CPreviousCity" type="hidden"> 
						<input name="CPreviousProvince" type="hidden"> 
						<input name="CPreviousCode" type="hidden"> 
						<input name="CIndustrySector" type="hidden">
						<input name="CPresContactPhone" type="hidden"> 
						<input name="CPresFaxNumber" type="hidden">
						<input name="CPresContactName" type="hidden">
						<input name="CCurrentEmployStatus" type="hidden"> 
						
						<input name="CEmpAddress1" type="hidden">
						<input name="CEmpAddress2" type="hidden">
						<input name="CEmpAddress3" type="hidden">
						<input name="CEmpAddress4" type="hidden">
						<input name="CEmpUnitNum" type="hidden">
						<input name="CEmpCity" type="hidden">
						<input name="CEmpProvince" type="hidden">
						<input name="CEmpCode" type="hidden">
						<input name="CTypeOfBus" type="hidden"> 
						<input name="CPresPosition" type="hidden">
						<input name="COtherIncomeSource" type="hidden">
						<input name="COtherIncome" type="hidden">
						<input name="CPrevEmpName" type="hidden"> 
						<input name="CPrevEmpAddress1" type="hidden"> 
						<input name="CPrevEmpCity" type="hidden"> 
						<input name="CPrevEmpProvince" type="hidden"> 
						<input name="CPrevOccupation" type="hidden"> 
						<input name="CPrevLengthService" type="hidden"> 
						<input name="CPrevAnnualIncome" type="hidden"> 
						<input name="CPrevEmpAddress2" type="hidden"> 
						<input name="CPrevEmpAddress3" type="hidden"> 
						<input name="CPrevEmpAddress4" type="hidden"> 
						<input name="CPrevEmpUnitNum" type="hidden"> 
						<input name="CPrevEmpCode" type="hidden"> 
						<input name="CIncomeType1" type="hidden"> 
						<input name="CIncomeAmount1" type="hidden"> 
						<input name="CIncomeType2" type="hidden"> 
						<input name="CBIncomeAmount2" type="hidden"> 
						<input name="CIncomeType3" type="hidden"> 
						<input name="CIncomeAmount3" type="hidden"> 
						<input name="CIncomeType4" type="hidden"> 
						<input name="CIncomeAmount4" type="hidden"> 
						<input name="CNoteScreen" type="hidden">
						<input name="Zsalutation" type="hidden"> 
						<input name="ZFirstName" type="hidden"> 
						<input name="ZLastName" type="hidden"> 
						<input name="ZGivenName" type="hidden"> 
						<input name="ZDOB" type="hidden"> 
						<input name="ZoBorrowerSIN" type="hidden"> 
						<input name="ZMartialStatus" type="hidden"> 
						<input name="ZHomePhone" type="hidden"> 
						<input name="ZFaxNumber" type="hidden"> 
						<input name="ZBusinessPhone" type="hidden"> 
						<input name="ZBusinessFax" type="hidden"> 
						<input name="ZCellPhone" type="hidden"> 
						<input name="ZPagerNumber" type="hidden"> 
						<input name="ZEmailAddr" type="hidden"> 
						<input name="ZMOC" type="hidden"> 
						<input name="ZResidentStatus" type="hidden"> 
						<input name="ZDependents" type="hidden"> 
						<input name="ZAddress1" type="hidden"> 
						<input name="ZAddress2" type="hidden"> 
						<input name="ZAddress3" type="hidden"> 
						<input name="ZAddress4" type="hidden"> 
						<input name="ZCurrentUnitNum" type="hidden"> 
						<input name="ZCurrentCity" type="hidden"> 
						<input name="ZCurrentProvince" type="hidden"> 
						<input name="ZCurrentCode" type="hidden"> 
						<input name="ZCurrentAddrTime" type="hidden"> 
						<input name="ZAccommodation" type="hidden"> 
						<input name="ZLandlord" type="hidden"> 
						<input name="ZLandlordNum" type="hidden"> 
						<input name="ZPreviousAddr1" type="hidden"> 
						<input name="ZPreviousAddr2" type="hidden"> 
						<input name="ZPreviousAddr3" type="hidden"> 
						<input name="ZPreviousAddr4" type="hidden"> 
						<input name="ZPreviousUnitNum" type="hidden"> 
						<input name="ZPreviousCity" type="hidden"> 
						<input name="ZPreviousProvince" type="hidden"> 
						<input name="ZPreviousCode" type="hidden"> 
						<input name="Zoccupation" type="hidden"> 
						<input name="ZPresEmpName" type="hidden"> 
						<input name="ZPresContactName" type="hidden"> 
						<input name="ZPresContactPhone" type="hidden"> 
						<input name="ZPresFaxNumber" type="hidden"> 
						<input name="ZEmpAddress1" type="hidden"> 
						<input name="ZEmpAddress2" type="hidden"> 
						<input name="ZEmpAddress3" type="hidden"> 
						<input name="ZEmpAddress4" type="hidden"> 
						<input name="ZEmpUnitNum" type="hidden"> 
						<input name="ZEmpCity" type="hidden"> 
						<input name="ZEmpProvince" type="hidden"> 
						<input name="ZEmpCode" type="hidden"> 
						<input name="ZTypeOfBus" type="hidden"> 
						<input name="ZPresPosition" type="hidden"> 
						<input name="ZLengthService" type="hidden"> 
						<input name="ZAnnualIncome" type="hidden"> 
						<input name="ZTypeOfIncome" type="hidden"> 
						<input name="ZPrevEmpName" type="hidden"> 
						<input name="ZPrevEmpAddress1" type="hidden"> 
						<input name="ZPrevEmpAddress2" type="hidden"> 
						<input name="ZPrevEmpAddress3" type="hidden"> 
						<input name="ZPrevEmpAddress4" type="hidden"> 
						<input name="ZPrevEmpUnitNum" type="hidden"> 
						<input name="ZPrevEmpCity" type="hidden"> 
						<input name="ZPrevEmpProvince" type="hidden"> 
						<input name="ZPrevEmpCode" type="hidden"> 
						<input name="ZPrevLengthService" type="hidden"> 
						<input name="ZPrevAnnualIncome" type="hidden"> 
						<input name="ZIncomeType1" type="hidden"> 
						<input name="ZIncomeAmount1" type="hidden"> 
						<input name="ZIncomeType2" type="hidden"> 
						<input name="ZIncomeAmount2" type="hidden"> 
						<input name="ZIncomeType3" type="hidden"> 
						<input name="ZIncomeAmount3" type="hidden"> 
						<input name="ZIncomeType4" type="hidden"> 
						<input name="ZIncomeAmount4" type="hidden"> 
						<input name="ZNoteScreen" type="hidden"> 
						
						<!--SOLICITOR______(HIDDEN)_________________________//-->
						<input name="SolicitorName" type="hidden"> 
						<input name="SFirmName" type="hidden"> 
						<input name="SAddress1" type="hidden"> 
						<input name="SAddress2" type="hidden"> 
						<input name="SAddress3" type="hidden"> 
						<input name="SAddress4" type="hidden"> 
						<input name="SUnitNum" type="hidden"> 
						<input name="SCity" type="hidden"> 
						<input name="SProvince" type="hidden"> 
						<input name="SPostalCode" type="hidden"> 
						<input name="SPhoneNumber" type="hidden"> 
						<input name="SFaxNumber" type="hidden"> 
						
						<!--PROPERTY________________________________//-->
						<input name="PAddress1" type="hidden">
						<input name="PAddress2" type="hidden">
						<input name="PAddress3" type="hidden">
						<input name="PAddress4" type="hidden">
						<input name="PUnitNum" type="hidden">
						<input name="PCity" type="hidden">
						<input name="PProvince" type="hidden">
						<input name="PPostalCode" type="hidden">
						<input name="AgeBuilding" type="hidden">
						<input name="FPROPTYPE" type="hidden">
						<input name="FLIVABLEAREA" type="hidden">
						<input name="FLIVABLEAREAUNIT" type="hidden">
						<input name="PDwellStyle" type="hidden">
						<input name="LotWidth" type="hidden">
						<input name="LotDepth" type="hidden">
						<input name="LotUnit" type="hidden">
						<input name="GarageType" type="hidden">
						<input name="GarageSize" type="hidden">
						<input name="sAnnuTax" type="hidden">
						<input name="EstMonthHeating" type="hidden">
						<input name="MonthlyFee" type="hidden">
						<input name="sOccby" type="hidden">
						<input name="PropValueSource" type="hidden">
						<input name="DatePurchased" type="hidden">
						<input name="DownPayment" type="hidden">
						<input name="LLotNumber" type="hidden"> 
						<input name="LPlanNumber" type="hidden"> 
						<input name="LConcessionNumber" type="hidden"> 
						<input name="LTownship" type="hidden">
						<input name="NumBedrooms" type="hidden">
						<input name="NumUnits" type="hidden">
						<input name="PTenure" type="hidden">
						<input name="DEnvironmentHazard" type="hidden">
						<input name="DHomeImprovement" type="hidden">
						<input name="PLegalDesc1" type="hidden">
						<input name="PLegalDesc2" type="hidden">
						<input name="LotSize" type="hidden">
						<input name="LotSizeUnit" type="hidden">
						<input name="BuilderName" type="hidden">
						<input name="Construction" type="hidden">
						
						<input name="ADeposit" type="hidden">
						<input name="AProperties" type="hidden">
						<input name="APropertiesValue" type="hidden">
						<input name="AInvestments" type="hidden">
						<input name="AInvestmentsValue" type="hidden">
						<input name="ARRSP" type="hidden">
						<input name="ARRSPValue" type="hidden">
						
						<input name="LAutoLoan" type="hidden">
						<input name="LAutoBalance" type="hidden">
						<input name="LAutoPayment" type="hidden">
						<input name="LMortgage2" type="hidden">
						<input name="LMortgageBalance2" type="hidden">
						<input name="LMortgagePayment2" type="hidden">
						<input name="LMortgageNum" type="hidden">
						<input name="LChildSupport" type="hidden">
						<input name="" type="hidden">
				
						<input name="FAgentName" type="hidden">
						<input name="FOfficeName" type="hidden">
						<input name="FAirMiles" type="hidden">
				
						<input name="INGMtgLifeIns" type="hidden">   
						<input name="DFirstTimeBuyer" type="hidden"> 
						<input name="DCustomerSince" type="hidden"> 
						<input name="DOriginalDate" type="hidden"> 
						<input name="DOriginalAmount" type="hidden"> 
						<input name="DBranchAddress1" type="hidden"> 
						<input name="DBranchAddress2" type="hidden"> 
						<input name="DBranchAddress3" type="hidden"> 
						<input name="DBranchAddress4" type="hidden"> 
						<input name="DUnitNum" type="hidden"> 
						<input name="DCity" type="hidden"> 
						<input name="DProvince" type="hidden"> 
						<input name="DPostalCode" type="hidden"> 
				
						<!--HIDDEN FIELDS___________________________//-->
						<input name="DResult" type="hidden"> 
						<input name="DNetLoan" type="hidden"> 
						<input name="DMortgageInsFee" type="hidden"> 
						<input name="DTotalLoan" type="hidden"> 
						<input name="DLoanPurpose" type="hidden"> 
						<input name="DInterestRate" type="hidden"> 
						<input name="DTerm" type="hidden"> 
						<input name="DAmortization" type="hidden"> 
						<input name="DLoanValueRatio" type="hidden"> 
						<input name="DGDS" type="hidden"> 
						<input name="DTDS" type="hidden"> 
						<input name="DPayment" type="hidden"> 
						<input name="DPaymentChoice" type="hidden"> 
						<input name="BLenderCode" value="INA01" type="hidden"> 
						<input name="AreaBuildingUnit" type="hidden"> 
						<input name="Occupancy" type="hidden"> 
						<input name="BuildingType" type="hidden"> 
						<input name="SewageWater" type="hidden"> 
						<input name="AnnualTax" type="hidden"> 
						<input name="AnnualHeat" type="hidden"> 
						<input name="PropValue" type="hidden"> 
						<input name="EstimatedValue" type="hidden"> 
						<input name="AreaBuilding" type="hidden"> 
						<input name="DTypeMortgage" type="hidden"> 
						<input name="DCurrentBalance" type="hidden"> 
				
						</form>

					</div>
					
				</div>
			</div>
		</div>
	</div>
			
	<!--#include file="./include/footer.inc"-->


</body>
</html>