<%@ page import="beer366.ISO_3166_1" %>



			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_1Instance, field: 'alpha2', 'error')} ">
				<label for="alpha2" class="control-label"><g:message code="ISO_3166_1.alpha2.label" default="Alpha2" /></label>
				<div class="controls">
					<g:textField name="alpha2" maxlength="2" value="${ISO_3166_1Instance?.alpha2}"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_1Instance, field: 'alpha2', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_1Instance, field: 'alpha3', 'error')} ">
				<label for="alpha3" class="control-label"><g:message code="ISO_3166_1.alpha3.label" default="Alpha3" /></label>
				<div class="controls">
					<g:textField name="alpha3" maxlength="3" value="${ISO_3166_1Instance?.alpha3}"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_1Instance, field: 'alpha3', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_1Instance, field: 'code', 'error')} required">
				<label for="code" class="control-label"><g:message code="ISO_3166_1.code.label" default="Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="code" required="" value="${ISO_3166_1Instance.code}"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_1Instance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_1Instance, field: 'subContinent', 'error')} ">
				<label for="subContinent" class="control-label"><g:message code="ISO_3166_1.subContinent.label" default="Sub Continent" /></label>
				<div class="controls">
					<g:select id="subContinent" name="subContinent.id" from="${beer366.SubContinent.list()}" optionKey="id" value="${ISO_3166_1Instance?.subContinent?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_1Instance, field: 'subContinent', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ISO_3166_1Instance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="ISO_3166_1.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${ISO_3166_1Instance?.name}"/>
					<span class="help-inline">${hasErrors(bean: ISO_3166_1Instance, field: 'name', 'error')}</span>
				</div>
			</div>

