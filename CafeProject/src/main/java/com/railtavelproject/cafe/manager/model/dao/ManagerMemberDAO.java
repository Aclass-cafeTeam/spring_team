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
   
}