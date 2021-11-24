package com.ch.ch10.service;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.ch10.dao.ReplyBoardDao;
import com.ch.ch10.model.ReplyBoard;
@Service
public class ReplyBoardServiceImpl implements ReplyBoardService {
	@Autowired
	private ReplyBoardDao rbd;
	public Collection<ReplyBoard> list(int bno) {
		return rbd.list(bno);
	}
	public void insert(ReplyBoard rb) {
		rbd.insert(rb);		
	}
	public void update(ReplyBoard rb) {
		rbd.update(rb);
	}
	public void delete(int rno) {
		rbd.delete(rno);
	}
}