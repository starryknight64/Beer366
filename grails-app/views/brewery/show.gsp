
<%@ page import="beer366.Brewery" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'brewery.label', default: 'Brewery')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-brewery" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.street.label" default="Street" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryInstance, field: "street")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.postalCode.label" default="Postal Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryInstance, field: "postalCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.region.label" default="Region" /></td>
				
				<td valign="top" class="value"><g:link controller="ISO_3166_2" action="show" id="${breweryInstance?.region?.id}">${breweryInstance?.region?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.homepage.label" default="Homepage" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryInstance, field: "homepage")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.fullName.label" default="Full Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryInstance, field: "fullName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${breweryInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.city.label" default="City" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryInstance, field: "city")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="ISO_3166_1" action="show" id="${breweryInstance?.country?.id}">${breweryInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="brewery.type.label" default="Type" /></td>
				
				<td valign="top" class="value"><g:link controller="breweryType" action="show" id="${breweryInstance?.type?.id}">${breweryInstance?.type?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
