package com.zeroPoint.test;

import java.io.File;

import org.junit.Test;

import com.zeroPoint.service.ProjectService;
import com.zeroPoint.user.domain.Project;
import com.zeroPoint.web.servlet.ProjectServlet;

public class FileTest {
	@Test
	public void test1() {
		String path = "F:/JavaWebSpace/Access/WebRoot/WEB-INF/temp" + "/20162313";
		File file = new File(path);
		if(!file.exists()) file.mkdir();
		System.out.println(file.getAbsolutePath());
	}
	@Test
	public void test2() {
		Project pro = new ProjectService().find("6AAE88C20FB747B19370A105E4F9D1AB");
		String path = new File(pro.getVideo()).getParentFile().getAbsolutePath();
		String filename = path.substring(path.lastIndexOf("\\")+1) + ".zip";
		System.out.println(filename);
	}
	@Test
	public void test3() {
		String path = "F:\\JavaWebSpace\\Access\\WebRoot\\temp\\20162313\\20162313_B284C5D19EE44FE79D780780B8A8A232.mp4";
		File file = new File(path);
		System.out.println(file.getName());
	}
}
