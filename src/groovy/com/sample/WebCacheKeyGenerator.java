package com.sample;

import java.lang.reflect.Method;

public class WebCacheKeyGenerator extends org.springframework.cache.interceptor.DefaultKeyGenerator {

	@Override
	public Object generate(Object target, Method method, Object... params) {
		if (params.length == 1) {
			System.out.println("generated key"+(params[0] == null ? 53 : params[0].hashCode()));
			return (params[0] == null ? 53 : params[0].hashCode());
			}
			if (params.length == 0) {
			return 0;
			}
			int hashCode = 17;
			for (Object object : params) {
			hashCode = 31 * hashCode + (object == null ? 53 : object.hashCode());
			}
			return hashCode;
	}

}
