
<%@ page import="beer366.SubContinent" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subContinent.label', default: 'SubContinent')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-subContinent" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subContinent.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subContinentInstance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subContinent.continent.label" default="Continent" /></td>
				
				<td valign="top" class="value"><g:link controller="continent" action="show" id="${subContinentInstance?.continent?.id}">${subContinentInstance?.continent?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subContinent.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subContinentInstance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
