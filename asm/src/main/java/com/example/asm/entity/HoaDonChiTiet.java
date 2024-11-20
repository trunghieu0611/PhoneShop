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
@Table(name = "hoadonchitiet")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "idhd",referencedColumnName = "id")
    private HoaDon hoaDon;
    @ManyToOne
    @JoinColumn(name = "idspct",referencedColumnName = "id")
    private SanPhamChiTiet sanPhamChiTiet;
    @Column(name = "soluong")
    private Integer soLuong;
    @Column(name = "dongia")
    private Float donGia;
    @Column(name = "trangthai")
    private Boolean trangThai;
}
