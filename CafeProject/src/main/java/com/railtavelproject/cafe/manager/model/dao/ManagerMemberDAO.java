package com.railtavelproject.cafe.manager.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.railtavelproject.cafe.manager.model.vo.Member;
import com.railtavelproject.cafe.manager.model.vo.Pagination;

@Repository //DB 연결하는 역할 + bean 등록
public class ManagerMemberDAO {
   
   @Autowired //같은 자료형
   private SqlSessionTemplate sqlsession;

   /** 관리자 페이지에서 멤버 카운팅
 * @return
 */
   public int memberCount() {
      int mainMemberCount = sqlsession.selectOne("managerMapper.mainMemberCount");
      return mainMemberCount;
   }

   /** 관리자 페이지에서 전체 게시글 수 카운틴 
 * @return
 */
   public int boardCount() {
      // TODO Auto-generated method stub
      int mainBoardCount = sqlsession.selectOne("managerMapper.mainBoardCount");
      return mainBoardCount;
   }

   public List<Member> selectMemberList(Pagination pagination) {
      //RowBounds 객체 (마이바티스)
      // -여러 행 조회 결과 중 특정 위치부터 지정된 행의 개수만 조회하는 객체
      //                (몇 행을 건너 뛸 것인가????)
            
      int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
            
      RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
                  
      return sqlsession.selectList("managerMapper.selectMemberList",null, rowBounds); //rowBounds는 항상 3번째
                                 //  namespace.id            , 파라미터,   rowBounds
                                 //                          , 파라미터 없을 때 NULL 대입
   }

   /** 조회하기 전 페이징
 * @return
 */
   public int getListCount() {
      return sqlsession.selectOne("managerMapper.memberListCount");
   }

   /** 등급별 멤버조회
 * @param memberLevelNoResult
 * @return
 */
   public int getSortLevelMemberListCount(int memberLevelNoResult) {
      if(memberLevelNoResult == 0) {
         return sqlsession.selectOne("managerMapper.memberListCount");
      }else {
         return sqlsession.selectOne("managerMapper.sortLevelMemberListCount",memberLevelNoResult);
      }
      
   }

	   /** 멤버 조회에서 멤버 한 페이지에 몇명 정렬
	 * @param memberLevelNo
	 * @param pagination
	 * @return
	 */
   public List<Member> selectSortLevelMemberList(int memberLevelNo, Pagination pagination) {
      int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
      
      RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
      if(memberLevelNo == 0) {
         return sqlsession.selectList("managerMapper.selectMemberList",null, rowBounds);
      }else {
         return sqlsession.selectList("managerMapper.sortLevelMemberList",memberLevelNo, rowBounds);
      }
   }

   /** 아이디 별명으로 멤버 검색
 * @param srchOption
 * @param inputMember
 * @param pagination
 * @return
 */
   public List<Member> selectInputMember(int srchOption, String inputMember, Pagination pagination) {
	   //srchOption 0이면 아이디(Email) 1이면 별명(Nick)
	   	Map<String, Object> map = new HashMap<String, Object>();
		map.put("inputMember", inputMember);
		map.put("srchOption", srchOption);
		return sqlsession.selectList("managerMapper.selectInputMember",map);
		/*
		 * if(srchOption == 0) { return
		 * sqlsession.selectList("managerMapper.selectInputMemberEmail",inputMember);
		 * }else { return
		 * sqlsession.selectList("managerMapper.selectInputMemberNick",inputMember); }
		 */
   }

