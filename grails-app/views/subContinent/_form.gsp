<%@ page import="beer366.SubContinent" %>



			<div class="control-group fieldcontain ${hasErrors(bean: subContinentInstance, field: 'code', 'error')} ">
				<label for="code" class="control-label"><g:message code="subContinent.code.label" default="Code" /></label>
				<div class="controls">
					<g:textField name="code" maxlength="3" value="${subContinentInstance?.code}"/>
					<span class="help-inline">${hasErrors(bean: subContinentInstance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subContinentInstance, field: 'continent', 'error')} required">
				<label for="continent" class="control-label"><g:message code="subContinent.continent.label" default="Continent" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="continent" name="continent.id" from="${beer366.Continent.list()}" optionKey="id" required="" value="${subContinentInstance?.continent?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: subContinentInstance, field: 'continent', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subContinentInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="subContinent.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${subContinentInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: subContinentInstance, field: 'name', 'error')}</span>
				</div>
			</div>

