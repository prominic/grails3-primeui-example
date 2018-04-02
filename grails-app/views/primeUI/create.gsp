<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="primeui" />
        <g:set var="entityName" value="${message(code: 'primeUI.label', default: 'PrimeUI')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script>


            $(function() {
                $('#mb1').puimenubar();
                $('#default').puibutton({
                    icon: 'fa-save'
                });
            });
        </script>
    </head>
    <body>
        <a href="#create-primeUI" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div >
            <ul id="mb1">
                <li> <a data-icon="fa-home" href="${createLink(uri: '/')}">Home</a>

                </li>
                <li> <a data-icon="fa-plus" href="/primeUI/create">New PrimeUI</a>

                </li>

                <li>
                    <a data-icon="fa-close">Quit</a>
                </li>
            </ul>
        </div>
        <div id="create-primeUI" >
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.primeUI}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.primeUI}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.primeUI}" method="POST">
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='author'>Author
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="author" value="" required="" is="p-inputtext" id="author" />
                    </div><div class='fieldcontain required'>
                    <label for='description'>Description
                        <span class='required-indicator'>*</span>
                    </label><input type="text" name="description" value="" required="" is="p-inputtext" id="description" />
                </div><div class='fieldcontain required'>
                    <label for='title'>Title
                        <span class='required-indicator'>*</span>
                    </label><input type="text" name="title" value="" required="" is="p-inputtext" id="title" />
                </div><div class='fieldcontain required'>
                    <label for='releaseYear'>Release Year
                        <span class='required-indicator'>*</span>
                    </label><input type="text" name="releaseYear" value="" required="" is="p-inputtext" id="releaseYear" />
                </div>
                </fieldset>
                <fieldset class="buttons">
                    <button id="default" type="submit">Create</button>

                </fieldset>
            </g:form>
        </div>
    </body>
</html>
