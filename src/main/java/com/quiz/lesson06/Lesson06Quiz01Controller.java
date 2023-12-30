package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.domain.Bookmark;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {

	@Autowired
	private BookmarkBO bookmarkBO;
	
	// http://localhost/lesson06/quiz01/add-bookmark-view
	@GetMapping("/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
	}
	
	@PostMapping("/add-bookmark")
	@ResponseBody
	public String addBookmark(
			@RequestParam("name") String name
			, @RequestParam("url") String url) {
		
		// insert
		bookmarkBO.addBookmart(name, url);
		
		return "성공";
	}
	
	// http://localhost/lesson06/quiz01/after-add-bookmark-view
	@GetMapping("/after-add-bookmark-view")
	public String afterAddBookmarkView(Model model) {
		// select
		List<Bookmark> bookmarkList = bookmarkBO.getBookmarkList();
		
		// model
		model.addAttribute("bookmarkList", bookmarkList);
		
		// veiw
		return "lesson06/afterAddBookmark";
	}

}
