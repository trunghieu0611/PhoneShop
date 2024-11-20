package com.example.asm.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "hoadon")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ngaymuahang")
    private LocalDate ngayMuaHang;
    @Column(name = "trangthai")
    private Boolean trangThai;
    @ManyToOne
    @JoinColumn(name = "idnv",referencedColumnName = "id")
    private NhanVien nhanVien;
    @ManyToOne
    @JoinColumn(name = "idkh",referencedColumnName = "id")
    private KhachHang khachHang;
}
