package com.team.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.StatusDto;

@Repository
public class StatusDaoImpl implements StatusDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean CreateStatus(StatusDto statusDto) {
		boolean isCreated = false;

		try {
			int result = sqlSession.insert("com.team.mapper.StatusMapper.createStatus", statusDto);
			
			if (result > 0) {
				isCreated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isCreated;
	}
	
	@Override
	public boolean UpdateStatus(Map<String, Object> paramMap) {
		boolean isUpdated = false;

		try {
			int result = sqlSession.update("com.team.mapper.StatusMapper.updateStatus", paramMap);
			
			if (result > 0) {
				isUpdated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdated;
	}

	@Override
	public boolean ChangeOrderUp(Map<String, Object> paramMap) {
		boolean isChanged = false;
		
		try {
			int count = sqlSession.update("com.team.mapper.StatusMapper.changeOrderUp", paramMap);
			
			if(count > 0) {
				isChanged = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isChanged;
	}

	@Override
	public boolean ChangeOrderDown(Map<String, Object> paramMap) {
		boolean isChanged = false;
		
		try {
			int count = sqlSession.update("com.team.mapper.StatusMapper.changeOrderDown", paramMap);
			
			if(count > 0) {
				isChanged = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isChanged;
	}

	@Override
	public boolean ChangeOrder(Map<String, Object> paramMap) {
		boolean isChanged = false;
		
		try {
			int count = sqlSession.update("com.team.mapper.StatusMapper.changeOrder", paramMap);
			
			if(count > 0) {
				isChanged = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isChanged;
	}
	
	@Override
	public boolean UpdateTaskStatusFirstly(Map<String, Object> paramMap) {
		boolean TaskStatusUpdated = false;

		try {
			int result = sqlSession.update("com.team.mapper.StatusMapper.updateTaskStatusFirstly", paramMap);

			if (result > 0) {
				TaskStatusUpdated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return TaskStatusUpdated;
	}
	
	@Override
	public boolean DownStatusOrderFirstly(int status_no) {
		boolean StatusOrderDowned = false;

		try {
			int result = sqlSession.update("com.team.mapper.StatusMapper.downStatusOrderFirstly", status_no);

			if (result > 0) {
				StatusOrderDowned = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return StatusOrderDowned;
	}
	
	@Override
	public boolean DeleteStatus(int status_no) {
		boolean isDeleted = false;

		try {
			int result = sqlSession.update("com.team.mapper.StatusMapper.deleteStatus", status_no);

			if (result > 0) {
				isDeleted = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDeleted;
	}
	
	// 명세 13.5
	// input : space_key
	// output : StatusDto(status_no, status_title, status_color, color_code),
	// totalCount
	// space_key : 현재 스페이스키
	@Override
	public List<StatusDto> ShowStatus(String space_key) {
		List<StatusDto> list = null;
		
		try {
			list = sqlSession.selectList("com.team.mapper.StatusMapper.showStatus", space_key);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
