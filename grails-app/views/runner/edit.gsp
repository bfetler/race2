

<%@ page import="race2.Runner" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${runnerInstance}">
            <div class="errors">
                <g:renderErrors bean="${runnerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${runnerInstance?.id}" />
                <g:hiddenField name="version" value="${runnerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="runner.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${runnerInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="runner.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${runnerInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateOfBirth"><g:message code="runner.dateOfBirth.label" default="Date Of Birth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'dateOfBirth', 'errors')}">
                                    <g:datePicker name="dateOfBirth" precision="day" value="${runnerInstance?.dateOfBirth}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gender"><g:message code="runner.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'gender', 'errors')}">
                                    <g:select name="gender" from="${runnerInstance.constraints.gender.inList}" value="${runnerInstance?.gender}" valueMessagePrefix="runner.gender"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="runner.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${runnerInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="runner.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${runnerInstance?.address}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="runner.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${runnerInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="state"><g:message code="runner.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'state', 'errors')}">
                                    <g:textField name="state" value="${runnerInstance?.state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="zipcode"><g:message code="runner.zipcode.label" default="Zipcode" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'zipcode', 'errors')}">
                                    <g:textField name="zipcode" value="${runnerInstance?.zipcode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="registrations"><g:message code="runner.registrations.label" default="Registrations" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: runnerInstance, field: 'registrations', 'errors')}">
                                    
<ul>
<g:each in="${runnerInstance?.registrations?}" var="r">
    <li><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="registration" action="create" params="['runner.id': runnerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'registration.label', default: 'Registration')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
