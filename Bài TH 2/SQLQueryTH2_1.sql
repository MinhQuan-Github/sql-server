use ex2

create table DON_VI_UNG_HO
(
    MaDVUH nchar(5) primary key,
    HoTenNguoiDaiDien nvarchar(30),
    DiaChiNguoiDaiDien nvarchar(50),
    SoDienThoaiLienLac nchar(10),
    SoCMNDNguoiDaiDien nchar(9),
    SoTaiKhoanNganHang nchar(8),
    TenNganHang nvarchar(20),
    ChiNhanhNganHang nvarchar(20),
    TenChuTKNganHang nvarchar(30),
)

go
create table DOT_UNG_HO
(
    MaDotUngHo nchar(5) primary key,
    MaDVUH nchar(5),
    NgayUngHo date,
)

go
create table CHI_TIET_UNG_HO
(
    MaDotUngHo nchar(5),
    MaHinhThucUH nchar(4),
    SoLuongUngHo int,
    DonViTinh nvarchar(10),
    constraint PK_MaDotUngHo_MaHinhThucUH primary key (MaDotUngHo, MaHinhThucUH)
)

go
create table HINH_THUC_UH
(
    MaHinhThucUH nchar(4) primary key,
    TenHinhThucUngHo nvarchar(30)
)

go
create table HO_DAN
(
    MaHoDan nchar(5) primary key,
    HoTenChuHo nvarchar(30),
    ToDanPho smallint,
    KhoiHoacThon smallint ,
    SoDienThoai nchar(10),
    DiaChiNha nvarchar(30),
    SoNhanKhau smallint ,
    DienGiaDinh nvarchar(30),
    LaHoNgheo nvarchar(10)
)

go
create table DOT_NHAN_UNG_HO
(
    MaDotNhanUngHo nchar(9) primary key,
    MaHoDan nchar(5),
    NgayNhanUngHo date
)

go
create table CHI_TIET_NHAN_UNG_HO
(
    MaDotNhanUngHo nchar(9),
    MaHinhThucUH nchar(4),
    SoLuongNhanUngHo int,
    DonViTinh nvarchar(10),
    constraint PK_MaDotNhanUngHo_MaHinhThucUH primary key (MaDotNhanUngHo,MaHinhThucUH)
)

