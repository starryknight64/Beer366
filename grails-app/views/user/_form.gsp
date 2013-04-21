<%@ page import="beer366.User" %>



			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="username" maxlength="15" required="" value="${userInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="user.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${userInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'homepage', 'error')} ">
				<label for="homepage" class="control-label"><g:message code="user.homepage.label" default="Homepage" /></label>
				<div class="controls">
					<g:textField name="homepage" value="${userInstance?.homepage}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'homepage', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
				<label for="firstName" class="control-label"><g:message code="user.firstName.label" default="First Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'firstName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
				<label for="lastName" class="control-label"><g:message code="user.lastName.label" default="Last Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="lastName" required="" value="${userInstance?.lastName}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'lastName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password" class="control-label"><g:message code="user.password.label" default="Password" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="password" required="" value="${userInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'password', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
				<label for="accountExpired" class="control-label"><g:message code="user.accountExpired.label" default="Account Expired" /></label>
				<div class="controls">
					<bs:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountExpired', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
				<label for="accountLocked" class="control-label"><g:message code="user.accountLocked.label" default="Account Locked" /></label>
				<div class="controls">
					<bs:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountLocked', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
				<label for="enabled" class="control-label"><g:message code="user.enabled.label" default="Enabled" /></label>
				<div class="controls">
					<bs:checkBox name="enabled" value="${userInstance?.enabled}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'enabled', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
				<label for="passwordExpired" class="control-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></label>
				<div class="controls">
					<bs:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'salt', 'error')} ">
				<label for="salt" class="control-label"><g:message code="user.salt.label" default="Salt" /></label>
				<div class="controls">
					<g:textField name="salt" value="${userInstance?.salt}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'salt', 'error')}</span>
				</div>
			</div>

