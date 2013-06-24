package com.sample

import org.springframework.dao.DataIntegrityViolationException

import com.sample.constant.StandardStatusEnum;

class CreateUserCommand {
	String username;
	String password;
	int status;
	
	static constraints = {
		importFrom User
	}
}

class UserController {
	def userService;
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	/**
	 * 
	 * @param max
	 * @param offset
	 * @return
	 */
    def list(int max, int offset) {
		/**
		 * UserCriteria : Use of criteria objects, would result in 
		 * a) Flexible, Secure, clean and less code
		 * b) Performance improvement, as the call for count is cached.
		 */
		UserCriteria userCriteria = new UserCriteria(username:params.username, offset:offset, max:max);
		userCriteria = userService.list(userCriteria);
		/**
		 * The count method is cached. The cache key is the result toString method of the userCriteria.
		 * We should override the toString() method, so as to include all criteria fields used. 
		 * For Grails cache to work, the call should be made from the controller.  
		 * <a href="http://jira.grails.org/browse/GPCACHE-18">More Details</a>
		 */
		userCriteria.total = userService.count(userCriteria);
        [userInstanceList: userCriteria.resultList, userInstanceTotal: userCriteria.total]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save(CreateUserCommand createUserCmd) {
		/**
		 * Early validation - Validating user object in controller, would help us catch validation errors 
		 * in early stages, rather than going into service class to find them.
		 */
		if(createUserCmd.hasErrors()) {
            render(view: "create", model: [userInstance: createUserCmd])
		} else {
			User user = new User();
			user.properties = createUserCmd.properties;
			user = userService.save(user);
			flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
			redirect(action: "show", id: user.id)
		}
    }

    def show(Long id) {
        def userInstance = userService.get(id);
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = userService.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = userService.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = userService.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
