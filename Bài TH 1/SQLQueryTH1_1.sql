use ex1

create table LOAIMATHANG(
    MaLoaiMatHang nchar(5) primary key,
	TenLoaiMatHang nvarchar(30)
)

create table KHOANGTHOIGIAN
(
	MaKhoangThoiGian nchar(5) primary key,
	MoTa nvarchar(30)
)

create table KHUVUC
(
	MaKhuVuc nchar(5) primary key,
	TenKhuVuc nvarchar(30)
)

create table DICHVU
(
	MaDichVu nchar(5) primary key,
	TenDichVu nvarchar(50)
)

create table KHACHHANG
(
	MaKhachHang nchar(5) primary key,
	MaKhuVuc nchar(5),
	TenKhachHang nvarchar(30),
	TenCuaHang nvarchar(30),
	SoDTKhachHang nchar(10),
	DiaChiEmail nchar(30),
	DiaChiNhanHang nvarchar(50),
	constraint KHACHHANG_FK_MaKhuVuc foreign key (MaKhuVuc) references KHUVUC
)

alter table KHACHHANG 
drop constraint KHACHHANG_FK_MaKhuVuc

alter table KHACHHANG
add constraint KHACHHANG_FK_MaKhuVuc foreign key (MaKhuVuc) references KHUVUC   
on delete cascade on update cascade


create table THANHVIENGIAOHANG
(
	MaThanhVienGiaoHang nchar(6) primary key,
	TenThanhVienGiaoHang nvarchar(30),
	NgaySinh date,
	GioiTinh nchar(10),
	SODTThanhVien nchar(10),
	DiaChiThanhVien nvarchar(50)
)

create table DANGKYGIAOHANG
(
	MaThanhVienGiaoHang nchar(6),
	MaKhoangThoiGianDKGiaoHang nchar(5),
	primary key (MaThanhVienGiaoHang, MaKhoangThoiGianDKGiaoHang),
	constraint DANGKYGIAOHANG_FK_MaKhoangThoiGianDKGiaoHanng foreign key (MaKhoangThoiGianDKGiaoHang) references KHOANGTHOIGIAN(MaKhoangThoiGian),
	constraint DANGKYGIAOHANG_FK_MaThanhVienGiaoHang foreign key (MaThanhVienGiaoHang) references THANHVIENGIAOHANG
)

alter table DANGKYGIAOHANG
drop DANGKYGIAOHANG_FK_MaKhoangThoiGianDKGiaoHanng, DANGKYGIAOHANG_FK_MaThanhVienGiaoHang

alter table DANGKYGIAOHANG
add constraint DANGKYGIAOHANG_FK_MaKhoangThoiGianDKGiaoHanng foreign key (MaKhoangThoiGianDKGiaoHang) references KHOANGTHOIGIAN(MaKhoangThoiGian)
on delete cascade on update cascade,
constraint DANGKYGIAOHANG_FK_MaThanhVienGiaoHang foreign key (MaThanhVienGiaoHang) references THANHVIENGIAOHANG
on delete cascade on update cascade


create table DONHANG_GIAOHANG
(
	MaDonHangGiaoHang nchar(6) primary key,
	MaKhachHang nchar(5),
	MaThanhVienGiaoHang nchar(6),
	MaDichVu nchar(5),
	MaKhuVucGiaoHang nchar(5),
	TenNguoiNgan nvarchar(30),
	DiaChiGiaoHang nvarchar(30),
	SoDTNguoiNhan nchar(10),
	MaKhoangThoiGianGiaoHang nchar(5),
	NgayGiaoHang date,
	PhuongThucThanhToan	nvarchar(20),
	TrangThaiPheDuyet nvarchar(30),
	TrangThaiGiaoHang nvarchar(30),
	constraint DH_GH_FK_MaKhachHang foreign key(MaKhachHang) references KHACHHANG,
	constraint DH_GH_FK_MaThanhVienGiaoHang foreign key(MaThanhVienGiaoHang) references THANHVIENGIAOHANG,
	constraint DH_GH_FK_MaDichVu foreign key(MaDichVu) references DICHVU,
	constraint DH_GH_FK_MaKhuVucGiaoHang foreign key(MaKhuVucGiaoHang) references KHUVUC(MaKhuVuc),
	constraint DH_GH_FK_MaKhoangThoiGianGiaoHang foreign key(MaKhoangThoiGianGiaoHang) references KHOANGTHOIGIAN(MaKhoangThoiGian)
)

alter table DONHANG_GIAOHANG
drop DH_GH_FK_MaKhachHang, DH_GH_FK_MaThanhVienGiaoHang, DH_GH_FK_MaDichVu, DH_GH_FK_MaKhuVucGiaoHang, DH_GH_FK_MaKhoangThoiGianGiaoHang

alter table DONHANG_GIAOHANG
add constraint DH_GH_FK_MaKhachHang foreign key(MaKhachHang) references KHACHHANG on delete cascade on update cascade,
	constraint DH_GH_FK_MaThanhVienGiaoHang foreign key(MaThanhVienGiaoHang) references THANHVIENGIAOHANG on delete cascade on update cascade,
	constraint DH_GH_FK_MaDichVu foreign key(MaDichVu) references DICHVU on delete cascade on update cascade,
	constraint DH_GH_FK_MaKhuVucGiaoHang foreign key(MaKhuVucGiaoHang) references KHUVUC(MaKhuVuc) on delete no action on update no action,
	constraint DH_GH_FK_MaKhoangThoiGianGiaoHang foreign key(MaKhoangThoiGianGiaoHang) references KHOANGTHOIGIAN(MaKhoangThoiGian) on delete cascade on update cascade


create table CHITIET_DONHANG
(
	MaDonHangGiaoHang nchar(6),
	TenSanPhamDuocGiao nvarchar(30),
	SoLuong int,
	TrongLuong decimal(3,2),
	MaLoaiMatHang nchar(5),
	TienThuHo money,
	primary key(MaDonHangGiaoHang, TenSanPhamDuocGiao),
	constraint CT_DH_FK_MaDonHangGiaoHang foreign key(MaDonHangGiaoHang) references DONHANG_GIAOHANG,
	constraint CT_DH_FK_MaLoaiMatHang foreign key(MaLoaiMatHang) references LOAIMATHANG
)

alter table CHITIET_DONHANG
drop CT_DH_FK_MaDonHangGiaoHang, CT_DH_FK_MaLoaiMatHang

alter table CHITIET_DONHANG
add constraint CT_DH_FK_MaDonHangGiaoHang foreign key(MaDonHangGiaoHang) references DONHANG_GIAOHANG on delete cascade on update cascade,
	constraint CT_DH_FK_MaLoaiMatHang foreign key(MaLoaiMatHang) references LOAIMATHANG on delete cascade on update cascade

delete from KHACHHANG
where TenKhachHang = 'Le Thi A'
