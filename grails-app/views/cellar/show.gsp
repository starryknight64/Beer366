
<%@ page import="beer366.Cellar" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cellar.label', default: 'Cellar')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-cellar" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cellar.quantity.label" default="Quantity" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cellarInstance, field: "quantity")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cellar.willTrade.label" default="Will Trade" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cellarInstance, field: "willTrade")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cellar.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cellarInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cellar.beer.label" default="Beer" /></td>
				
				<td valign="top" class="value"><g:link controller="beer" action="show" id="${cellarInstance?.beer?.id}">${cellarInstance?.beer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cellar.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${cellarInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cellar.size.label" default="Size" /></td>
				
				<td valign="top" class="value"><g:link controller="servingSize" action="show" id="${cellarInstance?.size?.id}">${cellarInstance?.size?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cellar.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${cellarInstance?.user?.id}">${cellarInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
