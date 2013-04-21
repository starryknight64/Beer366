<%@ page import="beer366.BreweryType" %>



			<div class="control-group fieldcontain ${hasErrors(bean: breweryTypeInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="breweryType.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${breweryTypeInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: breweryTypeInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: breweryTypeInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="breweryType.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${breweryTypeInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: breweryTypeInstance, field: 'name', 'error')}</span>
				</div>
			</div>

