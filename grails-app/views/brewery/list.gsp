
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
  <g:if test="${!params.city && !params.state && !params.country}">
    <ul class="nav nav-tabs">
      <b:renderBreweryABC id="${params.id}" />
    </ul>
  </g:if>
  <g:else>
    <div class="page-header">
      <h1>Breweries in ${params.city ?: params.state ?: params.country} (${breweryInstanceList.size()})</h1>
    </div>
  </g:else>
  <section id="list-brewery" class="first">

    <table class="table table-bordered">
      <thead>
        <tr>

      <g:sortableColumn property="name" params="${params}" title="${message(code: 'brewery.list.name.label', default: 'Name')}" />

      <g:sortableColumn property="type" params="${params}" title="${message(code: 'brewery.list.type.label', default: 'Brewery Type')}" />

      <g:sortableColumn property="homepage" params="${params}" title="${message(code: 'brewery.list.homepage.label', default: 'Homepage')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${breweryInstanceList}" status="i" var="breweryInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${breweryInstance.id}">${breweryInstance.name}</g:link></td>

        <td>${breweryInstance.type}</td>

        <td><g:link url="${breweryInstance.homepage}" target="_blank">${breweryInstance.homepage}</g:link></td>

        <td></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </section>

</body>

</html>
