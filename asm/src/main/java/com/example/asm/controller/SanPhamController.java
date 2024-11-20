package com.example.asm.controller;

import com.example.asm.entity.KichThuoc;
import com.example.asm.entity.MauSac;
import com.example.asm.entity.SanPham;
import com.example.asm.entity.SanPhamChiTiet;
import com.example.asm.repository.KichThuocRepository;
import com.example.asm.repository.MauSacRepository;
import com.example.asm.repository.SanPhamChiTietRepository;
import com.example.asm.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/assignment")
public class SanPhamController {
    @Autowired
    SanPhamRepository sanPhamRepository;
    @Autowired
    SanPhamChiTietRepository sanPhamChiTietRepository;
    @Autowired
    KichThuocRepository kichThuocRepository;
    @Autowired
    MauSacRepository mauSacRepository;
    @GetMapping("home")
    public String showHome(Model model){
        model.addAttribute("listSPCT",sanPhamChiTietRepository.findAll());
        return "home";
    }
    @GetMapping("themSP")
    public String showThemSP(Model model){
        model.addAttribute("listSP",sanPhamRepository.findAll());
        model.addAttribute("listSPCT",sanPhamChiTietRepository.findAll());
        model.addAttribute("listMS",mauSacRepository.findAll());
        model.addAttribute("listKT",kichThuocRepository.findAll());
        return "themSP";
    }
    @PostMapping("themSP")
    public String themSanPham(SanPham sanPham){
           sanPhamRepository.save(sanPham);
        return "redirect:/assignment/themSP";
    }

    // Xử lý thêm chi tiết sản phẩm
    @PostMapping("them-sp-chi-tiet")
    public String themSanPhamChiTiet(SanPhamChiTiet sanPhamChiTiet){
        sanPhamChiTietRepository.save(sanPhamChiTiet);
        return "redirect:/assignment/home";
    }
    @GetMapping("/delete-spct/{id}")
    public String delete(@PathVariable("id") Integer id){
       sanPhamChiTietRepository.deleteById(id);
        return "redirect:/assignment/home";
    }
    @GetMapping("them-mau-sac")
    public String mS(Model model){
        model.addAttribute("ds",mauSacRepository.findAll());
        return "mausac";
    }
    @GetMapping("them-kich-thuoc")
    public String kT(Model model){
        model.addAttribute("ds",kichThuocRepository.findAll());
        return "kichthuoc";
    }
    @PostMapping("them-mau-sac")
    public String themMS(MauSac mauSac){
       mauSacRepository.save(mauSac);
        return "redirect:them-mau-sac";
    }
    @PostMapping("them-kich-thuoc")
    public String themKT(KichThuoc kichThuoc){
        kichThuocRepository.save(kichThuoc);
        return "redirect:them-kich-thuoc";
    }
    @GetMapping("sanpham")
    public String getSP(Model model){
        model.addAttribute("listSP",sanPhamRepository.findAll());
        model.addAttribute("listSPCT",sanPhamChiTietRepository.findAll());
        return "sanpham";
    }
    @GetMapping("/update-spct/{id}")
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("sp",sanPhamChiTietRepository.findById(id).get());
        return "updateSP";
    }
    @PostMapping("/updateSP")
    public String updateSanPham(SanPhamChiTiet sanPhamChiTiet) {
        sanPhamChiTietRepository.save(sanPhamChiTiet);
        return "redirect:/assignment/home";
    }
}
