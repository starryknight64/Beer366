<%@ page import="beer366.BeerStyle" %>



			<div class="control-group fieldcontain ${hasErrors(bean: beerStyleInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="beerStyle.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${beerStyleInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: beerStyleInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: beerStyleInstance, field: 'family', 'error')} required">
				<label for="family" class="control-label"><g:message code="beerStyle.family.label" default="Family" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="family" name="family.id" from="${beer366.BeerFamily.list()}" optionKey="id" required="" value="${beerStyleInstance?.family?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: beerStyleInstance, field: 'family', 'error')}</span>
				</div>
			</div>

