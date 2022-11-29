package com.railtavelproject.cafe.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardCrudService {

	/** 태그 조회
	 * @return titleTagList
	 */
	List<Map<String, Object>> selectTitleTag();

	
	/** 글양식 조회
	 * @return writingFormType
	 */
	List<Map<String, Object>> selectWritingFormType();

}
