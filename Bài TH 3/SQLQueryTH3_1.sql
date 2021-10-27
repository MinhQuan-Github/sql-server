use ex3

create table CONGDAN 
(
    MaCD nchar(5) primary key,
    HoTenCD nvarchar(30),
    DiaChi nvarchar(30),
    ToDanPho nvarchar(15),
    GioiTinh char(5),
    HoTenChuHo nvarchar(30),
    QuanHeVoiChuHo nvarchar(15)
)

create table LOAITHUTUC
(
    MaLoaiTT nchar(5) primary key,
    TenLoaiTT nvarchar(30),
    ThoiHanTraKetQuaToiDa smallint ,
    MucPhi money
)

create table CANBOTIEPNHAN
(
    MaCBTN nchar(5) primary key,
    HoTenCBTN nchar(7),
    ChucVu nvarchar(30)
)

create table YEUCAUTHUTUC
(
    MaYeuCau nchar(7) primary key,
    MaCD nchar(5),
    NoiDungYeuCau nvarchar(30),
    MaLoaiTT nchar(5),
    ThoiDiemTaoYeuCau date,
    ThoiDiemHenTraKetQua date,
    MaCBTN nchar(5),
    TrangThai nvarchar(30),
    constraint FK_MaCD foreign key (MaCD) references CONGDAN on delete cascade on update cascade,
    constraint FK_MaCBTN foreign key (MaCBTN) references CANBOTIEPNHAN on delete cascade on update cascade,
    constraint FK_MaLoaiTT foreign key (MaLoaiTT) references LOAITHUTUC on delete cascade on update cascade 
)

alter table YEUCAUTHUTUC alter column ThoiDiemTaoYeuCau smalldatetime
alter table YEUCAUTHUTUC alter column ThoiDiemHenTraKetQua smalldatetime

create table GIAYTOKEMTHEO 
(
    MaYeuCau nchar(7) ,
    TenGiayToKemTheo nvarchar(30),
    MoTaGiayToKemTheo nvarchar(50),
    ThoiDiemNhanGTKT smalldatetime,
    constraint PK_MaYeuCau_TenGiayToKemTheo primary key (MaYeuCau, TenGiayToKemTheo)
)

create table GIAYTOCANBOSUNG 
(
    MaYeuCau nchar(7),
    TenGiayToCanBoSung nvarchar(30),
    MoTaGiayToCanBoSung nvarchar(50),
    ThoiHanCuoiCungDeBoSung smalldatetime,
    TinhTrangBoSung nvarchar(30),
    constraint PK_MaYeuCau_TenGiayToCanBoSung primary key (MaYeuCau, TenGiayToCanBoSung)
)

