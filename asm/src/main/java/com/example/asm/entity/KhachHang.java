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
@Table(name = "khachhang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ten")
    private String ten;
    @Column(name = "sdt")
    private String sdt;
    @Column(name = "makh")
    private String maKH;
    @Column(name = "trangthai")
    private Boolean trangThai;

}
