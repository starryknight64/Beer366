
<%@ page import="beer366.Beer" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'beer.label', default: 'Beer')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-beer" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="abv" title="${message(code: 'beer.abv.label', default: 'Abv')}" />
			
				<g:sortableColumn property="baRating" title="${message(code: 'beer.baRating.label', default: 'Ba Rating')}" />
			
				<g:sortableColumn property="baPage" title="${message(code: 'beer.baPage.label', default: 'Ba Page')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'beer.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'beer.lastUpdated.label', default: 'Last Updated')}" />
			
				<th><g:message code="beer.brewery.label" default="Brewery" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${beerInstanceList}" status="i" var="beerInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${beerInstance.id}">${fieldValue(bean: beerInstance, field: "abv")}</g:link></td>
			
				<td>${fieldValue(bean: beerInstance, field: "baRating")}</td>
			
				<td>${fieldValue(bean: beerInstance, field: "baPage")}</td>
			
				<td>${fieldValue(bean: beerInstance, field: "name")}</td>
			
				<td><g:formatDate date="${beerInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: beerInstance, field: "brewery")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${beerInstanceTotal}" />
	</div>
</section>

</body>

</html>
