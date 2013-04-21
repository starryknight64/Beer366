
<%@ page import="beer366.BeerSubStyle" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'beerSubStyle.label', default: 'BeerSubStyle')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-beerSubStyle" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beerSubStyle.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: beerSubStyleInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="beerSubStyle.style.label" default="Style" /></td>
				
				<td valign="top" class="value"><g:link controller="beerStyle" action="show" id="${beerSubStyleInstance?.style?.id}">${beerSubStyleInstance?.style?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
