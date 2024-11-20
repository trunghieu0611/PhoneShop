package com.example.asm.service;

import com.example.asm.entity.HoaDonChiTiet;
import com.example.asm.repository.HoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HDCTService {
    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;
    public List<HoaDonChiTiet> getHDCTChuaTTList(Integer idHD) {
        Boolean trangThai = false;
        List<HoaDonChiTiet> listNew = new ArrayList<>();
        for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietRepository.findAll()) {
            if (hoaDonChiTiet.getTrangThai() == trangThai && hoaDonChiTiet.getHoaDon().getId() == idHD) {
                listNew.add(hoaDonChiTiet);
            }
        }
        return listNew;
    }
}
