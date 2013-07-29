<%@ page import="beer366.Brewery" %>

<div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'name', 'error')} ">
  <label for="name" class="control-label">Brewery Name</label>
  <div class="controls">
    <g:textField name="name" value="${breweryInstance?.name}"/>
    <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'name', 'error')}</span>
  </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'fullName', 'error')} ">
  <label for="fullName" class="control-label"><g:message code="brewery.fullName.label" default="Full Name" /></label>
  <div class="controls">
    <g:textField name="fullName" value="${breweryInstance?.fullName}"/>
    <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'fullName', 'error')}</span>
  </div>
</div>

<fieldset>
  <legend>Brewery Address</legend>

  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'street', 'error')} ">
    <label for="street" class="control-label"><g:message code="brewery.street.label" default="Street" /></label>
    <div class="controls">
      <g:textField name="street" value="${breweryInstance?.street}"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'street', 'error')}</span>
    </div>
  </div>


  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'city', 'error')} ">
    <label for="city" class="control-label"><g:message code="brewery.city.label" default="City" /></label>
    <div class="controls">
      <g:textField name="city" value="${breweryInstance?.city}"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'city', 'error')}</span>
    </div>
  </div>

  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'postalCode', 'error')} ">
    <label for="postalCode" class="control-label"><g:message code="brewery.postalCode.label" default="Postal Code" /></label>
    <div class="controls">
      <g:textField name="postalCode" value="${breweryInstance?.postalCode}"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'postalCode', 'error')}</span>
    </div>
  </div>

  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'country', 'error')} required">
    <label for="country" class="control-label"><g:message code="brewery.country.label" default="Country" /><span class="required-indicator">*</span></label>
    <div class="controls">
      <g:select id="country" name="country.id" from="${beer366.ISO_3166_1.list()}" optionKey="id" required="" value="${breweryInstance?.country?.id}" class="many-to-one"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'country', 'error')}</span>
    </div>
  </div>

  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'region', 'error')} ">
    <label for="region" class="control-label"><g:message code="brewery.region.label" default="Region" /></label>
    <div class="controls">
      <g:select id="region" name="region.id" from="${[]}" optionKey="id" value="${breweryInstance?.region?.id}" class="many-to-one" noSelection="['null': '']"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'region', 'error')}</span>
    </div>
  </div>
</fieldset>

<fieldset>
  <legend>Miscellaneous</legend>

  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'homepage', 'error')} ">
    <label for="homepage" class="control-label"><g:message code="brewery.homepage.label" default="Homepage" /></label>
    <div class="controls">
      <g:textField name="homepage" value="${breweryInstance?.homepage}"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'homepage', 'error')}</span>
    </div>
  </div>

  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'type', 'error')} required">
    <label for="type" class="control-label"><g:message code="brewery.type.label" default="Type" /><span class="required-indicator">*</span></label>
    <div class="controls">
      <g:select id="type" name="type.id" from="${beer366.BreweryType.list()}" optionKey="id" required="" value="${breweryInstance?.type?.id}" class="many-to-one"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'type', 'error')}</span>
    </div>
  </div>

  <div class="control-group fieldcontain ${hasErrors(bean: breweryInstance, field: 'notes', 'error')} ">
    <label for="notes" class="control-label"><g:message code="brewery.notes.label" default="Notes" /></label>
    <div class="controls">
      <g:textArea name="notes" cols="40" rows="5" value="${breweryInstance?.notes}"/>
      <span class="help-inline">${hasErrors(bean: breweryInstance, field: 'notes', 'error')}</span>
    </div>
  </div>
</fieldset>
