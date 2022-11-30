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

	/** 강제 탈퇴 멤버 조회 페이징
	 * @param memberEmail
	 * @return
	 */
	public int selectforcedSecessionMemberListCount(String memberEmail) {
		
		return sqlsession.selectOne("managerMapper.selectforcedSecessionMemberListCount",memberEmail);
	}

	/** 강제 탈퇴 멤버 조회 페이징
	 * @param pagination
	 * @param memberEmail
	 * @return
	 */
	public List<Member> forcedSecessionMemberList(Pagination pagination, String memberEmail) {
	
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	
	    return sqlsession.selectList("managerMapper.forcedSecessionMemberList",memberEmail,rowBounds);
	}

	/** 강제탈퇴 멤버 수
	 * @return
	 */
	public int forcedSecessionMemberCount() {
		
		return sqlsession.selectOne("managerMapper.forcedSecessionMemberCount");
	}

	/** 멤버 등급 변경
	 * @param memberEmail
	 * @param memberLevelNo
	 * @return
	 */
	public int updateMemberLevelNo(List<String> memberEmail, int memberLevelNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail",memberEmail);
		map.put("memberLevelNo",memberLevelNo);		
		sqlsession.update("managerMapper.updateMemberLevelNo", map);
		int result = (int)map.get("memberCount");
		return result;
	}

	/** 회원 활동정지
	 * @param memberEmail
	 * @param comment
	 * @param HmemberNo 
	 * @return
	 */
	public int updateActivityStopMember(List<String> memberEmail, String comment, int HmemberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail",memberEmail); //활동정지 당한 회원 이메일들 (회원 다수일수도 있음)
		map.put("comment",comment);	 //활동 정지 사유 
		map.put("HmemberNo",HmemberNo);	//활동정지 시킨 매니저 번호 
		
		int insertresult = sqlsession.insert("managerMapper.insertActivityStopMember", map);  //활동 정지 테이블에 삽입
		int updateresult = sqlsession.update("managerMapper.updateActivityStopMember", memberEmail); //회원(멤버) 테이블에서 회원 활동여부를 활동 정지로 변경해줘야함
	
		// 삽입이랑 업테이트 결과 수가 맞는 지 1차 확인을 dao에서 해주고 아니면 result 0  맞으면 result 원래 수
		int result;
		if(insertresult == updateresult) {
			result = insertresult;
		}else {
			result = 0;
		}
		// service에서 활동정지 시킨 수랑 result 값이 같으면 최종 commit 아니면 rollback 
		return result;
	}

	/**회원 강제 탈퇴
	 * @param memberEmail
	 * @param comment
	 * @param secessionreason
	 * @param smemberNo
	 * @return
	 */
	public int ManageSecedePopup(List<String> memberEmail, String comment, String secessionreason, int SmemberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail",memberEmail); //강제 탈퇴 당한 회원 이메일들 (회원 다수일수도 있음)
		map.put("comment",comment);	 //강제 탈퇴 사유 
		map.put("SmemberNo",SmemberNo);	//강제 탈퇴 시킨 매니저 번호 
		map.put("secessionreason",secessionreason);	//재 가입 여부 F면 재가입 X / I면 재가입할 수 있음 
		
		int insertresult = sqlsession.insert("managerMapper.insertManageSecedePopup", map);  //강제 탈퇴 테이블에 삽입
		int updateresult = sqlsession.update("managerMapper.updateManageSecedePopup", memberEmail); //회원(멤버) 테이블에서 회원 탈퇴여부를 'Y' 변경해줘야함

		// 삽입이랑 업테이트 결과 수가 맞는 지 1차 확인을 dao에서 해주고 아니면 result 0  맞으면 result 원래 수
		int result;
		if(insertresult == updateresult) {
			result = insertresult;
		}else {
			result = 0;
		}
		// service에서 활동정지 시킨 수랑 result 값이 같으면 최종 commit 아니면 rollback 
		return result;
	}

	/** 활동정지 해제 기능 
	 * @param memberEmail
	 * @return
	 */
	public int updateReleaseStopMember(List<String> memberEmail) {
		// 디비에서 활동정지 테이블에서 컬럼 삭제 DELETE 
        // 멤버 테이블에서 활동 여부 'N'
		
		// 삭제랑 업테이트 결과 수가 맞는 지 1차 확인을 dao에서 해주고 아니면 result 0  맞으면 result 원래 수
		
		int deleteresult = sqlsession.delete("managerMapper.deleteReleaseStopMember", memberEmail);  //활동 정지 해제 멤버 활동 정지 테이블에서 삭제
		int updateresult = sqlsession.update("managerMapper.updateReleaseStopMember", memberEmail); //회원(멤버) 테이블에서 회원 탈퇴여부를 'N' 변경해줘야함


		int result;
		if(deleteresult == updateresult) {
			result = deleteresult;
		}else {
			result = 0;
		}
		// service에서 활동정지 시킨 수랑 result 값이 같으면 최종 commit 아니면 rollback 
		return result;
	}

	/** 강제 탈퇴 관리자 페이지에서 재 가입 신청 불가능하도록 
	 * @param memberEmail
	 * @return
	 */
	public int updateReleaseSecedeMember(List<String> memberEmail) {
		
		return sqlsession.update("managerMapper.updateReleaseSecedeMember", memberEmail);
	}

	/**강제 탈퇴 관리자 페이지에서 재 가입 신청 가능 
	 * @param memberEmail
	 * @return
	 */
	public int updateNotReleaseSecede(List<String> memberEmail) {
	
		return sqlsession.update("managerMapper.updateNotReleaseSecede", memberEmail);
	}
   
}