    /**게시글 수에 따라 멤버 상세조회 전 페이징 
     * @param memberLevelNoResult
     * @param periodOption
     * @param articleCountInput
     * @param aboveOption
     * @return
     */
    public int getselectDetailBoardCount(int memberLevelNoResult, int periodOption, int articleCountInput,
		int aboveOption) {
    	
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberLevelNo", memberLevelNoResult);
		map.put("articleCountInput", articleCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		return sqlsession.selectOne("managerMapper.getselectDetailBoardCount",map);
		
    	
 	}

	/** 게시글 수에 따라 멤버 상세조회
	 * @param memberLevelNoResult
	 * @param periodOption
	 * @param articleCountInput
	 * @param aboveOption
	 * @param pagination
	 * @return
	 */
	public List<Member> getselectDetailBoard(int memberLevelNoResult, int periodOption, int articleCountInput,
			int aboveOption, Pagination pagination) {
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("memberLevelNo", memberLevelNoResult);
		map.put("articleCountInput", articleCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		
	    return sqlsession.selectList("managerMapper.getselectDetailBoard",map,rowBounds);
	    
		
	}

	/**댓글 상세 조회 전 페이지
	 * @param memberLevelNoResult
	 * @param periodOption
	 * @param commentCountInput
	 * @param aboveOption
	 * @return
	 */
	public int getselectDetailCommentCount(int memberLevelNoResult, int periodOption, int commentCountInput,
			int aboveOption) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberLevelNo", memberLevelNoResult);
		map.put("commentCountInput", commentCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		return sqlsession.selectOne("managerMapper.getselectDetailCommentCount",map);
	}

	/**댓글 수에 따른 멤버 상세 조회
	 * @param memberLevelNoResult
	 * @param periodOption
	 * @param commentCountInput
	 * @param aboveOption
	 * @param pagination
	 * @return
	 */
	public List<Member> getselectDetailComment(int memberLevelNoResult, int periodOption, int commentCountInput,
			int aboveOption, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("memberLevelNo", memberLevelNoResult);
		map.put("commentCountInput", commentCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		
	    return sqlsession.selectList("managerMapper.getselectDetailComment",map,rowBounds);
	}

	/**방문 수에 따른 멤버 상세 조회 페이징
	 * @param memberLevelNoResult
	 * @param periodOption
	 * @param visitCountInput
	 * @param aboveOption
	 * @return
	 */
	public int getselectDetailVisitCount(int memberLevelNoResult, int periodOption, int visitCountInput,
			int aboveOption) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberLevelNo", memberLevelNoResult);
		map.put("visitCountInput", visitCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		return sqlsession.selectOne("managerMapper.getselectDetailVisitCount",map);
	}

	/**방문 수에 따른 멤버 상세 조회
	 * @param memberLevelNoResult
	 * @param periodOption
	 * @param visitCountInput
	 * @param aboveOption
	 * @param pagination
	 * @return
	 */
	public List<Member> getselectDetailVisit(int memberLevelNoResult, int periodOption, int visitCountInput,
			int aboveOption, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("memberLevelNo", memberLevelNoResult);
		map.put("visitCountInput", visitCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		
	    return sqlsession.selectList("managerMapper.getselectDetailVisit",map,rowBounds);
	}
	
	/** 가입일 방문일로 상세조회페이징
	 * @param memberLevelNoResult
	 * @param entryType
	 * @param startDateInput
	 * @param endDateInput
	 * @return
	 */
	public int selectDetailDateCount(int memberLevelNoResult, int entryType, String startDateInput,
			String endDateInput) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberLevelNo", memberLevelNoResult); //멤버등급
		map.put("startDateInput", startDateInput); // 시작기간 
		map.put("endDateInput", endDateInput); //마지막기간
		map.put("entryType", entryType); //가입 0 최종방문 1 
		return sqlsession.selectOne("managerMapper.selectDetailDateCount",map);
	}

	/** 가입일 방문일로 상세조회
	 * @param memberLevelNoResult
	 * @param entryType
	 * @param startDateInput
	 * @param endDateInput
	 * @param pagination
	 * @return
	 */
	public List<Member> selectDetailDate(int memberLevelNoResult, int entryType, String startDateInput,
			String endDateInput, Pagination pagination) {
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("memberLevelNo", memberLevelNoResult);
	    map.put("startDateInput", startDateInput); // 시작기간 
		map.put("endDateInput", endDateInput); //마지막기간
		map.put("entryType", entryType); //가입 0 최종방문 1 
		
	    return sqlsession.selectList("managerMapper.selectDetailDate",map,rowBounds);
	}
	
	/** 활동 정지된 멤버 전체 조회
	 * @return
	 */
	public int stopMemberCount() {
		return sqlsession.selectOne("managerMapper.stopMemberCount");
	}

	/** 활동 정지된 멤버 전체조회 및 회원 아이디로 상세조회 페이지
	 * @param memberEmail
	 * @return
	 */
	public int selectStopMemberListCount(String memberEmail) {
		
		return sqlsession.selectOne("managerMapper.selectStopMemberListCount",memberEmail);
	}

	/**활동 정지된 멤버 전체조회 및 회원 아이디로 상세조회
	 * @param pagination
	 * @param memberEmail 
	 * @return
	 */
	public List<Member> selectStopMemberList(Pagination pagination, String memberEmail) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	
	    return sqlsession.selectList("managerMapper.selectStopMemberList",memberEmail,rowBounds);
	}
   
}