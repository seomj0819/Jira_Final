package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.SpaceMemberDto;
import com.team.dto.UserInfoDto;

@Repository
public class SpaceMemberDaoImpl implements SpaceMemberDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean isSpaceMemberDuplicate(SpaceMemberDto dto) {
		return sqlSession.selectOne("com.team.mapper.SpaceMemberMapper.isSpaceMemberDuplicate", dto);
	}

	@Override
	public void insertInviteCode(SpaceMemberDto dto) {
		sqlSession.insert("com.team.mapper.SpaceMemberMapper.insertInviteCode", dto);
	}

	@Override
	public int checkInviteCode(SpaceMemberDto dto) {
		return sqlSession.selectOne("com.team.mapper.SpaceMemberMapper.checkInviteCode", dto);
	}

	@Override
	public void updateSpaceMember(SpaceMemberDto dto) {
		sqlSession.update("com.team.mapper.SpaceMemberMapper.updateSpaceMember", dto);
	}

	@Override
	public void deleteSpaceMember(SpaceMemberDto dto) {
		sqlSession.delete("com.team.mapper.SpaceMemberMapper.deleteSpaceMember", dto);
	}

	@Override
	public String searchUserRole(SpaceMemberDto dto) {
		return sqlSession.selectOne("com.team.mapper.SpaceMemberMapper.searchUserRole", dto);
	}

	@Override
	public List<UserInfoDto> getSpaceMembers(int currentUserNo) {
		return sqlSession.selectList("com.team.mapper.SpaceMemberMapper.getSpaceMembers", currentUserNo);
	}

	@Override
	public List<UserInfoDto> getAllSpaceMembers(String spaceKey) {
		return sqlSession.selectList("com.team.mapper.SpaceMemberMapper.getAllSpaceMembers", spaceKey);
	}

}
