package com.sample

import com.sample.constant.StandardStatusEnum;
import com.sample.User;
import java.util.Date;

class Classified {
	String heading;
	String description;
	int type;
	
	static belongsTo = [owner: User]
	static hasMany = [commentList: Comment]
	
	int status = StandardStatusEnum.ENABLED.getValue();
	Date dateCreated;
	Date lastUpdated;
	
    static constraints = {
		heading(nullable:false, blank:false, size:4..127);
		description(nullable:false, blank:false, size:4..255);
    }
}
