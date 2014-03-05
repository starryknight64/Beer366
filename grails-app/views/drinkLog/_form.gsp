<%@ page import="beer366.DrinkLog" %>

<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'date', 'error')} required">
  <label for="date" class="control-label"><g:message code="drinkLog.date.label" default="Date" /><span class="required-indicator">*</span></label>
  <div class="controls">
    <bs:datePicker name="date" precision="day"  value="${drinkLogInstance?.date}"  />
    <span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'date', 'error')}</span>
  </div>
</div>

<g:if test="${cellarList}">
  <div class="control-group fieldcontain">
    <label for="cellarBeer" class="control-label">From Cellar</label>
    <div class="controls">
      <select id="cellarBeer" name="cellarBeer.id" class="many-to-one" data-placeholder="Select a beer...">
        <option value></option>
        <g:each in="${cellarList.sort{c1,c2-> c1.beer.brewery.name <=> c2.beer.brewery.name ?: c1.beer.name <=> c2.beer.name}}">
          <option value="${it.id}" breweryid="${it.beer.brewery.id}" beerid="${it.beer.id}" servingsizeid="${it.servingSize.id}">${it} - ${it.servingSize.name}</option>
        </g:each>
      </select>
    </div>
  </div>
</g:if>

<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance?.beer?.brewery, 'error')}">
  <label for="brewery" class="control-label"><g:message code="beer.brewery.label" default="Brewery" /></label>
  <div class="controls">
    <g:select id="brewery" name="brewery.id" from="${beer366.Brewery.list()}" optionKey="id" required="" value="${drinkLogInstance?.beer?.brewery?.id}" class="many-to-one"/>
    <span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'beer', 'error')}</span>
  </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'beer', 'error')} required">
  <label for="beer" class="control-label"><g:message code="drinkLog.beer.label" default="Beer" /><span class="required-indicator">*</span></label>
  <div class="controls">
    <g:select id="beer" name="beer.id" from="${beer366.Beer.findAllByBrewery(drinkLogInstance?.beer?.brewery)}" optionKey="id" required="" value="${drinkLogInstance?.beer?.id}" class="many-to-one"/>
    <span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'beer', 'error')}</span>
  </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'servingSize', 'error')} ">
  <label for="servingSize" class="control-label"><g:message code="drinkLog.servingSize.label" default="servingSize" /></label>
  <div class="controls">
    <g:select id="servingSize" name="servingSize.id" from="${beer366.ServingSize.list()}" optionKey="id" value="${drinkLogInstance?.servingSize?.id ?: beer366.ServingSize.defaultSize()?.id}" class="many-to-one" noSelection="['null': '']"/>
    <span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'servingSize', 'error')}</span>
  </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'rating', 'error')} ">
  <label for="rating" class="control-label"><g:message code="drinkLog.rating.label" default="Rating" /></label>
  <div class="controls">
    <g:field type="number" name="rating" step="0.1" min="0.0" max="5.0" value="${drinkLogInstance.rating}"/>
    <span class="help-inline rating-help"></span>
    <span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'rating', 'error')}</span>
  </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'notes', 'error')} ">
  <label for="notes" class="control-label"><g:message code="drinkLog.notes.label" default="Notes" /></label>
  <div class="controls">
    <g:textArea name="notes" cols="40" rows="5" value="${drinkLogInstance?.notes}"/>
    <span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'notes', 'error')}</span>
  </div>
</div>

<g:hiddenField name="user.id" value="${drinkLogInstance?.user?.id ?: sec.loggedInUserInfo(field: "id")}" />
