package egovframework.custom.excel;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;
 
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.core.io.ClassPathResource;
import org.springframework.util.FileCopyUtils;

import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
 
// MakeExcel이라는 클래스를 만들고 그 안에 downliad라는 메소드를 생성한다.
public class MakeExcel {
    public void download(HttpServletRequest request, HttpServletResponse response,
                    Map<String, Object> beanParams, String fileName, String templateFile)
                    throws ParsePropertyException, InvalidFormatException {
 
        // 받아오는 매개변수 bean는 디비에서 뽑아온 데이터
        // fileName 은 다운로드 받을때 지정되는 파일명
        // templateFile 는 템플릿 엑셀 파일명이다.
    	
        // tempPath는 템플릿 엑셀파일이 들어가는 경로를 넣어 준다.
        ///String tempPath = request.getSession().getServletContext().getRealPath("/WEB-INF/excel");
        String tempPath = "C:/eGovFrame-3.6.0/workspace.edu/jhbrake/src/main/webapp/WEB-INF/excel";

        // 데이터 매핑후 생성될 파일 폴더
        ///File destDirPath = new File(request.getSession().getServletContext().getRealPath("/WEB-INF/excel/down_temp"));
        File destDirPath = new File( tempPath+"/down_temp");
        if(!destDirPath.exists()){
        	destDirPath.mkdirs();
        }
        //System.out.println("destDirPath:"+destDirPath);
        
        // 데이터 매핑후 샐성될 파일
        ///String destFilePath = request.getSession().getServletContext().getRealPath("/WEB-INF/excel/down_temp/"+System.currentTimeMillis()+".xlsx");
        String destFilePath = tempPath+"/down_temp/"+System.currentTimeMillis()+".xlsx";
        
        // 별도로 다운로드 만들기 귀찮으까 이런식으로 만들어서 바로 엑셀 생성후 다운 받게 
        try {
            //InputStream is = new BufferedInputStream(new FileInputStream(tempPath + "\\" + templateFile));
  
            XLSTransformer transfoemer = new XLSTransformer();
            transfoemer.transformXLS(tempPath+"/"+templateFile, beanParams, destFilePath);

            // 전자전부 프레임워크를 이용한 다운로드            
            request.setAttribute("downFile", destFilePath);
            request.setAttribute("orgFileName", fileName);
            EgovFileMngUtil.downFile(request, response);
            
            File destIf = new File(destFilePath);
            if(destIf.exists())
            {
            	//destIf.delete(); // 다운로드 후 임시 파일 삭제
            }            
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();            
        }
    }
}