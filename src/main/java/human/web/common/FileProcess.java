package human.web.common;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import human.web.dto.BoardDTO;

import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;

public class FileProcess {

    //MultipartRequest 객체 생성하기
    private MultipartRequest getMultipartRequest(ServletContext application,
            HttpServletRequest request) {
        String uploadPath = application.getRealPath("/upload");//업로드된 파일을 저장할 디렉터리
        int maxFileSize = 1024*1024*5; // 업로드 파일의 최대 크기(5 MB)
        String encoding = "UTF-8"; //업로드 파일의 인코딩

        MultipartRequest mRequest = null;

        try {
            mRequest = new MultipartRequest(request, uploadPath, maxFileSize, encoding);
// 정상적으로 MultipartRequest 객체가 생성되면 지정한 업로드 폴더로 지정한 인코딩으로
// 파일이 저장되고 request 객체가 받은 정보를 MultipartRequest 객체가 저장하게 됨
        } catch (Exception e) {
            System.out.println("MultipartRequest 객체 생성 중 예외 발생");
        }

        return mRequest;
    }

    //파일 업로드와 업데이트에 대한 공통의 처리 메소드
    public BoardDTO fileProcess(ServletContext application, HttpServletRequest request) {
        BoardDTO dto = new BoardDTO();

        //1. MultipartRequest 객체 얻기
        MultipartRequest mRequest = getMultipartRequest(application, request);

        //2. 원본 파일명을 알아내고 날짜정보를 이용해서 uploads 폴더에 저장할 저장 파일명 만들기
        String origin_filename = mRequest.getFilesystemName("uploadFile"); //원본파일명
        String save_filename = null; // 저장파일명

        if(origin_filename != null) { //첨부파일을 업로드한 경우
            //test.test.txt
            String ext = origin_filename.substring(origin_filename.lastIndexOf(".")); // 확장자명
            String now = new SimpleDateFormat("yyyyMMdd-HmsS").format(new Date());
            save_filename = now + ext;

            //3. 원본 파일명을 저장 파일명으로 바꾸기
            String uploadPath = application.getRealPath("/upload");//업로드된 파일을 저장할 디렉터리
            File origin_file = new File(uploadPath + File.separator + origin_filename);
            File saveFile = new File(uploadPath + File.separator + save_filename);
            origin_file.renameTo(saveFile);

            //4. BoardDTO의 필드에 세팅하기(원본파일명, 저장파일명)
            dto.setOrigin_filename(origin_filename);
            dto.setSave_filename(save_filename);
        }
            //5. BoardDTO 의 필드에 세팅하기(회원번호, 작성자, 제목, 내용)
        dto.setM_idx(Integer.parseInt(request.getParameter("m_idx")));
        dto.setWriter(mRequest.getParameter("writer"));
        dto.setTitle(mRequest.getParameter("title"));
        dto.setContent(mRequest.getParameter("content"));

        return dto;
    }
}
