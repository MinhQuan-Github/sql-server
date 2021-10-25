--1
delete from KHACHHANG
where TenKhachHang = 'Le Thi A'
--2
update KHACHHANG
set MaKhuVuc = 'KV003'
where MaKhuVuc = 'KV001'
--3
select TenThanhVienGiaoHang
from THANHVIENGIAOHANG
where TenThanhVienGiaoHang LIKE 'Tr%' AND LEN(TenThanhVienGiaoHang) >= 25
--4
select DONHANG_GIAOHANG. *
from DONHANG_GIAOHANG INNER JOIN KHUVUC
ON DONHANG_GIAOHANG.MaKhuVucGiaoHang = KHUVUC.TenKhuVuc
where YEAR(NgayGiaoHang) = '2017' AND TenKhuVuc = 'HaiChau'
--5
select MaDonHangGiaoHang, THANHVIENGIAOHANG.MaThanhVienGiaoHang, TenThanhVienGiaoHang, NgayGiaoHang, PhuongThucThanhToan
from DONHANG_GIAOHANG INNER JOIN THANHVIENGIAOHANG
ON DONHANG_GIAOHANG.MaThanhVienGiaoHang = THANHVIENGIAOHANG.MaThanhVienGiaoHang
where DONHANG_GIAOHANG.TrangThaiGiaoHang = 'Da giao hang'
order by NgayGiaoHang asc , PhuongThucThanhToan desc
--6
select THANHVIENGIAOHANG. *
from THANHVIENGIAOHANG
where GioiTinh = 'Nam' AND MaThanhVienGiaoHang NOT IN (select MaThanhVienGiaoHang from DONHANG_GIAOHANG)
--7
select distinct (TenKhachHang)
from KHACHHANG
-- hoặc
select TenKhachHang
from KHACHHANG
order by TenKhachHang
--8
select KHACHHANG.MaKhachHang, TenKhachHang, DiaChiNhanHang, MaDonHangGiaoHang, PhuongThucThanhToan, TrangThaiGiaoHang
from KHACHHANG inner join DONHANG_GIAOHANG
on KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang
--9
select THANHVIENGIAOHANG.MaThanhVienGiaoHang 
from THANHVIENGIAOHANG 
inner join DONHANG_GIAOHANG
on THANHVIENGIAOHANG.MaThanhVienGiaoHang = DONHANG_GIAOHANG.MaThanhVienGiaoHang
inner join KHUVUC
on DONHANG_GIAOHANG.MaKhuVucGiaoHang = KHUVUC.MaKhuVuc
where THANHVIENGIAOHANG.GioiTinh = 'Nu' AND KHUVUC.TenKhuVuc='Hai Chau'
group by THANHVIENGIAOHANG.MaThanhVienGiaoHang 
having count(DONHANG_GIAOHANG.MaKhachHang) = 10
--10
select KHACHHANG. *
from KHACHHANG 
inner join DONHANG_GIAOHANG
on KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang
inner join KHUVUC
on DONHANG_GIAOHANG.MaKhuVucGiaoHang = KHUVUC.MaKhuVuc
where TenKhuVuc = 'Lien Chieu'
except 
select KHACHHANG. *
from KHACHHANG 
inner join DONHANG_GIAOHANG
on KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang
inner join THANHVIENGIAOHANG
on DONHANG_GIAOHANG.MaThanhVienGiaoHang = THANHVIENGIAOHANG.MaThanhVienGiaoHang
where THANHVIENGIAOHANG.GioiTinh = 'Nam'
