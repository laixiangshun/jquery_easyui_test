package com.java.utils;

import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Tools {

	public static final String PUBLICKEY = "foxconn_CD";

	/**
	 * MD5 32bit 灏忓啓鍔犲瘑
	 * 
	 * @param plainText
	 * @return
	 */

	public static String getMd5(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			// 32浣嶅姞瀵�
			return buf.toString().toLowerCase();
			// 16浣嶇殑鍔犲瘑
			// return buf.toString().substring(8, 24);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}

	}

	public static String resertXSS(String value) {
		// You'll need to remove the spaces from the html entities below
		value = value.replaceAll("&lt;","<").replaceAll("&gt;","<");
		value = value.replaceAll( "&#40;","\\(").replaceAll( "&#41;","\\)");
		value = value.replaceAll("&#39;","'");
		//value = value.replaceAll( "","eval\\((.*)\\)");
		//value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']",
				//"\"\"");
		// value = value.replaceAll("script", "");
		return value;
	}
	
	public static double round(double source, int range) {
		double result = Double.NaN;
		if (range > 0) {
			BigDecimal b = new BigDecimal(source);
			result = b.setScale(range, BigDecimal.ROUND_HALF_UP).doubleValue();
		} else {
			result = Math.round(source);
		}
		return result;
	}

}
