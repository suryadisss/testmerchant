package org.idx.lms.libs;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.util.ResourceUtils;

public class FileReader {
	String FILE_NAME;
	public String getFILE_NAME() {
		return FILE_NAME;
	}
	public void setFILE_NAME(String fILE_NAME) {
		FILE_NAME = fILE_NAME;
	}
	public FileReader(String fileName) {
		// TODO Auto-generated constructor stub
		this.setFILE_NAME(fileName);
	}
	public String getFileValue() {
		try {
			File file = ResourceUtils.getFile(this.getFILE_NAME());
			return new String(Files.readAllBytes(file.toPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return e.getMessage();
		}

	}
}
