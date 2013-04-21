<%@ page import="beer366.Beer" %>



			<div class="control-group fieldcontain ${hasErrors(bean: beerInstance, field: 'abv', 'error')} ">
				<label for="abv" class="control-label"><g:message code="beer.abv.label" default="Abv" /></label>
				<div class="controls">
					<g:field type="number" name="abv" step="0.01" min="0.0" value="${beerInstance.abv}"/>
					<span class="help-inline">${hasErrors(bean: beerInstance, field: 'abv', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: beerInstance, field: 'baRating', 'error')} ">
				<label for="baRating" class="control-label"><g:message code="beer.baRating.label" default="Ba Rating" /></label>
				<div class="controls">
					<g:select name="baRating" from="${0..100}" class="range" value="${fieldValue(bean: beerInstance, field: 'baRating')}" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: beerInstance, field: 'baRating', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: beerInstance, field: 'baPage', 'error')} ">
				<label for="baPage" class="control-label"><g:message code="beer.baPage.label" default="Ba Page" /></label>
				<div class="controls">
					<g:textField name="baPage" value="${beerInstance?.baPage}"/>
					<span class="help-inline">${hasErrors(bean: beerInstance, field: 'baPage', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: beerInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="beer.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${beerInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: beerInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: beerInstance, field: 'brewery', 'error')} required">
				<label for="brewery" class="control-label"><g:message code="beer.brewery.label" default="Brewery" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="brewery" name="brewery.id" from="${beer366.Brewery.list()}" optionKey="id" required="" value="${beerInstance?.brewery?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: beerInstance, field: 'brewery', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: beerInstance, field: 'subStyle', 'error')} required">
				<label for="subStyle" class="control-label"><g:message code="beer.subStyle.label" default="Sub Style" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="subStyle" name="subStyle.id" from="${beer366.BeerSubStyle.list()}" optionKey="id" required="" value="${beerInstance?.subStyle?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: beerInstance, field: 'subStyle', 'error')}</span>
				</div>
			</div>

