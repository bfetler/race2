
<%@ page import="race2.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	<!-- g:if should hide nav menubar if not admin user, but fails -->
	<!--g:if env="development" test="${session?.user?.admin}" -->
          <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="batch" controller="batch" action="create"><g:message code="default.batch.label" default="New Batch" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="batchlist" controller="batch" action="list"><g:message code="default.batchlist.label" default="Batch List" args="[entityName]" /></g:link></span>
          </div>
	<!--g:if -->
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
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
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'registration.dateCreated.label', default: 'Date Created')}" />

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
                        
                            <td><g:formatDate date="${registrationInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${registrationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
