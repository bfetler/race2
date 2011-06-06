
<%@ page import="race2.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:form>
        <!--g:form controller="batch" action="delete" -->
	<!-- g:if should hide nav menubar if not admin user, but fails -->
	<!--g:if env="development" test="${session?.user?.admin}" -->
          <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" controller="registration" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="batch" action="create"><g:message code="default.batch.label" default="New Batch" args="[entityName]" /></g:link></span>
          </div>
	<!--g:if -->
        <div class="body">
            <h1><g:message code="default.batchlist.label" default="Batch Registration List" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'registration.id.label', default: 'Id')}" />
                        
                            <th><g:message code="registration.race.label" default="Race" /></th>
                        
                            <th><g:message code="registration.runner.label" default="Runner" /></th>
                        
                            <g:sortableColumn property="captain" title="${message(code: 'registration.captain.label', default: 'Captain Name')}" />
                        
                            <g:sortableColumn property="paid" title="${message(code: 'registration.paid.label', default: 'Paid')}" />
                        
                            <!--g:sortableColumn property="dateCreated" title="${message(code: 'registration.dateCreated.label', default: 'Date Created')}" /-->

                            <th><g:message code="registration.batchdelete.label" default="Batch Delete" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${registrationInstanceList}" status="i" var="registrationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${registrationInstance.id}">${fieldValue(bean: registrationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "race")}</td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "runner")}</td>
                        
                            <td>${fieldValue(bean: registrationInstance, field: "captain")}</td>
                        
                            <td><g:formatBoolean boolean="${registrationInstance.paid}" /></td>
                        
                            <!--td><g:formatDate date="${registrationInstance.dateCreated}" /></td-->
			    <td><g:checkBox class="batchcheck" name="d.${registrationInstance.id}" value="${false}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${registrationInstanceTotal}" />
            </div>

            <div class="buttons">
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.batchdelete.label', default: 'Batch Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            </div>
        </div>
        </g:form>
    </body>
</html>
