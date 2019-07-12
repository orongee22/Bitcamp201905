package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;

public class DeleteMessageService {
	
	// 싱글톤 처리
	private DeleteMessageService() {}
	private static DeleteMessageService service = new DeleteMessageService();	
	public static DeleteMessageService getInstance(){
		return service;
	}
	// 싱글톤 처리 끝
	
	
	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException{
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			
			
			
			// 1. 전달받은 게시물 아이디로 게시물을 확인함 : Message Dao 필요
			MessageDao dao = MessageDao.getInstance();
			
			Message message = dao.select(conn, messageId);
			
			// 2. 게시물이 존재하지 않으면 예외 처리
			if(message == null) {
				// 직접 만든 예외상황 이걸 throw를 통해 예외 처리해줌
				// MessageNot웅앵 예외 클래스를 만들고 상속한 Exception의 메소드를 통해 예외를 던져줌
				// 자세한 건 그냥 예외 챕터 다시 보는 걸로 ^ㅁ^~
				throw new MessageNotFoundException("메시지가 존재하지 않습니다. : "+messageId);
			}
				// 게시물이 존재? 비밀번호 확인 -> 사용자가 입력한 비밀번호와 비교
			// 3. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린 경우 예외처리
			if(!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다. : ");
			}
			
			if(!message.matchPassword(password)) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다. : ");
			}
			
			// 4. 비밀번호가 일치하면 정상 처리 commit
			resultCnt = dao.deleteMessage(conn, messageId);
			
			
			
			// 위에서 입력이 모두 되어야만 commit처리를 한다.
			// 만약 중간에 오류가 생긴다면 catch 예외 로 넘어가 rollback처리 해줘야함.
			// 정상 처리
			conn.commit();
		} catch (SQLException e) {
			// .rollback() : conn이 null값이 아니라면 rollback처리 할거임.
			// null값이 들어간다면 굳이 rollback할 거리도 없기 때문에 안해도됨 null예외 웅앵으로 넘어갈것임
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (MessageNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (InvalidMessagePasswordException e) {
			e.printStackTrace();
			throw e;
		}
		
		return resultCnt;
		
	}
}
