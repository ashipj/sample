package com.sample

import org.springframework.dao.DataIntegrityViolationException

class UserCriteriaController {
	
	def userCriteriaService ;
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userCriteriaInstanceList: UserCriteria.list(params), userCriteriaInstanceTotal: UserCriteria.count()]
    }

    def create() {
        [userCriteriaInstance: new UserCriteria(params)]
    }

    def save() {
        def userCriteriaInstance = new UserCriteria(params)
        if (!userCriteriaInstance.save(flush: true)) {
            render(view: "create", model: [userCriteriaInstance: userCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), userCriteriaInstance.id])
        redirect(action: "show", id: userCriteriaInstance.id)
    }

    def show(Long id) {
        def userCriteriaInstance = userCriteriaService.get(id)
        if (!userCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), id])
            redirect(action: "list")
            return
        }

        [userCriteriaInstance: userCriteriaInstance]
    }

    def edit(Long id) {
        def userCriteriaInstance = userCriteriaService.get(id)
        if (!userCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), id])
            redirect(action: "list")
            return
        }

        [userCriteriaInstance: userCriteriaInstance]
    }

    def update(Long id, Long version) {
        def userCriteriaInstance = userCriteriaService.get(id)
        if (!userCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userCriteriaInstance.version > version) {
                userCriteriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userCriteria.label', default: 'UserCriteria')] as Object[],
                          "Another user has updated this UserCriteria while you were editing")
                render(view: "edit", model: [userCriteriaInstance: userCriteriaInstance])
                return
            }
        }

        userCriteriaInstance.properties = params

        if (!userCriteriaInstance.save(flush: true)) {
            render(view: "edit", model: [userCriteriaInstance: userCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), userCriteriaInstance.id])
        redirect(action: "show", id: userCriteriaInstance.id)
    }

    def delete(Long id) {
        def userCriteriaInstance = userCriteriaService.get(id)
        if (!userCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), id])
            redirect(action: "list")
            return
        }

        try {
            userCriteriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userCriteria.label', default: 'UserCriteria'), id])
            redirect(action: "show", id: id)
        }
    }
}
