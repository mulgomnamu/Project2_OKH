package qna;

import java.util.List;

public interface QnaAnswerServiceImpl {

	// qnaanswer
		public List<QnaAnswerDto> getRepBbsList(int seq);
		public boolean writeBbs(QnaAnswerDto bbs);
		
		public boolean repupdate(int seq, String content);
		public boolean repdelete(int seq);
	
}
