package com.example.asm.controller;

import com.example.asm.entity.HoaDon;
import com.example.asm.entity.HoaDonChiTiet;
import com.example.asm.entity.KhachHang;
import com.example.asm.entity.SanPhamChiTiet;
import com.example.asm.repository.HoaDonChiTietRepository;
import com.example.asm.repository.HoaDonRepository;
import com.example.asm.repository.KhachHangRepository;
import com.example.asm.repository.SanPhamChiTietRepository;
import com.example.asm.service.HDCTService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession; // Sử dụng jakarta
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/assignment")
public class BanHangController {

    @Autowired
    private HDCTService hdctService;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    // Lấy danh sách khách hàng cho giao diện
    @ModelAttribute("ds")
    public List<KhachHang> getList() {
        return khachHangRepository.findAll();
    }

    // Hiển thị giao diện bán hàng
    @GetMapping("/banhang")
    public String showBH(Model model, HttpSession session, HttpServletRequest req) {
        LocalDate dateNow = LocalDate.now();
        req.getSession().setAttribute("dateNow", dateNow);

        // Thêm danh sách sản phẩm và hóa đơn vào mô hình
        model.addAttribute("listSPCT", sanPhamChiTietRepository.findAll());
        model.addAttribute("listHD", hoaDonRepository.findAll());

        return "banhang"; // Trả về trang bán hàng
    }

    // Tạo mới hóa đơn
    @PostMapping("/banhang/taohoadon")
    public String taoHD(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
        return "redirect:/assignment/banhang";
    }

    // Thêm sản phẩm vào giỏ hàng
    @PostMapping("/banhang/them-san-pham")
    public String themSPGH(HoaDonChiTiet hoaDonChiTiet, RedirectAttributes redirectAttributes) {
        // Lấy hóa đơn ID và sản phẩm chi tiết ID
        Integer hoaDonId = hoaDonChiTiet.getHoaDon().getId();
        Integer sanPhamId = hoaDonChiTiet.getSanPhamChiTiet().getId();

        if (hoaDonId == null || sanPhamId == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không xác định hóa đơn hoặc sản phẩm!");
            return "redirect:/assignment/banhang";
        }

        // Kiểm tra sản phẩm đã có trong giỏ hàng của hóa đơn chưa
        HoaDonChiTiet existingHDCT = hoaDonChiTietRepository.findByHoaDonIdAndSanPhamChiTietId(hoaDonId, sanPhamId);

        if (existingHDCT != null) {
            // Nếu tồn tại, gộp số lượng
            int newQuantity = existingHDCT.getSoLuong() + hoaDonChiTiet.getSoLuong();
            existingHDCT.setSoLuong(newQuantity);
            hoaDonChiTietRepository.save(existingHDCT);
            redirectAttributes.addFlashAttribute("successMessage", "Sản phẩm đã được cập nhật số lượng trong giỏ hàng!");
        } else {
            // Nếu chưa, thêm sản phẩm mới
            hoaDonChiTietRepository.save(hoaDonChiTiet);
            redirectAttributes.addFlashAttribute("successMessage", "Sản phẩm đã được thêm vào giỏ hàng!");
        }

        return "redirect:/assignment/banhang";
    }

    // Hiển thị giỏ hàng theo hóa đơn ID
    @GetMapping("/banhang/hoa-don/{id}")
    public String gioHang(Model model, @PathVariable(name = "id", required = false) Optional<Integer> id, HttpServletRequest req) {
        model.addAttribute("listHD", hoaDonRepository.findAll());
        model.addAttribute("listSPCT", sanPhamChiTietRepository.findAll());

        if (id.isPresent()) {
            req.getSession().setAttribute("idAn", id.get());

            // Tính tổng tiền
            Float tongTien = 0f;
            List<HoaDonChiTiet> hdct = hoaDonChiTietRepository.findByHoaDonId(id.get());
            for (HoaDonChiTiet donChiTiet : hdct) {
                tongTien += donChiTiet.getDonGia() * donChiTiet.getSoLuong();
            }
            model.addAttribute("tongTien", tongTien);

            req.getSession().setAttribute("hoaDon", hoaDonRepository.findById(id.get()));
            model.addAttribute("hdct", hdctService.getHDCTChuaTTList(id.get()));
        }

        return "banhang";
    }

    // Thanh toán hóa đơn
    @PostMapping("/banhang/thanhtoan/{id}")
    public String thanhToan(HttpServletRequest req, RedirectAttributes redirectAttributes) {
        Integer hoaDonId = (Integer) req.getSession().getAttribute("idAn");
        if (hoaDonId != null) {
            Optional<HoaDon> hoaDonOpt = hoaDonRepository.findById(hoaDonId);
            if (hoaDonOpt.isPresent()) {
                HoaDon hoaDon = hoaDonOpt.get();
                hoaDon.setTrangThai(true); // Trạng thái 1: Đã thanh toán
                hoaDonRepository.save(hoaDon);
                redirectAttributes.addFlashAttribute("successMessage", "Hóa đơn đã được thanh toán!");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Hóa đơn không tồn tại!");
            }
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy hóa đơn để thanh toán!");
        }

        return "redirect:/assignment/banhang";
    }
}
