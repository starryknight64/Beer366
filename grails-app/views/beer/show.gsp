
<%@ page import="beer366.Beer" %>
<%@ page import="beer366.DrinkLog" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'beer.label', default: 'Beer')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
  <h1>${beerInstance}</h1>
  <hr>
  <div class="btn-group">
    <g:link class="btn" controller="drinkLog" action="create" id="${beerInstance.id}"><i class="icon-plus"></i> Log This</g:link>
    <g:link class="btn" controller="cellar" action="create" id="${beerInstance.id}"><i class="icon-calendar"></i> Add to My Cellar</g:link>
    <g:link class="btn" controller="beer" action="edit" id="${beerInstance.id}"><i class="icon-pencil"></i> Edit Beer</g:link>
  </div>

  <div class="row">
    <div class="span4">
      <h3>Brewed By</h3>
      <g:link controller="brewery" action="show" id="${beerInstance.brewery.id}">${beerInstance.brewery.fullName}</g:link>
      <address>
        ${beerInstance.brewery.city}${beerInstance.brewery.region ? ", ${beerInstance.brewery.region}" : ""}, ${beerInstance.brewery.country}
      </address>
    </div>
    <div class="span4">
      <h3>Style</h3>
      <g:link controller="beerSubStyle" action="show" id="${beerInstance.subStyle.id}">${beerInstance.subStyle}</g:link> (<b:formatABV abv="${beerInstance.abv}" /> ABV)
    </div>
    <div class="span4">
      <h3>Ratings</h3>
      <p><b>BA:</b> <a href="${beerInstance.beerAdvocateURL()}">${beerInstance.baRating}<i class="icon-share-alt"></i></a></p>
      <p><b>Beer366:</b> <g:formatNumber number="${beerInstance.averageRating()}" format="0.00" /></p>
    </div>
  </div>
<b:renderDrinkLogsSection logs="${DrinkLog.findAllByBeer( beerInstance )}" name="Logged Drinks" inBeerPage="${true}" showPerson="${true}" />
</body>

</html>
