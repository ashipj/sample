package com.sample

class Location {
	String address;
	
    static constraints = {
		address(blank:false, nullable:false)
    }
}
