--1
delete from DON_VI_UNG_HO
where TenNganHang = 'DongA'
--2
update HINH_THUC_UH
set TenHinhThucUngHo = 'Mi an lien'
where TenHinhThucUngHo = 'Mi tom'
select * from HINH_THUC_UH
--3
select HO_DAN.MaHoDan , HO_DAN.HoTenChuHo
from HO_DAN
where HoTenChuHo LIKE 'Ph&' AND len(HoTenChuHo) <= 30
--4
select DOT_NHAN_UNG_HO. *
from DOT_NHAN_UNG_HO
where year(DOT_NHAN_UNG_HO.NgayNhanUngHo) = 2015 and DOT_NHAN_UNG_HO.MaHoDan like '____1'
--5
select  DON_VI_UNG_HO.MaDVUH, 
        DON_VI_UNG_HO.HoTenNguoiDaiDien, 
        DOT_UNG_HO.MaDotUngHo, 
        DOT_UNG_HO.NgayUngHo
from DON_VI_UNG_HO inner join DOT_UNG_HO
on DON_VI_UNG_HO.MaDVUH = DOT_UNG_HO.MaDVUH
where DOT_UNG_HO.NgayUngHo <= '2016-4-30'
order by NgayUngHo desc , HoTenNguoiDaiDien asc 
--6
select distinct  HO_DAN.MaHoDan,
                 HO_DAN.HoTenChuHo
from HO_DAN inner join DOT_NHAN_UNG_HO
on HO_DAN.MaHoDan = DOT_NHAN_UNG_HO.MaHoDan
where HO_DAN.LaHoNgheo = 'Dung'
--7
select distinct HO_DAN.HoTenChuHo
from HO_DAN
-- hoặc 
select HO_DAN.HoTenChuHo
from HO_DAN
group by HoTenChuHo
--8
select  HO_DAN.MaHoDan,
        HO_DAN.HoTenChuHo,
        HO_DAN.ToDanPho,
        HO_DAN.KhoiHoacThon,
        DOT_NHAN_UNG_HO.MaDotNhanUngHo,
        DOT_NHAN_UNG_HO.NgayNhanUngHo,
        CHI_TIET_NHAN_UNG_HO.MaHinhThucUH,
        CHI_TIET_NHAN_UNG_HO.SoLuongNhanUngHo,
        CHI_TIET_NHAN_UNG_HO.DonViTinh
from HO_DAN 
inner join DOT_NHAN_UNG_HO
on HO_DAN.MaHoDan = DOT_NHAN_UNG_HO.MaHoDan
inner join CHI_TIET_NHAN_UNG_HO
on DOT_NHAN_UNG_HO.MaDotNhanUngHo = CHI_TIET_NHAN_UNG_HO.MaDotNhanUngHo
--9
select  DON_VI_UNG_HO.MaDVUH,
        DON_VI_UNG_HO.HoTenNguoiDaiDien
from DON_VI_UNG_HO 
inner join DOT_UNG_HO
on DON_VI_UNG_HO.MaDVUH = DOT_UNG_HO.MaDVUH
inner join CHI_TIET_UNG_HO
on DOT_UNG_HO.MaDotUngHo = CHI_TIET_UNG_HO.MaDotUngHo
inner join HINH_THUC_UH
on CHI_TIET_UNG_HO.MaHinhThucUH = HINH_THUC_UH.MaHinhThucUH
where DON_VI_UNG_HO.TenNganHang = 'DongA' and
      HINH_THUC_UH.TenHinhThucUngHo = 'Mi tom' and
      year(DOT_UNG_HO.NgayUngHo) = 2016 
group by DON_VI_UNG_HO.MaDVUH,
         DON_VI_UNG_HO.HoTenNguoiDaiDien
having count(CHI_TIET_UNG_HO.MaHinhThucUH) >= 1
--10
select distinct HO_DAN. *
from HO_DAN 
inner join DOT_NHAN_UNG_HO
on HO_DAN.MaHoDan = DOT_NHAN_UNG_HO.MaHoDan
inner join CHI_TIET_NHAN_UNG_HO
on DOT_NHAN_UNG_HO.MaDotNhanUngHo = CHI_TIET_NHAN_UNG_HO.MaDotNhanUngHo
inner join CHI_TIET_UNG_HO
on CHI_TIET_NHAN_UNG_HO.MaHinhThucUH = CHI_TIET_UNG_HO.MaHinhThucUH
inner join HINH_THUC_UH
on CHI_TIET_UNG_HO.MaHinhThucUH = HINH_THUC_UH.MaHinhThucUH
where HINH_THUC_UH.TenHinhThucUngHo = 'Mi an lien' and 
      HINH_THUC_UH.TenHinhThucUngHo = 'Gao'
      