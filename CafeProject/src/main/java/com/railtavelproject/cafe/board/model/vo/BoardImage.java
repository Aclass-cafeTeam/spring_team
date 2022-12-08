package com.railtavelproject.cafe.board.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardImage {
	private int imageNo;
	private String imagePath;
	private String imageRename;
	private int boardNo;
	
	public BoardImage(String imagePath, String imageRename, int boardNo) {
		super();
		this.imagePath = imagePath;
		this.imageRename = imageRename;
		this.boardNo = boardNo;
	}
	
	
}
