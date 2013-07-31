
<%@ page import="beer366.Beer" %>
<%@ page import="beer366.Cellar" %>
<%@ page import="beer366.DrinkLog" %>
<%@ page import="beer366.User" %>
<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'cellar.label', default: 'Cellar')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

  <section id="list-cellar" class="first">

    <table class="table table-bordered table-hover sortable">
      <thead>
        <tr>
          <th class="nowrap"><g:message code="beer.brewery.label" default="Brewery" /></th>

      <th class="nowrap"><g:message code="cellar.beer.label" default="Beer" /></th>

      <th class="nowrap"><g:message code="beer.subStyle.label" default="Style" /></th>

      <th class="nowrap"><g:message code="cellar.size.label" default="Size" /></th>

      <th class="nowrap"><g:message code="beer.baRating.label" default="BA Rating" /></th>

      <th class="nowrap"><g:message code="cellar.quantity.label" default="Quantity" /></th>

      <th class="nowrap"><g:message code="cellar.willTrade.label" default="Will Trade" /></th>

      <th class="nowrap"><g:message code="cellar.notes.label" default="Notes" /></th>

      <th class="nowrap">I've Had</th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${cellarInstanceList}" status="i" var="cellarInstance">
        <tr>

          <td><g:link controller="brewery" action="show" id="${cellarInstance.beer.brewery.id}">${cellarInstance.beer.brewery}</g:link></td>

        <td class="nowrap"><g:link controller="beer" action="show" id="${cellarInstance.beer.id}">${cellarInstance.beer}</g:link></td>

        <td><g:link controller="beerSubStyle" action="show" id="${cellarInstance.beer.subStyle.id}">${cellarInstance.beer.subStyle}</g:link></td>

        <td class="nowrap">${cellarInstance.size}</td>

        <td>${cellarInstance.beer.baRating}</td>

        <td>${cellarInstance.quantity}</td>

        <td>${cellarInstance.willTrade ?: 0}</td>

        <td>${cellarInstance.notes}</td>
        <g:set var="currentUser" value="${User.get( sec.loggedInUserInfo(field:'id').toInteger() )}" />
        <td>${cellarInstance.beer.hasUserLogged(currentUser)}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </section>

</body>

</html>
