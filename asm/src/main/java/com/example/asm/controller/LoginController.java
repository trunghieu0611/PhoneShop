package com.example.asm.controller;

import com.example.asm.entity.NhanVien;
import com.example.asm.repository.NhanVienRepository;
import com.example.asm.service.NhanVienService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/assignment")
public class LoginController {
    @Autowired
    NhanVienRepository nhanVienRepository;
    @Autowired
    NhanVienService nhanVienService;
    @GetMapping("login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String signin(@RequestParam("tenDangNhap") String tenDangNhap,
                         @RequestParam("matKhau") String matKhau,
                         Model model,
                         HttpServletRequest req) {
        // Kiểm tra tên đăng nhập và mật khẩu
        NhanVien nhanVien = nhanVienService.findByTenDangNhap(tenDangNhap);
        if (nhanVien != null && nhanVien.getMatKhau().equals(matKhau)) {
            // Đăng nhập thành công
            req.getSession().setAttribute("username", tenDangNhap);
            req.getSession().setAttribute("idNV", nhanVien.getId());
            return "redirect:/assignment/home";
        } else {
            // Đăng nhập thất bại
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng.");
            return "login";
        }
    }
}
