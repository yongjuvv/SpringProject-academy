package com.ch.ch09.controller;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ch.ch09.model.Board;
import com.ch.ch09.service.BoardService;
@RestController
public class RestBoardController {
	@Autowired
	private BoardService bs;			
	@RequestMapping("jsonBoard")
	public Collection<Board> jsonBoard(Board board) {
		board.setStartRow(1);
		board.setEndRow(10);
		Collection<Board> list = bs.list(board);
		return list;
	}
	
}