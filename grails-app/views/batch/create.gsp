

<%@ page import="race2.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
        <title><g:message code="default.batch.label" default="Batch Registration" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="registration" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.batch.list.label" default="Batch List" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.batch.label" default="Create Batch Registration" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${registrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${registrationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="batch" action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="race"><g:message code="registration.race.label" default="Race" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'race', 'errors')}">
                                    <g:select name="race.id" from="${race2.Race.list()}" optionKey="id" value="${registrationInstance?.race?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="captain"><g:message code="registration.captain.label" default="Captain Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'captain', 'errors')}">
                                    <!--g:textField name="captain" value="${registrationInstance?.captain}" /-->
                                    <g:textField name="captain" value="${session?.user?.captain}" />
                                </td>
                            </tr>
                        
                            <!--tr class="prop">
                                <td valign="top" class="name">
                                    <label for="runner"><g:message code="registration.runner.label" default="Runner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'runner', 'errors')}">
                                    <g:select name="runner.id" from="${race2.Runner.list()}" optionKey="id" value="${registrationInstance?.runner?.id}"  />
                                </td>
                            </tr-->
                        
                            <!--tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paid"><g:message code="registration.paid.label" default="Paid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'paid', 'errors')}">
                                    <g:checkBox name="paid" value="${registrationInstance?.paid}" />
                                </td>
                            </tr-->
                        
                            <tr class="prop">
                                <td valign="top" class="mytitle">
                                    <label class="mytitle"><g:message code="registration.runners.label" default="Runners" /></label>
                                </td>
                                <td valign="top" class="mytitle">
                                    <label class="mytitle"><g:message code="registration.runreg.label" default="Register" /></label>
                                </td>
                                <td valign="top" class="mytitle">
                                    <label class="mytitle"><g:message code="registration.runpaid.label" default="Paid" /></label>
                                </td>
                            </tr>
                        
			    <g:each in="${runnerList}" status="i" var="runnerInstance" >
                              <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="${runnerInstance}">${runnerInstance}</label>
                                </td>
                                <td valign="top" class="">
                                    <g:checkBox name="r.${runnerInstance.id}" value="${false}" />
                                    <!--g:checkBox name="runr.${i+1}" value="${false}" /-->
                                </td>
                                <td valign="top" class="">
                                    <g:checkBox name="p.${runnerInstance.id}" value="${false}" />
                                    <!--g:checkBox name="pay.${i+1}" value="${false}" /-->
                                </td>
                              </tr>
			    </g:each>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="save" class="batchsave" value="${message(code: 'default.button.batch.label', default: 'Create Batch')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
