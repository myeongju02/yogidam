package com.ssafy.trip.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.trip.config.TMapConfig;
import com.ssafy.trip.model.dto.Category;
import com.ssafy.trip.model.service.TourApiService;

import lombok.RequiredArgsConstructor;

//투어 계획 및 관광지 관리 컨트롤러
@Controller
@RequestMapping("/tour")
@RequiredArgsConstructor
public class TourController {
    private final TourApiService tourApiService;
    private final TMapConfig tMapConfig;
    
    @GetMapping("/plan")
    public String showPlanPage(Model model) {
        List<Category> sidoList = tourApiService.getSidoList();
        model.addAttribute("sidoList", sidoList);

        return "tour/plan";
    }
    
    @GetMapping("/map")
    public String showMap(Model model) {
        model.addAttribute("kakaoMapKey", tMapConfig.getKakaoMapApiKey());
        return "tour/map";
    }

  
  //TODO : 삭제
    
    
}