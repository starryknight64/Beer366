
<%@ page import="beer366.BreweryType" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'breweryType.label', default: 'BreweryType')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-breweryType" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="description" title="${message(code: 'breweryType.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'breweryType.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${breweryTypeInstanceList}" status="i" var="breweryTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${breweryTypeInstance.id}">${fieldValue(bean: breweryTypeInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: breweryTypeInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${breweryTypeInstanceTotal}" />
	</div>
</section>

</body>

</html>
