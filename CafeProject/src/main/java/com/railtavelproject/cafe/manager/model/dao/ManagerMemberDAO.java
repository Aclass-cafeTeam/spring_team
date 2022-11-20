package com.railtavelproject.cafe.manager.model.dao;

import java.util.List;

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

   public int memberCount() {
      int mainMemberCount = sqlsession.selectOne("managerMapper.mainMemberCount");
      return mainMemberCount;
   }

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

   public int getListCount() {
      return sqlsession.selectOne("managerMapper.memberListCount");
   }

   public int getSortLevelMemberListCount(int memberLevelNoResult) {
      if(memberLevelNoResult == 0) {
         System.out.println(memberLevelNoResult+"0이다");
         return sqlsession.selectOne("managerMapper.memberListCount");
      }else {
    	  System.out.println(memberLevelNoResult+"0이 아니다");
         return sqlsession.selectOne("managerMapper.sortLevelMemberListCount",memberLevelNoResult);
      }
      
   }

   public List<Member> selectSortLevelMemberList(int memberLevelNo, Pagination pagination) {
      int offset = (pagination.getCurrentPage()-1) * pagination.getLimit(); // 5페이지일때 4*10(10개 정렬) -> 40개의 게시글을 건너뛰어라
      
      RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
      if(memberLevelNo == 0) {
         return sqlsession.selectList("managerMapper.selectMemberList",null, rowBounds);
      }else {
         return sqlsession.selectList("managerMapper.sortLevelMemberList",memberLevelNo, rowBounds);
      }
   }

   public List<Member> selectInputMember(int srchOption, String inputMember, Pagination pagination) {
	   //srchOption 0이면 아이디(Email) 1이면 별명(Nick)
	 
	      if(srchOption == 0) {
	    	  System.out.println(inputMember);
	         return sqlsession.selectList("managerMapper.selectInputMemberEmail",inputMember);
	      }else {
	         return sqlsession.selectList("managerMapper.selectInputMemberNick",inputMember);
	      }
   }

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
   
}