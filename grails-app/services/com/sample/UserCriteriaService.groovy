package com.sample

import grails.plugin.cache.Cacheable;

class UserCriteriaService {
	
	/**
	 * 
	 * @author Ashish Joseph
	 * @param criteriaId
	 * @return UserCriteria
	 */
	@Cacheable("getUserCriteriaCache")
    public UserCriteria get(long criteriaId) throws Exception {
		UserCriteria userCriteria = UserCriteria.get(criteriaId);
		// if(!userCriteria)
		return userCriteria;
    }
}
