package utils;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;


public class Md5 {
	public static String md5(String text, String key) {
		String encodeStr = DigestUtils.md5Hex(text + key);
//		System.out.println(encodeStr);
		return encodeStr;
	}

	@Test
	public void name() {
		System.out.println(md5("123", "xuhui"));
//		MD5¼ÓÃÜºóµÄÃÜÂë£º85a4dbfd06040b1448bf493ec3862985
	}
}
