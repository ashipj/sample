package com.sample

import grails.gorm.DetachedCriteria
import grails.plugin.cache.CacheEvict;
import grails.plugin.cache.CachePut;
import grails.plugin.cache.Cacheable;

import org.hibernate.annotations.Cache;
import org.hibernate.criterion.CriteriaSpecification

class UserService {
	def userCriteriaService;
	
	/**
	 * This method would return a <b style="color:red">un-validated</b> User, for a userId. 
	 * An <b>Exception</b> is thrown if user is not found.
	 * @author Ashish Joseph
	 * @param userId : id of the user
	 * @return User
	 * @throws Exception
	 */
	@Cacheable(value="getUserCache", key="#userId")
	public User get(long userId) throws Exception {
		User user = User.get(userId);
		// if(!user) throw a custom exception  
		return user;
	}
	
	/**
	 * This method is used for both create and update functionality.
	 * The @CachePut annotation would add/update the currently saved User to the "getUserCache" cache 
	 */
	@CachePut("getUserCache")
	public User save(User user) throws Exception {
		return user.save();
	}
	
	/**
	 * This method can be used to search or filter user.
	 * @author Ashish Joseph
	 * @param userCriteria
	 * @return List<User>
	 * @throws Exception
	 */
	public UserCriteria list(UserCriteria userCriteria) throws Exception {
		/**
		 * Break down a long method into multiple logical methods and call individual methods, in the main method. 
		 * This would help in code readability and flexibility.
		 */
		DetachedCriteria detachedCriteria = getDetachedCriteria(userCriteria);
		if(userCriteria) {
			userCriteria.resultList = detachedCriteria.list(max:userCriteria.max, offset:userCriteria.offset)
		} else {
			userCriteria = new UserCriteria();
			userCriteria.resultList = User.list();
		}
		return userCriteria;
	}
	
	public DetachedCriteria getDetachedCriteria(UserCriteria userCriteria) {
		DetachedCriteria detachedCriteria = new DetachedCriteria(User).build {
			if(userCriteria.username) ilike("username", "%${userCriteria.username}%")
			if(userCriteria.createdBefore) between('dateCreated', new Date(0), userCriteria.createdBefore)
			if(userCriteria.createdAfter) between('dateCreated', userCriteria.createdAfter, new Date())
			if(userCriteria.status > 0) eq("status", userCriteria.status)
		}
		return detachedCriteria;
	}
	
	/**
	 * This method will accept a saved filter
	 * @author Ashish Joseph 
	 * @param criteriaId : ID of a saved filter that is applied
	 * @param offset : Current offset
	 * @param max : Current max
	 * @return List<User>
	 * @throws Exception
	 */
	public List<User> list(long criteriaId, int offset, int max) throws Exception {
		UserCriteria userCriteria = userCriteriaService.get(criteriaId);
		userCriteria.max = max;
		userCriteria.offset = offset;
		return list(userCriteria);
	}
	
	/**
	 * For cache to work, call this function from the controller.
	 * <a href="http://jira.grails.org/browse/GPCACHE-18">More Details</a>
	 * @author Ashish Joseph 
	 * @param criteria
	 * @return count
	 * @throws Exception
	 */
	@Cacheable(value='userTotalCountCache', key='#userCriteria.toString()')
	public int count(UserCriteria userCriteria) throws Exception {
		DetachedCriteria detachedCriteria = getDetachedCriteria(userCriteria);
		if(detachedCriteria)
			return detachedCriteria.count();
		else
			return User.count();
	}
	
	def list(UserSearch userSearch) {
		def userCriteria = User.createCriteria()
		Closure searchCriteria = userSearch.searchCriteria
		searchCriteria.delegate = userCriteria
		def userList = userCriteria.list([max: userSearch.max, offset: userSearch.offset]) {
			projections {
				property('username', 'name')
				property('status', 'status')
				location {
					property('address', 'address')
				}
			}
			searchCriteria()
			setResultTransformer(CriteriaSpecification.PROJECTION)
		}
		return userList;
	}
}
