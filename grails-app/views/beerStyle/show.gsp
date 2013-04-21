
<%@ page import="beer366.BeerStyle" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'beerStyle.label', default: 'BeerStyle')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-beerStyle" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beerStyle.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: beerStyleInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beerStyle.family.label" default="Family" /></td>
				
				<td valign="top" class="value"><g:link controller="beerFamily" action="show" id="${beerStyleInstance?.family?.id}">${beerStyleInstance?.family?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
