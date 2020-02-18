package com.zeroPoint.test;

import org.junit.Test;

import com.zeroPoint.util.MD5Util;

public class MD5Test {
	@Test
	public void test() {
		String password = "123456";
		String passEnString = MD5Util.MD5Encode(password, "utf8");
		System.out.println(passEnString);
	}
}
