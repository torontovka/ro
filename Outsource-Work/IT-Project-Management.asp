<%
option explicit

dim active_page
active_page = replace( request.serverVariables( "PATH_INFO" ), ".asp", "" )

dim keywords, description, title
title = null
keywords = "Create Website, Promote Website, Print Design, Web Hosting, Outsource Developement, Outsource Telemarketing, Outsource Support, Outsource IT, Project Management"
description = "Roosoft Consulting is a Canadian company working in the IT and Internet industry for over 10 years helping businesses all over the World with their IT and Internet marketing needs."
%>

<!--#include virtual="/include/header.inc.asp"-->

<!--#include virtual="/include/page-top.inc.asp"-->

	<h1><%= title %></h1>
	
	<p>
	Outsourcing project management is now becoming an option for many companies. When ineffective project management practices fail projects and impair business performance, the company must look for outsourcing solutions. Taking this business process out of the company and giving to an outsource project management service provider like Roosoft enables the organization to manage projects in an efficient in-budget manner, concentrating on vision and marketing.
	<p>
	Our outsourced project managers look at planning, controlling, scheduling and tracking your project with fresh eyes. We will make sure that best practices are followed and work closely with you for the overall successful outcome of the project.
	<p>
	We can enhance your in-house project management competency with our proficiency and experience.
	<p>
	We help companies with projects that lie within their core competencies, to outsourcing only more technical aspects to project management such as planning and controlling.
	<p>
	We use documentation and benchmarking to help leverage outsourcing efforts.


<!--#include virtual="/include/page-bottom.inc.asp"-->

<!--#include virtual="/include/contact.inc.asp"-->

<!--#include virtual="/include/footer.inc.asp"-->