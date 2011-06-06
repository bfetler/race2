

<%@ page import="race2.Race" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${raceInstance}">
            <div class="errors">
                <g:renderErrors bean="${raceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="race.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${raceInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="race.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="minute" value="${raceInstance?.startDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="race.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" maxlength="100" value="${raceInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state"><g:message code="race.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'state', 'errors')}">
                                    <!--g:select name="state" from="${raceInstance.constraints.state.inList}" value="${raceInstance?.state}" valueMessagePrefix="race.state"  /-->
                                    <g:select name="state" from="${stateList}" value="${raceInstance?.state}" valueMessagePrefix="race.state"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distance"><g:message code="race.distance.label" default="Distance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'distance', 'errors')}">
                                    <g:textField name="distance" value="${fieldValue(bean: raceInstance, field: 'distance')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost"><g:message code="race.cost.label" default="Cost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'cost', 'errors')}">
                                    <g:textField name="cost" value="${fieldValue(bean: raceInstance, field: 'cost')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxRunners"><g:message code="race.maxRunners.label" default="Max Runners" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'maxRunners', 'errors')}">
                                    <g:textField name="maxRunners" value="${fieldValue(bean: raceInstance, field: 'maxRunners')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
