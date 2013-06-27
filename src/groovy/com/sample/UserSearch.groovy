package com.sample;

/**
* http://www.intelligrape.com/blog/2011/07/01/grails-data-binding-criteria-reuse/
*/

import com.sample.common.Search;

public class UserSearch extends Search {
	String username;
	String address;
	List<Integer> status;

	def searchCriteria = {
		if (username) {
			ilike("username", "%${username}%")
		}
		if (status) {
			inList("status", status)
		}
		if(address) {
			location {
				ilike("address", "%${address}%")
			}
		}
		super.searchCriteria
	}
}
