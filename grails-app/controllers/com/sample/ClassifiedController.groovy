package com.sample

import org.springframework.dao.DataIntegrityViolationException

class ClassifiedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [classifiedInstanceList: Classified.list(params), classifiedInstanceTotal: Classified.count()]
    }

    def create() {
        [classifiedInstance: new Classified(params)]
    }

    def save() {
        def classifiedInstance = new Classified(params)
        if (!classifiedInstance.save(flush: true)) {
            render(view: "create", model: [classifiedInstance: classifiedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'classified.label', default: 'Classified'), classifiedInstance.id])
        redirect(action: "show", id: classifiedInstance.id)
    }

    def show(Long id) {
        def classifiedInstance = Classified.get(id)
        if (!classifiedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classified.label', default: 'Classified'), id])
            redirect(action: "list")
            return
        }

        [classifiedInstance: classifiedInstance]
    }

    def edit(Long id) {
        def classifiedInstance = Classified.get(id)
        if (!classifiedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classified.label', default: 'Classified'), id])
            redirect(action: "list")
            return
        }

        [classifiedInstance: classifiedInstance]
    }

    def update(Long id, Long version) {
        def classifiedInstance = Classified.get(id)
        if (!classifiedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classified.label', default: 'Classified'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (classifiedInstance.version > version) {
                classifiedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'classified.label', default: 'Classified')] as Object[],
                          "Another user has updated this Classified while you were editing")
                render(view: "edit", model: [classifiedInstance: classifiedInstance])
                return
            }
        }

        classifiedInstance.properties = params

        if (!classifiedInstance.save(flush: true)) {
            render(view: "edit", model: [classifiedInstance: classifiedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'classified.label', default: 'Classified'), classifiedInstance.id])
        redirect(action: "show", id: classifiedInstance.id)
    }

    def delete(Long id) {
        def classifiedInstance = Classified.get(id)
        if (!classifiedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classified.label', default: 'Classified'), id])
            redirect(action: "list")
            return
        }

        try {
            classifiedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'classified.label', default: 'Classified'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'classified.label', default: 'Classified'), id])
            redirect(action: "show", id: id)
        }
    }
}
