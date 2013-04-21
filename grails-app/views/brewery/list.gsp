
<%@ page import="beer366.Brewery" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'brewery.label', default: 'Brewery')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-brewery" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="street" title="${message(code: 'brewery.street.label', default: 'Street')}" />
			
				<g:sortableColumn property="postalCode" title="${message(code: 'brewery.postalCode.label', default: 'Postal Code')}" />
			
				<th><g:message code="brewery.region.label" default="Region" /></th>
			
				<g:sortableColumn property="homepage" title="${message(code: 'brewery.homepage.label', default: 'Homepage')}" />
			
				<g:sortableColumn property="notes" title="${message(code: 'brewery.notes.label', default: 'Notes')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'brewery.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${breweryInstanceList}" status="i" var="breweryInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${breweryInstance.id}">${fieldValue(bean: breweryInstance, field: "street")}</g:link></td>
			
				<td>${fieldValue(bean: breweryInstance, field: "postalCode")}</td>
			
				<td>${fieldValue(bean: breweryInstance, field: "region")}</td>
			
				<td>${fieldValue(bean: breweryInstance, field: "homepage")}</td>
			
				<td>${fieldValue(bean: breweryInstance, field: "notes")}</td>
			
				<td>${fieldValue(bean: breweryInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${breweryInstanceTotal}" />
	</div>
</section>

</body>

</html>
