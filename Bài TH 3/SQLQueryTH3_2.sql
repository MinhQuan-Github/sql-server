--1
delete from CONGDAN
where ToDanPho = 'To 13'
select * from CONGDAN
--2
update LOAITHUTUC
set ThoiHanTraKetQuaToiDa = '5'
where ThoiHanTraKetQuaToiDa = '2'
select * from LOAITHUTUC
--3
select CONGDAN.*
from CONGDAN
where HoTenCD like 'Ng%g' and len(HoTenCD) <= 50 
--4
select * from YEUCAUTHUTUC
where year(YEUCAUTHUTUC.ThoiDiemTaoYeuCau) = 2016 or 
      year(YEUCAUTHUTUC.ThoiDiemTaoYeuCau) = 2019
--5
select  MaYeuCau, MaCD, NoiDungYeuCau,ThoiDiemTaoYeuCau,
        ThoiDiemHenTraKetQua, TrangThai
from YEUCAUTHUTUC
where TrangThai = 'Da tiep nhan xu ly'
order by MaCD desc , ThoiDiemHenTraKetQua asc
--6
select * from CANBOTIEPNHAN
where CANBOTIEPNHAN.ChucVu = 'Can bo ho tich'
and MaCBTN not in (select MaCBTN from YEUCAUTHUTUC)
--7
select distinct CONGDAN.HoTenCD 
from CONGDAN 
-- hoặc
select CONGDAN.HoTenCD from CONGDAN group by CONGDAN.HoTenCD
--8
select  CONGDAN.MaCD,
        CONGDAN.HoTenCD,
        YEUCAUTHUTUC.MaYeuCau,
        YEUCAUTHUTUC.NoiDungYeuCau,
        YEUCAUTHUTUC.TrangThai
from CONGDAN left join YEUCAUTHUTUC
on CONGDAN.MaCD = YEUCAUTHUTUC.MaCD
--9
select CONGDAN.MaCD,
       CONGDAN.HoTenCD
from CONGDAN
inner join YEUCAUTHUTUC 
on CONGDAN.MaCD = YEUCAUTHUTUC.MaCD
where month(YEUCAUTHUTUC.ThoiDiemTaoYeuCau) <= 6 and 
      year(YEUCAUTHUTUC.ThoiDiemTaoYeuCau) = 2019
group by CONGDAN.MaCD,
         CONGDAN.HoTenCD  
having count(YEUCAUTHUTUC.MaCD) >= 10
--10
select  CONGDAN.MaCD,
        CONGDAN.HoTenCD
from CONGDAN 
inner join YEUCAUTHUTUC
on CONGDAN.MaCD = YEUCAUTHUTUC.MaCD
inner join LOAITHUTUC
on YEUCAUTHUTUC.MaLoaiTT = LOAITHUTUC.MaLoaiTT
where LOAITHUTUC.TenLoaiTT = 'Chung nhan doc than' and 
      LOAITHUTUC.TenLoaiTT <> 'Dang ky ket hon' and 
      month(YEUCAUTHUTUC.ThoiDiemTaoYeuCau) = 10 and 
      year(YEUCAUTHUTUC.ThoiDiemTaoYeuCau) = 2019