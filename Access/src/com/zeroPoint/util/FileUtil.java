package com.zeroPoint.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;

import cn.itcast.commons.CommonUtils;

public class FileUtil {
	public static File createFile(FileItem upload, String path, String id) {
		String fileName = upload.getName();
		int index = fileName.lastIndexOf(".");
		fileName = fileName.substring(index, fileName.length());
		//System.out.println("fileName:" + path + id + "_" + fileName);
		return new File(path + id + "_" + CommonUtils.uuid()+fileName);
		
	}
	
	public static void saveFile(FileItem upload, File file) {
		try {
			if(!file.exists()) file.createNewFile();
			InputStream input = upload.getInputStream();
			byte[] filByte = new byte[(int)upload.getSize()];
			input.read(filByte);
			input.close();
			FileUtils.writeByteArrayToFile(file, filByte);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
