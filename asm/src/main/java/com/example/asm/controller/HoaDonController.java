package com.example.asm.controller;

import com.example.asm.repository.HoaDonChiTietRepository;
import com.example.asm.repository.HoaDonRepository;
import com.example.asm.repository.NhanVienRepository;
import com.example.asm.repository.SanPhamChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/assignment")
public class HoaDonController {
    @Autowired
    HoaDonRepository hoaDonRepository;
    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;
    @GetMapping("hoadon")
    public String showHD(Model model){
        model.addAttribute("listHD",hoaDonRepository.findAll());
        model.addAttribute("listHDCT",hoaDonChiTietRepository.findAll());
        return "hoadon";
    }

}
