package com.quiz.weather_history;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.weather_history.bo.WeatherHistoryBO;
import com.quiz.weather_history.domain.WeatherHistory;

@RequestMapping("/weather-history")
@Controller
public class WeatherHistoryController {

	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	// http://localhost/weather-history/weather-list-view
	@GetMapping("/weather-list-view")
	public String weatherListView(Model model) {
		// select
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		
		// model
		model.addAttribute("weatherHistoryList", weatherHistoryList);
		
		// view
		return "weather_history/weatherList";
	}
	
	// http://localhost/weather-history/add-weather-view
	@GetMapping("/add-weather-view")
	public String addWeatherView() {
		return "weather_history/addWeather";
	}

	@PostMapping("/add-weather")
	public String addWeather(
			@RequestParam("date") Date date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed) {
		// insert
		weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		// view
		return "redirect:/weather-history/weather-list-view";
	}
	
}
