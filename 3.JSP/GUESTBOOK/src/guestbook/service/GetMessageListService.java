package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import guestbook.model.MessageListView;
import jdbc.ConnectionProvider;

public class GetMessageListService {
	// MessageListView를 생성해서 그걸 결과로 반환함.
	
	private GetMessageListService() {}
	
	private static GetMessageListService service = new GetMessageListService();
	
	public static GetMessageListService getInstance() {
		return service;
	}
	
	// 한 페이지당 보여줄 메시지 갯수 3으로 상수 정의
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	public MessageListView getMessageListView(int pageNumber) {
		
		// 현재 페이지 번호 : 
		int currentPageNumber = pageNumber;
		Connection conn;
		
		MessageListView view = null;
		try {
			// connection 객체 생성
			conn = ConnectionProvider.getConnection();
			
			// DAO 객체 생성
			MessageDao dao = MessageDao.getInstance();
			
			// 전체 게시물의 개수 :
			int messageTotalCount = dao.selectCount(conn);
			
			// 게시물 내용 리스트, DB 검색에 사용할 startrow / endrow 가져오기
			List<Message> messageList = null;
				int firstRow = 0;
				int endRow = 0;
				
				if(messageTotalCount>0) {
					// 전체 메시지가 0보다 크다면 현재 페이지가 몇페이지까지 나뉠 건지 계산해야함.
					// 시작과 끝 번호를 구하는 연산
					firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
					endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
					
					messageList = dao.selectList(conn, firstRow, endRow);
				} else {
					currentPageNumber =0;
					// 컬렉션 내장객체/ 리스트가 비어있음을 나타냄.
					messageList = Collections.emptyList();
				}
				
			view = new MessageListView(messageTotalCount, currentPageNumber, messageList,
						MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return view;
	}
}
