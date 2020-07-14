package member.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class MemberRegServiceImpl implements Service {

	MemberDao dao;
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {

	// 파일 업로드 - 사진 ( 특정 위치에 저장 )
	// 사용자 데이터를 받기 - uid, upw, uname, uphoto


		int resultCnt = 0;

		// 데이터 베이스에 입력 할 데이터 변수 - 사용자에게 받아 온 데이터
		String uid = null;
		String upw = null;
		String uname = null;
		String uphoto = null;

		Connection conn = null;
		
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (isMultipart) {

			try {

				DiskFileItemFactory factory = new DiskFileItemFactory(); // input으로 들어오는 파라미터 값들을 저장하는 공강
				ServletFileUpload upload = new ServletFileUpload(factory);

				List<FileItem> items = upload.parseRequest(request); // 파라미터 값을 분리

				Iterator<FileItem> ite = items.iterator();

				while (ite.hasNext()) {

					FileItem item = ite.next();

					// isFormField() : text value를 가지는 input 확인
					if (item.isFormField()) { // type=file 이외의 input
						// 파라미터 이름
						String paramName = item.getFieldName();
						// 파라미터의 값
						String paramValue = item.getString("utf-8");

						// System.out.println(paramName + " = " + paramValue);
						if (paramName.equals("uid")) {
							uid = paramValue;
						} else if (paramName.equals("upw")) {
							upw = paramValue;
						} else if (paramName.equals("uname")) {
							uname = paramValue;
						}

					} else { // type=file

						// 서버 내부의 경로
						String uri = "/upload/user";

						// String uri =
						// request.getSession().getServletContext().getInitParameter("uploadPath");

						// 시스템의 실제 (절대) 경로 - context 객체
						String realPath = request.getSession().getServletContext().getRealPath(uri);
						// System.out.println(realPath);

						String newFileName = System.currentTimeMillis() + "_" + item.getName();

						// 서버의 저장소에 실제 저장
						File saveFile = new File(realPath, newFileName);
						item.write(saveFile);
						System.out.println("저장완료");
						uphoto = uri + "/" + newFileName; // 경로와 파일 이름 으로 데이터 베이스에 저장함

					}

				}

				// 데이터 베이스에 저장
				Member member= new Member();
				member.setUid(uid);
				member.setUpw(upw);
				member.setUname(uname);
				member.setUphoto(uphoto);
					
				
				conn = ConnectionProvider.getConnection();

				dao = MemberDao.getInstance();

				resultCnt = dao.insertReport(conn, member);

				request.setAttribute("member", member);

			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

		}

		return resultCnt;

	}

}
