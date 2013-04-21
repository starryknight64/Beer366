<%@ page import="beer366.ISO_3166_2" %>



			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_2Instance, field: 'code', 'error')} ">
				<label for="code" class="control-label"><g:message code="ISO_3166_2.code.label" default="Code" /></label>
				<div class="controls">
					<g:textField name="code" value="${ISO_3166_2Instance?.code}"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_2Instance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_2Instance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="ISO_3166_2.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${beer366.ISO_3166_1.list()}" optionKey="id" required="" value="${ISO_3166_2Instance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_2Instance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_2Instance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="ISO_3166_2.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${ISO_3166_2Instance?.name}"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_2Instance, field: 'name', 'error')}</span>
				</div>
			</div>

