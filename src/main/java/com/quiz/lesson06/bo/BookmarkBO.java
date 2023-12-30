package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.domain.Bookmark;
import com.quiz.lesson06.mapper.BookmarkMapper;

@Service
public class BookmarkBO {

	@Autowired
	public BookmarkMapper bookmarkMapper;

	public void addBookmart(String name, String url) {
		bookmarkMapper.insertBookmart(name, url);
	}
	
	public List<Bookmark> getBookmarkList() {
		return bookmarkMapper.selectBookmarkList();
	}

}