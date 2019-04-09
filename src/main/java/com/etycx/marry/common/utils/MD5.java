package com.etycx.marry.common.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Author DongDeLei
 * @Description:
 * @Date: Created in 下午2:46 2018/9/25
 * @Modified By:
 **/
public class MD5 {
    /**
     * СдMD5
     * @param inStr
     * @return
     */
    public static String ToMD5OnL(String inStr) {
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }
        char[] charArray = inStr.toCharArray();
        byte[] byteArray = new byte[charArray.length];

        for (int i = 0; i < charArray.length; i++){
            byteArray[i] = (byte) charArray[i];
        }

        byte[] md5Bytes = md5.digest(byteArray);

        StringBuffer hexValue = new StringBuffer();

        for (int i = 0; i < md5Bytes.length; i++) {
            int val = ((int) md5Bytes[i]) & 0xff;
            if (val < 16){
                hexValue.append("0");
            }
            hexValue.append(Integer.toHexString(val));
        }

        return hexValue.toString();
    }

    /**
     * ��дMD5
     * @param inStr
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     */
    public static String ToMD5OnU(String inStr){

        StringBuffer hexString = null;
        byte[] defaultBytes = inStr.getBytes();
        try {
            MessageDigest algorithm = MessageDigest.getInstance("MD5");
            algorithm.reset();
            algorithm.update(defaultBytes);
            byte messageDigest[] = algorithm.digest();

            hexString = new StringBuffer();
            for (int i = 0; i < messageDigest.length; i++) {
                if (Integer.toHexString(0xFF & messageDigest[i]).length() == 1) {
                    hexString.append(0);
                }
                hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
            }
            messageDigest.toString();

            inStr = hexString + "";
        } catch (NoSuchAlgorithmException nsae) {

        }

        return hexString.toString().toUpperCase();

    }

    public static void main(String[] args) {
        System.out.println(MD5.ToMD5OnL("123123"));
    }
}
