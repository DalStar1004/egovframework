package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO{

	public String insertNBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("boardDAO.insertNBoard",vo);
	}

	public List<?> selectNBoardList(BoardVO vo) {
		// TODO Auto-generated method stub
		return list("boardDAO.selectNBoardList",vo);
	}

	public int selectNBoardTotal(BoardVO vo) {
		// TODO Auto-generated method stub
		return (int) select("boardDAO.selectNBoardTotal",vo);
	}

	
}
