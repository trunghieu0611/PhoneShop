create database asm_sof3021;
go
use asm_sof3021;
go

create table SanPham(
id int identity(1,1) primary key,
maSP varchar(10) not null,
ten varchar(50) not null,
trangThai bit not null
);

create table KhachHang(
id int identity(1,1) primary key,
ten varchar(50) not null,
sdt varchar(50) not null,
maKH varchar(10) not null,
trangThai bit not null
);

create  table NhanVien(
id int identity(1,1) primary key,
tenNV varchar(50) not null,
maNV varchar(10) not null,
tenDangNhap varchar(50) not null,
matKhau varchar(50) not null,
trangThai bit not null
);

create table HoaDon(
id int identity(1,1) primary key,
idNV int references NhanVien(id),
idKH int references KhachHang(id),
ngayMuaHang date not null,
trangThai bit not null
);

create table KichThuoc(
id int identity(1,1) primary key,
ma varchar(10) not null,
ten varchar(10) not null,
trangThai varchar(10) not null
);

create table MauSac(
id int identity(1,1) primary key,
ma varchar(10) not null,
ten varchar(10) not null,
trangThai varchar(10) not null
);

create table SanPhamChiTiet(
id int identity(1,1) primary key,
maSPCT varchar(10) not null,
idKT int references KichThuoc(id),
idMS int references MauSac(id),
idSanPham int references SanPham(id),
soLuong int not null,
donGia float not null,
hinhAnh varchar(100) not null,
trangThai bit not null
);

create table HoaDonChiTiet(
id int identity(1,1) primary key,
idHD int references HoaDon(id),
idSPCT int references SanPhamChiTiet(id),
soLuong int not null,
donGia float not null,
trangThai bit not null
);
-- Insert data into NhanVien
INSERT INTO NhanVien (tenNV,maNV, tenDangNhap, matKhau, trangThai)
VALUES
('Le Trung Hieu','NV001','hieult','123',1),('Ngo Tuan Linh','NV002','linhnt','123',0)
select * from NhanVien where tenDangNhap = 'hieult'
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'NhanVien';

insert into SanPham(maSP,ten,trangThai) 
values('SP001','iPhone 13 promax',1),('SP002','iPhone 14 promax',1),('SP003','iPhone 15 promax',1),('SP004','iPhone 16 promax',1)
insert into KichThuoc(ma,ten,trangThai)
values('KT01','128GB',1),('KT02','256GB',1),('KT03','512GB',1),('KT04','1TB',1)
insert into MauSac(ma,ten,trangThai)
values('MS01','DEN',1),('MS02','TRANG',1),('MS03','HONG',1),('MS04','XANH',1)
insert into SanPhamChiTiet(maSPCT,idKT,idMS,idSanPham,soLuong,donGia,hinhAnh,trangThai)
values
('SPCT01',1,1,1,10,100,'https://cdn.viettelstore.vn/Images/Product/ProductImage/401676858.jpeg',1),
('SPCT02',2,2,2,40,300,'https://raustore.vn/wp-content/uploads/2023/03/220908112351-iphone-14-pro-128gb.jpg',1),
('SPCT03',3,3,3,20,400,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxC9BChHY-gwnps9rR0W3hBhcOJ6hHXLsQMA&s',1),
('SPCT04',4,4,4,100,1000,'https://cdn.xtmobile.vn/vnt_upload/product/09_2024/thumbs/600_16pt_5.jpg',1)

insert into KhachHang(ten,sdt,maKH,trangThai)
values('Linh','0412312832','KH001',1),('Tri','0831741213','KH002',0),('Bien','0831232194','KH003',1),('Duy','0912321531','KH004',0)
