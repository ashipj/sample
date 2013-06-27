package com.sample.common;

public class Search {
	Integer max = 10
	Integer offset = 0
	String sort = "id"
	String order = "asc"
	
	List<Object> result;
	Integer total;
	
	public void setMax(Integer max) {
		// TODO : Check for validation and explain the concept
		this.max = max?max:10;
	}
	
	def searchCriteria = {
		order(sort, order)
	}
}
