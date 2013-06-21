package com.sample

class UserCriteria extends User {
	
	int offset = 0;
	int max = 10;
	List<Object> resultList;
	int total;
	
	
	Date createdBefore;
	Date createdAfter;
	


	public UserCriteria() {
		super();
		int status = -1;
	}
		
	public void setMax(int max) {
		this.max = Math.min(max ?: 10, 100)
	}


	@Override
	public String toString() {
		return "UserCriteria [username:${username}, createdBefore:${createdBefore}, createdAfter:${createdAfter}]";
	}
}