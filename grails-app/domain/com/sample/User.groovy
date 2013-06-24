package com.sample

import com.sample.constant.StandardStatusEnum;
import java.util.Date;

class User {
	String username;
	String password;
	Location location;
	
	int status = StandardStatusEnum.ENABLED.getValue();
	Date dateCreated;
	Date lastUpdated;
	
	static hasMany = [wishList: Classified]
	
	static constraints = {
		username(nullable:false, blank:false, size:2..16 );
		password(nullable:false, blank:false, size:6..16 );
		location(nullable:true);
	}
}
