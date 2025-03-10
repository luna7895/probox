package com.my.shop.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {

	// 상수 정의 가로,세로
	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;

	// 파일 업로드 매서드 uploadPath: 파일이 저장된 기본 경로, fileName: 원본 파일 이름
	// fileData: 파일의 데이터(byte배열), ymdPath: 날짜별 저장 경로(년/월/일 형태)
	// UUID.randomUUID 파일의 고유한 이름을 생성
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {

		UUID uid = UUID.randomUUID(); // 파일의 고유한 이름을 생성하고
		// 기존 파일명 앞에 붙여서 새파일명을 생성합니다
		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + ymdPath;
		/*
		 * 파일 저장 경로 설정 및 파일 복사 uploadPath: 파일이 저장될 기본 경로 ymdPath: 날짜별 저장 경로(년/월/일 형태)
		 * imgPath는 최종 파일 경로이고 FileCopyUtils.copy()로 전달받은 파일 데이터를 해당 경로에 저장
		 * 
		 */
		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		// 썸내일 생성 : 업로드된 이미지를 기반으로 thumbnailator 라이브러리를 사용해 썸내일을 생성
		String thumbFileName = "s_" + newFileName; // s_ 접두어랑 newFileName(s_1.jpg)을 결합하여 생성
		File image = new File(imgPath + File.separator + newFileName); // 원본 파일에 경로
		// 썸네일을 저장할 경로를 생성
		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);
		// 썸네일을 저장할 폴더[thumbnail.getParentFile()]가 없으면 이를 생성함 imgPath/s/
		if (image.exists()) { // 이미지 파일이 존재하는지 확인
			// 썸네일 디렉토리 생성
			thumbnail.getParentFile().mkdirs();
			// 썸네일 생성
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		return newFileName; // 썸네일을 생성한 후 원본 파일 이름을 반환
	}

	public static String calcPath(String uploadPath) { //이 메서드는 업로드할 파일의 경로를 날짜별로 생성
		//업로드 경로를 연도, 월, 일[캘린더 객체를 사용를 사용하여 연도 월 일 폴더 경로를 생성]의 디렉토리 구조를 따름
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR); //현재 년도를 가져옴
		//File.separator 운영체제에 맞는 파일 경로 구분자 윈도우 \, 유닉스 계열사에서는 / 예) "\2025" "/2025"
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) +1);
		//현재월을 0부터 시작하는 인덱스로 리턴 예를 들어서 1월은 0, 2월은 1, 12월은 11 이기에 +1 이 결과값은 2025/02
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		//위의 3변수의 결론은 "2025/02/11"
		
		makeDir(uploadPath, yearPath, monthPath, datePath); //인수로 전달된 경로에 따라 디렉토리를 생성
		makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String...paths) {
		if (new File(paths[paths.length -1]).exists()) {return;} //경로가 존재하는지 확인
		//경로가 이미 존재하는 경우 이미 존재하는 경우에는 해당 매서드는 아무 작업을 하지 않고 적시 리턴
		for (String path : paths) { //전달된 모든 경로를 반복
			//디렉토리 생성, 현재와 file을 연결하여 생성
			File dirPath = new File(uploadPath + path);
			
			if(!dirPath.exists()) { //디렉토리가 존재하는지 확인
				dirPath.mkdir(); //존재하지 않는다면 디렉토리를 생성
			}
		}
		
	}
}
