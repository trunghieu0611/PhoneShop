package com.example.asm.repository;

import com.example.asm.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien,Integer> {
    NhanVien findByTenDangNhap(String tenDangNhap);
}
