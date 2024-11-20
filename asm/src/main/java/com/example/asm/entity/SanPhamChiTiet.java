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
@Table(name = "sanphamchitiet")
public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "maspct")
    private String ma;
    @Column(name = "soluong")
    private Integer soLuong;
    @Column(name = "dongia")
    private Float donGia;
    @Column(name = "hinhanh")
    private String hinhAnh;
    @Column(name = "trangthai")
    private Boolean trangThai;
    @ManyToOne
    @JoinColumn(name = "idkt",referencedColumnName = "id")
    private KichThuoc kichThuoc;
    @ManyToOne
    @JoinColumn(name = "idms",referencedColumnName = "id")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "idsanpham",referencedColumnName = "id")
    private SanPham sanPham;

}
