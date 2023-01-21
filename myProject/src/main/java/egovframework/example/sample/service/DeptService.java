package egovframework.example.sample.service;

import java.util.List;


public interface DeptService {
	public String InsertDept (DeptVo vo) throws Exception;
	public List<?> SelectDeptList(DeptVo vo) throws Exception;
	public DeptVo selectDeptDetail(int deptno) throws Exception;
	public int deleteDept(int deptno) throws Exception;
	public int updateDept(DeptVo vo) throws Exception; 
}


