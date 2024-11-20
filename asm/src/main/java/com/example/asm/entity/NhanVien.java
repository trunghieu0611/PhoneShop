package com.example.asm.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "nhanvien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "tennv")
    private String tenNV;
    @Column(name = "manv")
    private String maNV;
    @Column(name = "tendangnhap")
    private String tenDangNhap;
    @Column(name = "matkhau")
    private String matKhau;
    @Column(name = "trangthai")
    private Boolean trangThai;
}
