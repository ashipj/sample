package com.sample

import com.sample.constant.StandardStatusEnum;
import com.sample.User;

class Comment {
	String text;
	User creator;
	
	int status = StandardStatusEnum.ENABLED.getValue();
	Date dateCreated;
	Date lastUpdated;
    static constraints = {
		creator(nullable:true)
    }
}
