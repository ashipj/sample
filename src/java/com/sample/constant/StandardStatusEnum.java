package com.sample.constant;

public enum StandardStatusEnum {
	ENABLED(1, "enabled"),
	DISABLED(2, "disabled");
	
	private int value;
	private String name;
	
	private StandardStatusEnum(int value, String name) {
		this.name = name;
		this.value = value;
	}
	
	public int getValue() {
		return this.value;
	}
	public void setValue(int value) {
		this.value = value;
	}

	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
}