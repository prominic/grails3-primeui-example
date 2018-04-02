<!DOCTYPE html>
<html xmlns="http://www.w3c.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:p="http://primefaces.org/ui">
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'test.label', default: 'Test')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script>

            $(function() {
                $('#in').puiinputtext();
            });
        </script>
    </head>
    <body>
        <a href="#list-test" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-test" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${testList}" />

            <div class="pagination">
                <g:paginate total="${testCount ?: 0}" />
            </div>
        </div>

         <div>
             11111
             <h3 class="first">Basic</h3>
             <input id="in" type="text" size="30"/>

             <h3>PrimeElement</h3>
             <input type="text" is="p-inputtext" value="" size="30" />
             22222
         </div>

    </body>
</html>