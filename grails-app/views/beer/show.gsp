
<%@ page import="beer366.Beer" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'beer.label', default: 'Beer')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-beer" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beer.abv.label" default="Abv" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: beerInstance, field: "abv")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beer.baRating.label" default="Ba Rating" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: beerInstance, field: "baRating")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beer.baPage.label" default="Ba Page" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: beerInstance, field: "baPage")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beer.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: beerInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beer.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${beerInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beer.brewery.label" default="Brewery" /></td>
				
				<td valign="top" class="value"><g:link controller="brewery" action="show" id="${beerInstance?.brewery?.id}">${beerInstance?.brewery?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beer.subStyle.label" default="Sub Style" /></td>
				
				<td valign="top" class="value"><g:link controller="beerSubStyle" action="show" id="${beerInstance?.subStyle?.id}">${beerInstance?.subStyle?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
