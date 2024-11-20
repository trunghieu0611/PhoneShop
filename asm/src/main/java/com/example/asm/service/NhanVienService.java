package com.example.asm.service;

import com.example.asm.entity.NhanVien;
import com.example.asm.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhanVienService {
    @Autowired
    NhanVienRepository nhanVienRepository;

    public List<NhanVien> getAll() {
        return nhanVienRepository.findAll();
    }

    public void them(NhanVien nhanVien) {
        nhanVienRepository.save(nhanVien);
    }

    public void sua(NhanVien nhanVien) {
        nhanVienRepository.save(nhanVien);
    }

    public void xoa(Integer id) {
        nhanVienRepository.deleteById(id);
    }

    public NhanVien findById(Integer id) {
        return nhanVienRepository.findById(id).get();
    }

    public NhanVien findByTenDangNhap(String tenDangNhap) {
        return nhanVienRepository.findByTenDangNhap(tenDangNhap);
    }
}
