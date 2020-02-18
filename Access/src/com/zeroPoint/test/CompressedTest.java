package com.zeroPoint.test;

import org.junit.Test;

import com.zeroPoint.service.ProjectService;
import com.zeroPoint.user.domain.Project;
import com.zeroPoint.util.CompressedFileUtil;

public class CompressedTest {
	@Test
	public void test1() {
		 
		try {
			Project pro = new ProjectService().find("6AAE88C20FB747B19370A105E4F9D1AB");
			String path = pro.getVideo();
			CompressedFileUtil.compressedFile(path+"/20162313", path);
			System.out.println("压缩文件已经生成...");
		} catch (Exception e) {
			System.out.println("压缩文件生成失败...");
			e.printStackTrace();
		}
	}
}
