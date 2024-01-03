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

	public void addBookmark(String name, String url) {
		bookmarkMapper.insertBookmark(name, url);
	}
	
	public List<Bookmark> getBookmarkList() {
		return bookmarkMapper.selectBookmarkList();
	}
	
	public boolean isDuplicationUrl(String url) {
		// 중복 없음: [], 중복이면 리스트는 채워짐
		List<Bookmark> bookmarkList = bookmarkMapper.selectBookmarkListByUrl(url);
		return bookmarkList.isEmpty() ? false : true;
		// return !bookmarkList.isEmpty();
	}
	
	public int deleteBookmarkById(int id) {
		return bookmarkMapper.deleteBookmarkById(id);
	}

}
