package com.example.asm.controller;

import com.example.asm.entity.KhachHang;
import com.example.asm.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/assignment")
public class KhachHangController {
    @Autowired
    KhachHangRepository khachHangRepository;
    @GetMapping("/khachhang")
    public String khachHang(Model model){
        model.addAttribute("ds",khachHangRepository.findAll());
        return "khachhang/khachhang";
    }
    @PostMapping("/khachhang")
    public String addKhachHang(KhachHang khachHang){
        khachHangRepository.save(khachHang);
        return "redirect:khachhang";
    }
    @GetMapping("khachhang/delete/{id}")
    public String deleteKH(@PathVariable("id") Integer id){
        khachHangRepository.deleteById(id);
        return "redirect:/assignment/khachhang";
    }
    @GetMapping("/khachhang/update/{id}")
    public String formUpdate(Model model, @PathVariable("id") Integer id){
        model.addAttribute("kh",khachHangRepository.findById(id).get());
        return "khachhang/updateKH";
    }

    @PostMapping("/khachhang/update")
    public String updateKhachHang(KhachHang kh){
        khachHangRepository.save(kh);
        return "redirect:/assignment/khachhang";
    }
}
