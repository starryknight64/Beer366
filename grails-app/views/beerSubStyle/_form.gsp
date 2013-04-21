<%@ page import="beer366.BeerSubStyle" %>



			<div class="control-group fieldcontain ${hasErrors(bean: beerSubStyleInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="beerSubStyle.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${beerSubStyleInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: beerSubStyleInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: beerSubStyleInstance, field: 'style', 'error')} required">
				<label for="style" class="control-label"><g:message code="beerSubStyle.style.label" default="Style" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="style" name="style.id" from="${beer366.BeerStyle.list()}" optionKey="id" required="" value="${beerSubStyleInstance?.style?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: beerSubStyleInstance, field: 'style', 'error')}</span>
				</div>
			</div>

