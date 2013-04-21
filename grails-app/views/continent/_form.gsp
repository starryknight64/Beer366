<%@ page import="beer366.Continent" %>



			<div class="control-group fieldcontain ${hasErrors(bean: continentInstance, field: 'code', 'error')} ">
				<label for="code" class="control-label"><g:message code="continent.code.label" default="Code" /></label>
				<div class="controls">
					<g:textField name="code" maxlength="3" value="${continentInstance?.code}"/>
					<span class="help-inline">${hasErrors(bean: continentInstance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: continentInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="continent.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${continentInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: continentInstance, field: 'name', 'error')}</span>
				</div>
			</div>

