package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVo;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {
	
	public String InsertDept(DeptVo vo) {
		return (String) insert("deptDAO.InsertDept",vo);
	}

	public List<?> SelectDeptList(DeptVo vo) {
		return (List<?>) list("deptDAO.SelectDeptList",vo);
	}	

	public DeptVo selectDeptDetail(int deptno) {
		return (DeptVo) select("deptDAO.selectDeptDetail",deptno);
	}

	public int deleteDept(int deptno) {
		return (int) delete("deptDAO.deleteDept", deptno);
	}

	public int updateDept(DeptVo vo) {
		return (int) update("deptDAO.updateDept",vo);
	}
 
}







































































