<%@ page import="beer366.BeerFamily" %>



			<div class="control-group fieldcontain ${hasErrors(bean: beerFamilyInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="beerFamily.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${beerFamilyInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: beerFamilyInstance, field: 'name', 'error')}</span>
				</div>
			</div>

