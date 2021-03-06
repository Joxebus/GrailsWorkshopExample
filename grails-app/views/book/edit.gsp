<%@ page import="com.nearsoft.Author" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="bootstrap" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">
                <h2>
                    <g:message code="default.edit.label" args="[entityName]" />
                </h2>
            </div>
        </div>
        <div class="panel-body">
            <g:if test="${flash.message}">
            <div class="alert alert-info" role="alert">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.book}">
            <ul class="alert alert-danger" role="alert">
                <g:eachError bean="${this.book}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.book}" method="PUT" class="form-horizontal">
                <g:hiddenField name="version" value="${this.book?.version}" />
                <fieldset class="form">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><g:message code="book.form.title" default="Title"/></label>
                            <div class="col-sm-8">
                                <g:textField name="title" value="${this.book.title}" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><g:message code="book.form.link" default="Link"/></label>
                            <div class="col-sm-8">
                                <g:textField name="link" value="${this.book.link}" class="form-control"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-2 control-label"><g:message code="book.form.description" default="Description"/></label>
                            <div class="col-sm-8">
                            <g:textArea name="description" value="${this.book.description}" class="form-control" rows="10"/>
                                </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><g:message code="book.form.author" default="Author"/></label>
                            <div class="col-sm-8">
                            <g:select from="${com.nearsoft.Author.list()}" name="author.id" optionKey="id" value="${this.book.author.id}" class="form-control"/>
                            </div>
                        </div>
                    </fieldset>

                </fieldset>
                <br/>
                <fieldset class="buttons">
                    <input type="submit" class="btn btn-primary" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
