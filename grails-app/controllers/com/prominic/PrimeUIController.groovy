package com.prominic

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
@Transactional(readOnly = true)
class PrimeUIController {

    //prime ui
    def sample(){

    }

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def switchStyle(){
        def style= params.style
        if(style){
            println "style:"+style
            session.templateStyle=style
        }
        render ""
    }

    def index(Integer max) {

        if(!session.templateStyle){
            session.templateStyle="aristo"
        }

        params.max = Math.min(max ?: 10, 100)

       // render  PrimeUI.list(params) as JSON
        respond PrimeUI.list(params), model:[primeUICount: PrimeUI.count()]
    }

    def indexJson(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        render  PrimeUI.list(params) as JSON
    }

    def show(PrimeUI primeUI) {
        respond primeUI
    }

    def create() {
        respond new PrimeUI(params)
    }

    @Transactional
    def save(PrimeUI primeUI) {
        if (primeUI == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (primeUI.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond primeUI.errors, view:'create'
            return
        }

        primeUI.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'primeUI.label', default: 'PrimeUI'), primeUI.id])
                redirect primeUI
            }
            '*' { respond primeUI, [status: CREATED] }
        }
    }

    def edit(PrimeUI primeUI) {
        respond primeUI
    }

    @Transactional
    def update(PrimeUI primeUI) {
        if (primeUI == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (primeUI.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond primeUI.errors, view:'edit'
            return
        }

        primeUI.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'primeUI.label', default: 'PrimeUI'), primeUI.id])
                redirect primeUI
            }
            '*'{ respond primeUI, [status: OK] }
        }
    }

    @Transactional
    def delete(PrimeUI primeUI) {

        if (primeUI == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        primeUI.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'primeUI.label', default: 'PrimeUI'), primeUI.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'primeUI.label', default: 'PrimeUI'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
