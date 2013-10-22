
<%@ page import="beer366.Beer" %>
<%@ page import="beer366.Cellar" %>
<%@ page import="beer366.DrinkLog" %>
<%@ page import="beer366.User" %>
<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="inCurUserCellar" value="${cellarUser.username == sec.username().trim()}"/>
  <title>${inCurUserCellar.toBoolean() ? "My Cellar" : "${cellarUser}'s Cellar"}</title>
</head>

<body>
  <g:if test="${flash.message}">
    <div class="alert alert-info">${flash.message}</div>
  </g:if>
  <div class="page-header">
    <h2>${inCurUserCellar.toBoolean() ? "My Cellar" : "${cellarUser}'s Cellar"}</h2>
  </div>
  <div class="container">
    <g:if test="${inCurUserCellar.toBoolean()}">
      <div class="btn-group">
        <g:link controller="cellar" action="create" class="btn"><i class="icon-plus"></i> Add</g:link>
      </div>
    </g:if>
    <div class="row">
      <g:set var="total" value="0"/>
      <g:set var="willTrade" value="0"/>
      <g:each var="cellarBeer" in="${cellarInstanceList}">
        <g:set var="total" value="${total.toInteger() + (cellarBeer.quantity ?: 0)}"/>
        <g:set var="willTrade" value="${willTrade.toInteger() + (cellarBeer.willTrade ?: 0)}"/>
      </g:each>
      <div class="span12">${inCurUserCellar.toBoolean() ? "You have" : "${cellarUser} has"} ${total} beer${total.toInteger() != 1 ? "s" : ""} in ${inCurUserCellar.toBoolean() ? "your" : cellarUser.gender == "M" ? "his" : "her"} cellar and ${inCurUserCellar.toBoolean() ? "are" : "is"} willing to trade ${willTrade}.</div>
    </div>

    <g:if test="${total.toInteger() > 0}">
      <div class="row">
        <div class="span12">
          <table class="table table-bordered table-hover sortable">
            <thead>
              <tr>
            <g:if test="${inCurUserCellar.toBoolean()}">
              <th class="sorttable_nosort"></th>
              <th class="sorttable_nosort"></th>
              <th class="sorttable_nosort"></th>
            </g:if>
            <th class="nowrap"><g:message code="beer.brewery.label" default="Brewery" /></th>
            <th class="nowrap"><g:message code="cellar.beer.label" default="Beer" /></th>
            <th class="nowrap"><g:message code="beer.subStyle.label" default="Style" /></th>
            <th class="nowrap"><g:message code="cellar.size.label" default="Size" /></th>
            <th class="nowrap"><g:message code="beer.baRating.label" default="BA Rating" /></th>
            <th class="nowrap"><g:message code="cellar.quantity.label" default="Quantity" /></th>
            <th class="nowrap">Will Trade</th>
            <th class="nowrap"><g:message code="cellar.notes.label" default="Notes" /></th>
            <th class="nowrap">I've Had</th>
            </tr>
            </thead>
            <tbody>
            <g:set var="currentUser" value="${User.get( sec.loggedInUserInfo(field:'id').toInteger() )}" />
            <g:each var="cellarInstance" in="${cellarInstanceList}">
              <tr>
              <g:if test="${inCurUserCellar.toBoolean()}">
                <td><g:link controller="cellar" action="edit" id="${cellarInstance.id}"><i class="icon-pencil"></i></g:link></td>
                <td><g:link controller="drinkLog" action="create" id="${cellarInstance.id}" params="${[fromCellar: true]}"><i class="icon-ok"></i></g:link></td>
                <td><g:link controller="cellar" action="delete" id="${cellarInstance.id}" params="[id: '${cellarInstance.id}']" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="icon-remove"></i></g:link></td>
              </g:if>
              <td><g:link controller="brewery" action="show" id="${cellarInstance.beer.brewery.id}">${cellarInstance.beer.brewery}</g:link></td>

              <td class="nowrap"><g:link controller="beer" action="show" id="${cellarInstance.beer.id}">${cellarInstance.beer}</g:link></td>

              <td><g:link controller="beerSubStyle" action="show" id="${cellarInstance.beer.subStyle.id}">${cellarInstance.beer.subStyle}</g:link></td>

              <td class="nowrap" sorttable_customkey="${cellarInstance.size.ml}">${cellarInstance.size.name}</td>

              <td>${cellarInstance.beer.baRating}</td>

              <td>${cellarInstance.quantity}</td>

              <td>${cellarInstance.willTrade ?: 0}</td>

              <td>${cellarInstance.notes}</td>

              <td>${cellarInstance.beer.hasUserLogged(currentUser)}</td>
              </tr>
            </g:each>
            </tbody>
          </table>
        </div>
      </div>
    </g:if>
  </div>
</body>

</html>
