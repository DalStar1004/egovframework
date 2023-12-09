package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

// 컨트롤러와 연결되는 설정
@Service("boardService") 
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDAO")
	public BoardDAO boardDAO;
	
	@Override
	public String insertNBoard(BoardVO vo) throws Exception {		
		return boardDAO.insertNBoard(vo);
	}

	@Override
	public List<?> selectNBoardList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardList(vo);
	}

	@Override
	public int selectNBoardTotal(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardTotal(vo);
	}

	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateNBoardHits(int unq) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.updateNBoardHits(unq);
	}

	@Override
	public int updateNBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.updateNBoard(vo);
	}

	@Override
	public int deleteNBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.deleteNBoard(vo);
	}

	@Override
	public int selectNBoardPass(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardPass(vo);
	}

}
