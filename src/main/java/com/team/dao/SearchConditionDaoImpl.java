package com.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.team.dto.SearchConditionAccessDto;
import com.team.dto.SearchConditionDto;
import com.team.dto.SearchCriteriaDto;

@Repository
public class SearchConditionDaoImpl implements SearchConditionDao {
	@Autowired
	SqlSession sqlSession;

	/**
	 * currentUserNo -> owner
	 */
	@Transactional
	@Override
	public void createSearchCondition(SearchConditionDto dto) {
		sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchCondition", dto);
			
		if (dto.getSpaceKeys() != null && !dto.getSpaceKeys().isEmpty()) {
			for (String spaceKey : dto.getSpaceKeys()) {
				Map<String, Object> param = new HashMap<>();
				param.put("searchConditionNo", dto.getSearchConditionNo());
				param.put("spaceKey", spaceKey);
				sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailSpace", param);
			}
		}
		
		if (dto.getWorkerNos() != null && !dto.getWorkerNos().isEmpty()) {
			sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailWorker", dto);
		}
		
		if (dto.getCreatorNos() != null && !dto.getCreatorNos().isEmpty())
			sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailCreator", dto);
		
		if (dto.getPriorities() != null && !dto.getPriorities().isEmpty()) {
			for (String priority : dto.getPriorities()) {
				Map<String, Object> param = new HashMap<>();
				param.put("searchConditionNo", dto.getSearchConditionNo());
				param.put("priority", priority);
				sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailPriority", param);
			}
		}
		
		if (dto.getStatusNos() != null && !dto.getStatusNos().isEmpty()) {
			for (Integer statusNo : dto.getStatusNos()) {
				Map<String, Object> param = new HashMap<>();
				param.put("searchConditionNo", dto.getSearchConditionNo());
				param.put("status", statusNo);
				sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailStatus", param);
			}
		}
		
		if (dto.getDueDates() != null && !dto.getDueDates().isEmpty()) {
			sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailDueDate", dto);
		}
		
		sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionAccess", dto);
	}

	@Override
	public void deleteSearchCondition(SearchConditionAccessDto dto) {
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchCondition", dto);
	}

	@Transactional
	@Override
	public void updateSearchCondition(SearchConditionDto dto) {
		sqlSession.update("com.team.mapper.SearchConditionMapper.updateSearchCondition", dto);
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchConditionDetailSpace", dto);
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchConditionDetailWorker", dto);
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchConditionDetailCreator", dto);
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchConditionDetailPriority", dto);
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchConditionDetailStatus", dto);
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchConditionDetailDueDate", dto);
		if (dto.getSpaceKeys() != null && !dto.getSpaceKeys().isEmpty()) {
			for (String spaceKey : dto.getSpaceKeys()) {
				Map<String, Object> param = new HashMap<>();
				param.put("searchConditionNo", dto.getSearchConditionNo());
				param.put("spaceKey", spaceKey);
				sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailSpace", param);
			}
		}
		
		if (dto.getWorkerNos() != null && !dto.getWorkerNos().isEmpty()) {
			sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailWorker", dto);
		}
		
		if (dto.getCreatorNos() != null && !dto.getCreatorNos().isEmpty())
			sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailCreator", dto);
		
		if (dto.getPriorities() != null && !dto.getPriorities().isEmpty()) {
			for (String priority : dto.getPriorities()) {
				Map<String, Object> param = new HashMap<>();
				param.put("searchConditionNo", dto.getSearchConditionNo());
				param.put("priority", priority);
				sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailPriority", param);
			}
		}
		
		if (dto.getStatusNos() != null && !dto.getStatusNos().isEmpty()) {
			for (Integer statusNo : dto.getStatusNos()) {
				Map<String, Object> param = new HashMap<>();
				param.put("searchConditionNo", dto.getSearchConditionNo());
				param.put("status", statusNo);
				sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailStatus", param);
			}
		}
		
		if (dto.getDueDates() != null && !dto.getDueDates().isEmpty()) {
			sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionDetailDueDate", dto);
		}
	}

	@Override
	public List<SearchConditionDto> showSearchConditoinList(int currentUserNo) {
		return sqlSession.selectList("com.team.mapper.SearchConditionMapper.showSearchConditionList", currentUserNo);
	}

	@Override
	public void favoriteSearchCondition(Map<String, Object> map) {
		sqlSession.update("com.team.mapper.SearchConditionMapper.favoriteSearchCondition", map);
	}

	@Override
	public boolean isFavorite(int searchConditionNo) {
		Boolean favorite = sqlSession.selectOne("com.team.mapper.SearchConditionMapper.isFavorite", searchConditionNo);
		return favorite != null && favorite;
	}

	@Override
	public List<SearchConditionDto> searchCriteriaByOwner(SearchCriteriaDto dto) {
		return sqlSession.selectList("com.team.mapper.SearchConditionMapper.searchCriteriaByOwner", dto);
	}

	@Override
	public List<SearchConditionDto> searchCriteriaBySpace(SearchCriteriaDto dto) {
		return sqlSession.selectList("com.team.mapper.SearchConditionMapper.searchCriteriaBySpace", dto);
	}
	
	@Override
	public List<SearchConditionDto> searchCriteriaByTitle(SearchCriteriaDto dto) {
		return sqlSession.selectList("com.team.mapper.SearchConditionMapper.searchCriteriaByTitle", dto);
	}

	@Override
	public void insertSearchConditionAccess(SearchConditionAccessDto dto) {
		sqlSession.insert("com.team.mapper.SearchConditionMapper.createSearchConditionAccess", dto);
	}
	
	@Override
	public void deleteSearchConditionAccess(SearchConditionAccessDto dto) {
		sqlSession.delete("com.team.mapper.SearchConditionMapper.deleteSearchConditionAccess", dto);
	}

}
