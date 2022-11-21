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
         System.out.println(memberLevelNoResult+"0이다");
         return sqlsession.selectOne("managerMapper.memberListCount");
      }else {
    	  System.out.println(memberLevelNoResult+"0이 아니다");
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
	 
	      if(srchOption == 0) {
	    	  System.out.println(inputMember);
	         return sqlsession.selectList("managerMapper.selectInputMemberEmail",inputMember);
	      }else {
	         return sqlsession.selectList("managerMapper.selectInputMemberNick",inputMember);
	      }
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
    	Member memberTemp = new Member();
    	memberTemp.setMemberLevelNo(memberLevelNoResult);
    	memberTemp.setBoardCount(articleCountInput);
    	
    	if(memberLevelNoResult==0) {
    		if(periodOption == 0) {
        		if(aboveOption == 1) {
        			//작성한 게시글 수 이상 일때 전체 멤버
        			System.out.println(memberTemp.getMemberLevelNo()+"엥?");
        	    	System.out.println(memberTemp.getBoardCount());
        			return sqlsession.selectOne("managerMapper.getselectDetailBoardTotalCount0",memberTemp);
        		}else {
        			//작성한 게시글 수 이하 일때 전체 멤버
        			return sqlsession.selectOne("managerMapper.getselectDetailBoardTotalCountDown0",memberTemp);
        		}
    	         
    	    }else {
    	    	if(aboveOption == 1) {
    	    		//작성한 게시글 수 이상 일때 기간 한달 멤버
    	    		return sqlsession.selectOne("managerMapper.getselectDetailBoardCount0",memberTemp);
        		}else {
        			//작성한 게시글 수 이하 일때 기간 한달 멤버
        			return sqlsession.selectOne("managerMapper.getselectDetailBoardCountDown0",memberTemp);
        		}
    	         
    	    }
    	}else {
    		if(periodOption == 0) {
        		if(aboveOption == 1) {
        			//작성한 게시글 수 이상 일때 전체 멤버
        			return sqlsession.selectOne("managerMapper.getselectDetailBoardTotalCount",memberTemp);
        		}else {
        			//작성한 게시글 수 이하 일때 전체 멤버
        			return sqlsession.selectOne("managerMapper.getselectDetailBoardTotalCountDown",memberTemp);
        		}
    	         
    	    }else {
    	    	if(aboveOption == 1) {
    	    		//작성한 게시글 수 이상 일때 기간 한달 멤버
    	    		return sqlsession.selectOne("managerMapper.getselectDetailBoardCount",memberTemp);
        		}else {
        			//작성한 게시글 수 이하 일때 기간 한달 멤버
        			return sqlsession.selectOne("managerMapper.getselectDetailBoardCountDown",memberTemp);
        		}
    	         
    	    }
    	}
    	
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
	    Member memberTemp = new Member();
    	memberTemp.setMemberLevelNo(memberLevelNoResult);
    	memberTemp.setBoardCount(articleCountInput);
    	if(memberLevelNoResult==0) {
    		if(periodOption == 0) {
        		if(aboveOption == 1) {
        			//작성한 게시글 수 이상 일때 전체 멤버
        			return sqlsession.selectList("managerMapper.getselectDetailBoardTotal0",memberTemp,rowBounds);
        		}else {
        			//작성한 게시글 수 이하 일때 전체 멤버
        			return sqlsession.selectList("managerMapper.getselectDetailBoardTotalDown0",memberTemp,rowBounds);
        		}
    	         
    	    }else {
    	    	if(aboveOption == 1) {
    	    		//작성한 게시글 수 이상 일때 기간 한달 멤버
    	    		return sqlsession.selectList("managerMapper.getselectDetailBoard0",memberTemp,rowBounds);
        		}else {
        			//작성한 게시글 수 이하 일때 기간 한달 멤
        			return sqlsession.selectList("managerMapper.getselectDetailBoardDown0",memberTemp,rowBounds);
        		}
    	         
    	    }
    	}else {
    		if(periodOption == 0) {
        		if(aboveOption == 1) {
        			//작성한 게시글 수 이상 일때 멤버---등급레벨도
        			return sqlsession.selectList("managerMapper.getselectDetailBoardTotal",memberTemp,rowBounds);
        		}else {
        			//작성한 게시글 수 이하 일때 멤버---등급레벨도
        			return sqlsession.selectList("managerMapper.getselectDetailBoardTotalDown",memberTemp,rowBounds);
        		}
    	         
    	    }else {
    	    	if(aboveOption == 1) {
    	    		//작성한 게시글 수 이상 일때 기간 한달 멤버---등급레벨도
    	    		return sqlsession.selectList("managerMapper.getselectDetailBoard",memberTemp,rowBounds);
        		}else {
        			//작성한 게시글 수 이하 일때 기간 한달 멤버---등급레벨도
        			return sqlsession.selectList("managerMapper.getselectDetailBoardDown",memberTemp,rowBounds);
        		}
    	         
    	    }
    	}
		
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
		map.put("memberNo", memberLevelNoResult);
		map.put("commentCount", commentCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		
		return sqlsession.selectOne("managerMapper.getselectDetailCommentCount",map);
	}

	public List<Member> getselectDetailComment(int memberLevelNoResult, int periodOption, int commentCountInput,
			int aboveOption, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
	      
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("memberNo", memberLevelNoResult);
		map.put("commentCount", commentCountInput);
		map.put("periodOption", periodOption);
		map.put("aboveOption", aboveOption);
		
	    return sqlsession.selectList("managerMapper.getselectDetailComment",map,rowBounds);
	}
   
}