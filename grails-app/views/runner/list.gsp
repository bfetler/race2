
<%@ page import="race2.Runner" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	<!-- g:if should hide nav menubar if not admin user, but fails -->
	<!--g:if env="development" test="${session?.user?.admin}" -->
          <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <!--g:sortableColumn property="id" title="${message(code: 'runner.id.label', default: 'Id')}" /-->
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'runner.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'runner.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="dateOfBirth" title="${message(code: 'runner.dateOfBirth.label', default: 'Date Of Birth')}" />
                        
                            <g:sortableColumn property="gender" title="${message(code: 'runner.gender.label', default: 'Gender')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'runner.email.label', default: 'Email')}" />

                            <g:sortableColumn property="address" title="${message(code: 'runner.address.label', default: 'Address')}" />
                            <g:sortableColumn property="city" title="${message(code: 'runner.city.label', default: 'City')}" />
                            <g:sortableColumn property="state" title="${message(code: 'runner.state.label', default: 'State')}" />
                            <g:sortableColumn property="zipcode" title="${message(code: 'runner.zipcode.label', default: 'Zipcode')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${runnerInstanceList}" status="i" var="runnerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <!--td><g:link action="show" id="${runnerInstance.id}">${fieldValue(bean: runnerInstance, field: "id")}</g:link></td-->
                        
                            <td><g:link action="show" id="${runnerInstance.id}">${fieldValue(bean: runnerInstance, field: "firstName")}</g:link></td>
                        
                            <td><g:link action="show" id="${runnerInstance.id}">${fieldValue(bean: runnerInstance, field: "lastName")}</g:link></td>
                        
                            <td><g:formatDate format="yyyy-MM-dd" date="${runnerInstance.dateOfBirth}" /></td>
                        
                            <td>${fieldValue(bean: runnerInstance, field: "gender")}</td>
                        
                            <td>${fieldValue(bean: runnerInstance, field: "email")}</td>

                            <td>${fieldValue(bean: runnerInstance, field: "address")}</td>
                            <td>${fieldValue(bean: runnerInstance, field: "city")}</td>
                            <td>${fieldValue(bean: runnerInstance, field: "state")}</td>
                            <td>${fieldValue(bean: runnerInstance, field: "zipcode")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${runnerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
