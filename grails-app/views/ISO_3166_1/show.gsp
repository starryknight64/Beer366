
<%@ page import="beer366.ISO_3166_1" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ISO_3166_1.label', default: 'ISO_3166_1')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ISO_3166_1" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_1.alpha2.label" default="Alpha2" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ISO_3166_1Instance, field: "alpha2")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_1.alpha3.label" default="Alpha3" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ISO_3166_1Instance, field: "alpha3")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_1.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ISO_3166_1Instance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_1.subContinent.label" default="Sub Continent" /></td>
				
				<td valign="top" class="value"><g:link controller="subContinent" action="show" id="${ISO_3166_1Instance?.subContinent?.id}">${ISO_3166_1Instance?.subContinent?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_1.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ISO_3166_1Instance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
