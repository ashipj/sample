package com.sample;

/**
* http://www.intelligrape.com/blog/2011/07/01/grails-data-binding-criteria-reuse/
*/

import com.sample.common.Search;

public class UserSearch extends Search {
	String username;
	List<Integer> status;

	def searchCriteria = {
		if (username) {
			ilike("username", "%${username}%")
		}
		if (status) {
			inList("status", status)
		}
		super.searchCriteria
	}
}
