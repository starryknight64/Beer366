
<%@ page import="beer366.BeerStyle" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'beerStyle.label', default: 'BeerStyle')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-beerStyle" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'beerStyle.name.label', default: 'Name')}" />
			
				<th><g:message code="beerStyle.family.label" default="Family" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${beerStyleInstanceList}" status="i" var="beerStyleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${beerStyleInstance.id}">${fieldValue(bean: beerStyleInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: beerStyleInstance, field: "family")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${beerStyleInstanceTotal}" />
	</div>
</section>

</body>

</html>
