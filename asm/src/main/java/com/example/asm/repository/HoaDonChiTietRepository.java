package com.example.asm.repository;

import com.example.asm.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet,Integer> {
    @Query("SELECT h FROM HoaDonChiTiet h WHERE h.hoaDon.id = :hoaDonId AND h.sanPhamChiTiet.id = :sanPhamId")
    HoaDonChiTiet findByHoaDonIdAndSanPhamChiTietId(@Param("hoaDonId") Integer hoaDonId, @Param("sanPhamId") Integer sanPhamId);

    @Query("SELECT h FROM HoaDonChiTiet h WHERE h.hoaDon.id = :hoaDonId")
    List<HoaDonChiTiet> findByHoaDonId(@Param("hoaDonId") Integer hoaDonId);

}
