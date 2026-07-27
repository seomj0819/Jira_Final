package com.team.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.SpaceListDto;

@Repository
public class SpaceDaoImpl implements SpaceDao {
	@Autowired
	SqlSession sqlSession;
	
	// 명세 2.1
	// input : space_key, space_title, space_status, image_no
	// output : -
	// space_key, space_title : 유저입력
	// space_status : 공개(Y)/비공개(N)
	// image_no : default 디폴트 스페이스 이미지 번호(1)
	@Override
	public boolean CreateSpace(SpaceListDto spaceDto) {
		boolean isCreated = false;
				
		try {
			sqlSession.insert("com.team.mapper.SpaceMapper.createSpace", spaceDto);
			isCreated = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isCreated;
	}
	
	// 명세 2.2
	// input : space_key, user_no
	// output : -
	// space_key : 지우려는 스페이스키
	// user_no : 현재 유저번호
	// user_role = '관리자' 인 경우만 삭제가능
	@Override
	public boolean DeleteSpaceMemberFirstly(int userNo) {
		boolean isDeleted = false;
		
		try {
			int deletedRowCount = sqlSession.delete("com.team.mapper.SpaceMapper.deleteSpaceMemberFirstly", userNo);
			if(deletedRowCount > 0) {
				isDeleted = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isDeleted;
	}
	@Override
	public boolean DeleteSpace(String spaceKey) {
		boolean isDeleted = false;
		
		try {
			int deletedRowCount = sqlSession.delete("com.team.mapper.SpaceMapper.deleteSpace", spaceKey);
			if(deletedRowCount > 0) {
				isDeleted = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isDeleted;
	}

	// 명세 2.3
	// input : space_key, new_space_title, new_space_key, user_no
	// output : -
	// space_key : 수정하려는 스페이스키
	// new_space_key : 새로운 스페이스키
	// new_space_title : 새로운 스페이스타이틀
	// user_no : 현재 유저번호
	// user_role = '관리자' 인 경우만 수정가능
	// 테이블에 트리거 적용
	@Override
	public boolean UpdateSpace(Map<String, Object> paramMap) {
		boolean isUpdated = false;
		
		try {
			int updatedRowCount = sqlSession.update("com.team.mapper.SpaceMapper.updateSpace", paramMap);
			if(updatedRowCount > 0) {
				isUpdated = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}

	// 명세 2.4
	// input : user_no
	// output : List<SpaceListDto>
	// user_no : 현재 유저번호
	@Override
	public List<SpaceListDto> showSpaceList(int userNo) {
		return sqlSession.selectList("com.team.mapper.SpaceMapper.showSpaceList", userNo);
	}

	// 명세 2.5
	// input : space_key
	// output : SpaceListDto(space_key, space_title, image_no)
	// space_key : 현재 스페이스키
	@Override
	public SpaceListDto showSpaceProfile(String spaceKey) {
		return sqlSession.selectOne("com.team.mapper.SpaceMapper.showSpaceProfile", spaceKey);
	}

}
