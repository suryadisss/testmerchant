package org.idx.lms.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadTest {
	private List<MultipartFile> webcam;
	public List<MultipartFile> getWebcam() {
		return webcam;
	}

	public void setWebcam(List<MultipartFile> webcam) {
		this.webcam = webcam;
	}

	private List<MultipartFile> crunchifyFiles;
	 
    public List<MultipartFile> getFiles() {
        return crunchifyFiles;
    }
 
    public void setFiles(List<MultipartFile> files) {
        this.crunchifyFiles = files;
    }
    

}
