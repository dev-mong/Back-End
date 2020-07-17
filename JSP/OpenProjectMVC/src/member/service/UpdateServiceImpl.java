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

public class UpdateServiceImpl implements Service {

	MemberDao dao = null;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		
		// 파일 업로드 - 사진
		// 사용자 데이터를 받기 - uid, upw, uname, uphoto

		int resultCnt = 0;
		
		// 데이터 베이스에 입력할 데이터 변수
		String uid = null;
		String upw = null;
		String uname = null;
		String uphoto = null;
		String photo=null;
		
		Connection conn = null;


		try {
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	
			if (isMultipart) {
	
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
	
				List<FileItem> items = upload.parseRequest(request);
	
				Iterator<FileItem> ite = items.iterator();
	
				while (ite.hasNext()) {
	
					FileItem item = ite.next();
	
					// isFormField() : text value를 가지는 input 확인
					if (item.isFormField()) { // type=file 이외의 input
						// 파라미터 이름
						String paramName = item.getFieldName();
						// 파라미터의 값
						String paramValue = item.getString("utf-8");
						//System.out.println(paramName + " = " + paramValue);
						
						if(paramName.equals("uid")){
							uid = paramValue;
						} else if(paramName.equals("upw")) {
							upw = paramValue;
						} else if(paramName.equals("uname")) {
							uname = paramValue;
						} else if(paramName.equals("photo")) {
							photo=paramValue;
						}
						
					} else { // type=file
						
						if(item.getFieldName().equals("updatePhoto") && item.getSize()>0) {
						String uri = "/upload/user";
	
						//String uri = request.getSession().getServletContext().getInitParameter("uploadPath");
	
						// 시스템의 실제(절대) 경로
						String realPath = request.getSession().getServletContext().getRealPath(uri);
						System.out.println(realPath);
						
						String newFileName = System.nanoTime() + "_" + item.getName();
						
						
						// 서버의 저장소에 실제 저장
						File saveFile = new File(realPath, newFileName);
						item.write(saveFile);
						System.out.println("저장 완료");
						
						uphoto = uri+"/"+newFileName;
						}
						
					}
					
	
				}
			}
					
				if(uphoto != null) {
					
					//이전 파일 경로를 저장 
					File saveFile = new File(request.getSession().getServletContext().getRealPath(photo));
					
					if(saveFile.exists()) { //존재여부 확인
						if(saveFile.delete()) { //기존 파일을 삭제 후 
							System.out.println("새로운 파일이 추가되어 이전파일은 삭제합니다.");
						}
					}
				}else {
					//이전 파일 경로 저장
					uphoto = photo;
					
				}
				
				System.out.println(uphoto);
				// 데이터 베이스 저장 
				Member member = new Member();
				member.setUid(uid);
				member.setUpw(upw);
				member.setUname(uname);
				member.setUphoto(uphoto);
				
				conn = ConnectionProvider.getConnection();
				
				dao = MemberDao.getInstance() ;
				
				resultCnt = dao.updateMember(conn, member);
				
				request.setAttribute("updateMember", member);
				//request.setAttribute("result", resultCnt);
				
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		
		return "/WEB-INF/views/member/update.jsp";
	}

}
