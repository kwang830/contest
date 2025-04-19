package egovframework.com.cmm.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.fdl.cryptography.EgovCryptoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;

@Controller
public class EgovImageProcessController extends HttpServlet {

	private static final long serialVersionUID = -6339945210971171173L;
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovImageProcessController.class);

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;

	@Resource(name = "egovARIACryptoService")
	EgovCryptoService cryptoService;

	public static final String ALGORITHM_KEY = EgovProperties.getProperty("Globals.File.algorithmKey");

	@RequestMapping("/cmm/fms/getImage.do")
	public void getImageInf(SessionVO sessionVO, ModelMap model,
							@RequestParam Map<String, Object> commandMap,
							HttpServletResponse response) throws Exception {

		String param_atchFileId = (String) commandMap.get("atchFileId");
		param_atchFileId = param_atchFileId.replaceAll(" ", "+");

		// 복호화
		byte[] decodedBytes = Base64.getDecoder().decode(param_atchFileId);
		String decodedString = new String(cryptoService.decrypt(decodedBytes, ALGORITHM_KEY));

		// 분리 (ex: "anyPrefix|atchFileId" 형태라면 아래처럼 파싱)
//		String decodedFileId = StringUtils.substringAfter(decodedString, "|");
//		if (StringUtils.isBlank(decodedFileId)) {
//			LOGGER.error("복호화된 파일 ID가 유효하지 않습니다. decodedString: {}", decodedString);
//			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
//			return;
//		}

		LOGGER.debug("decodedString: {}", decodedString);
//		LOGGER.debug("decodedFileId: {}", decodedFileId);

		String fileSn = (String) commandMap.get("fileSn");

		FileVO vo = new FileVO();
		vo.setAtchFileId(decodedString);
		vo.setFileSn(fileSn);

		FileVO fvo = fileService.selectFileInf(vo);
		if (fvo == null) {
			LOGGER.error("파일 정보가 존재하지 않습니다. atchFileId={}, fileSn={}", decodedString, fileSn);
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		String fileStreCours = EgovWebUtil.filePathBlackList(fvo.getFileStreCours());
		String streFileNm = EgovWebUtil.filePathBlackList(fvo.getStreFileNm());

		File file = new File(fileStreCours, streFileNm);
		if (!file.exists()) {
			LOGGER.error("실제 파일이 존재하지 않습니다. 경로: {}", file.getAbsolutePath());
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		try (
				FileInputStream fis = new FileInputStream(file);
				BufferedInputStream in = new BufferedInputStream(fis);
				ByteArrayOutputStream bStream = new ByteArrayOutputStream()
		) {
			int imgByte;
			while ((imgByte = in.read()) != -1) {
				bStream.write(imgByte);
			}

			// Content-Type 설정
			String ext = fvo.getFileExtsn() != null ? fvo.getFileExtsn().toLowerCase() : "";
			String type;
			switch (ext) {
				case "jpg":
				case "jpeg":
					type = "image/jpeg";
					break;
				case "png":
					type = "image/png";
					break;
				case "gif":
					type = "image/gif";
					break;
				case "bmp":
					type = "image/bmp";
					break;
				default:
					type = "application/octet-stream";
			}
			response.setContentType(type);
			response.setContentLength(bStream.size());
			bStream.writeTo(response.getOutputStream());
			response.getOutputStream().flush();

		} catch (IOException e) {
			LOGGER.error("이미지 출력 중 예외 발생", e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}
}
