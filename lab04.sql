--Bài 1:
--1.
SELECT MaMH, TenMH, Sotiet FROM [dbo].[MonHoc]
GO
--2.
SELECT MaSV, HoSV, TenSV, HocBong FROM [dbo].[SinhVien] ORDER BY MaSV ASC
GO
--3.
SELECT MaSV, TenSV, Phai, NgaySinh FROM  [dbo].[SinhVien] ORDER BY TenSV
GO
--4.
SELECT  CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh,  HocBong FROM [dbo].[SinhVien] ORDER BY NgaySinh ASC, HOCBONG DESC
GO
--5.
SELECT MaMH, TenMH, Sotiet FROM [dbo].[MonHoc]
	WHERE TenMH LIKE 'T%'
--6.
SELECT  CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', Phai, NgaySinh FROM [dbo].[SinhVien]
	WHERE TENSV LIKE N'%i'
--7.
SELECT MaKH, TenKH FROM [dbo].[Khoa]
	WHERE TENKH LIKE '_n%'
--8.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM [dbo].[SinhVien]
	WHERE HoSV LIKE N'%Thị%'
--9.
SELECT MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', Phai ,HocBong FROM  [dbo].[SinhVien] 
	WHERE TENSV LIKE '[a-m]%'
--10.
SELECT MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', Phai ,HocBong FROM  [dbo].[SinhVien] 
	WHERE TENSV LIKE '[a-m]%' ORDER BY 2 ASC
--11.
SELECT  MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, SV.MaKH FROM [dbo].[SinhVien] SV
	JOIN [dbo].[Khoa] KH ON SV.MaKH = KH.MaKH
	WHERE KH.TenKH = N'Anh Văn'
SELECT  MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, MaKH FROM [dbo].[SinhVien]
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH = N'Anh Văn')
--13.
SELECT MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', MaKH, HocBong, DiemTrungBinh FROM SINHVIEN
	WHERE HOCBONG >= 500000
--14.
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, MaKH, HocBong FROM SINHVIEN
	WHERE NgaySinh = '19871220'
--15.
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, NoiSinh, HocBong FROM SINHVIEN
	WHERE NgaySinh >= '19771220' ORDER BY NgaySinh DESC
--16.
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', MaKH, NoiSinh, HocBong FROM SINHVIEN
	WHERE NOISINH LIKE N'Tp. HCM' AND HocBong >= 100000
--17.
SELECT  MaSV, Phai, MaKH FROM [dbo].[SinhVien]
	WHERE MaKH LIKE '%AV%' OR MaKH LIKE '%TR%'
--18.
SELECT MaSV, NoiSinh, NgaySinh, HocBong FROM SinhVien
	WHERE NgaySinh >= '19860101' AND NGAYSINH <= '19920605'
--19.
SELECT MaSV, NgaySinh, Phai, MaKH FROM SinhVien
	WHERE HocBong >= 100000 AND HocBong <= 800000
--20.
SELECT MaMH, TenMH, Sotiet FROM MonHoc
	WHERE Sotiet >= 40 AND Sotiet <= 60
--21.
SELECT  MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên',PHAI FROM SinhVien
	WHERE Phai = 0  AND MaKH LIKE '%AV%'
--22.
SELECT HoSV, TenSV, NoiSinh, NgaySinh FROM SinhVien
	WHERE NgaySinh > '19900101' AND NoiSinh LIKE N'Hà Nội'
--23.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	WHERE Phai = 1 AND TenSV LIKE '%n%'
--24.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	WHERE Phai = 0 AND NgaySinh > '19860530'
--25.
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên',NGAYSINH ,
	CASE PHAI WHEN 0 THEN N'Nam'
			  WHEN 1 THEN N'Nữ'
			  ELSE N'Khác' END AS PHAI
	FROM SinhVien

--26.
SELECT MaSV, (YEAR(GETDATE()) - YEAR(NgaySinh)) AS N'Tuổi', NoiSinh, MaKH
FROM SinhVien
--27.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên', (YEAR(GETDATE()) - YEAR(NgaySinh)) AS N'Tuổi', HocBong
FROM SinhVien
	WHERE N'Tuổi' >= '20'

--28.
SELECT CONCAT(HoSV, ' ', TenSV) AS N'Họ tên', (YEAR(GETDATE()) - YEAR(NgaySinh)) AS TUOI,TenKH
FROM SinhVien,Khoa
	WHERE (YEAR(GETDATE()) - YEAR(NgaySinh)) BETWEEN 20 AND 30
--Bài 2
--1.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',IIF(PHAI=1,N'Nữ',IIF(PHAI = 0,N'Nam',N'Khác')),(YEAR(GETDATE()) - YEAR(NgaySinh)) AS N'Tuổi', MaKH
FROM SinhVien ORDER BY N'Tuổi' DESC

--2.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',Phai, NgaySinh
FROM SinhVien
	WHERE NgaySinh BETWEEN '1994-02-01' AND '1994-02-28'

--3.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	ORDER BY NgaySinh DESC

--5.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên' ,Diem
FROM SinhVien,Ketqua
	ORDER BY 1,2 

--6.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',IIF(PHAI=1,N'Nữ',IIF(PHAI = 0,N'Nam',N'Khác')),TenKH
FROM SinhVien,Khoa
	WHERE TenKH LIKE N'%Anh Văn%'

--7.
SELECT TenKH, CONCAT(HoSV,' ', TenSV) AS N'Họ tên',TenMH,Sotiet,Diem
FROM SinhVien,Khoa,Ketqua,MonHoc
	WHERE TenKH LIKE N'%Tin học%'

--8.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',SV.MaKH, MH.TenMH ,KQ.Diem,
	IIF(KQ.Diem >8,N'Giỏi',IIF(KQ.Diem >6, N'Khá',N'Trung bình')) as LOAI
	 FROM SinhVien SV
	INNER JOIN [dbo].[Ketqua] KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN [dbo].[MonHoc] MH ON KQ.MaMH = MH.MaMH
--BÀI 3
--1.
SELECT MH.MaMH,MH.TenMH,AVG (DIEM) FROM MonHoc MH
	INNER JOIN KETQUA KQ ON MH.MaMH = KQ.MaMH
	GROUP BY MH.MaMH, TenMH
--2.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',COUNT(MaMH) AS TONGMH FROM SinhVien SV
	INNER JOIN [dbo].[Khoa] KH ON SV.MaKH = KH.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	GROUP BY CONCAT(SV.HoSV,' ',SV.TenSV)

--3.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',SUM(DIEM) AS TONGDIEM FROM SinhVien SV
	INNER JOIN [dbo].[Khoa] KH ON SV.MaKH = KH.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	GROUP BY CONCAT(SV.HoSV,' ',SV.TenSV)

--4.
SELECT TenKH,COUNT(MaSV) FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY TenKH

--5.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',MAX(Diem) FROM SinhVien SV
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	GROUP BY CONCAT(SV.HoSV,' ',SV.TenSV)

--6.
SELECT TenMH, MAX(Sotiet) FROM MonHoc
	GROUP BY TenMH
--7.
SELECT K.MaKH,TenKH,MAX(HocBong) FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY K.MaKH, TenKH

--8.
SELECT TenMH,MAX(Diem) AS DIEMCAONHAT FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	GROUP BY TenMH

--9.
SELECT MH.MaMH, TenMH,COUNT(SV.MaSV) AS SOSINHVIEN FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
	GROUP BY MH.MaMH,TenMH

--10.
SELECT TenMH,Sotiet,TenSV,MAX(Diem) FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
	GROUP BY TenMH,Sotiet,TenSV
SELECT TOP 1 * FROM Ketqua ORDER BY Diem DESC

--11.
--SELECT K.MaKH,TenKH,COUNT(MaSV) FROM Khoa K
--	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
--	GROUP BY K.MaKH,TenKH

--12.

--13.

--BÀI 4:SỬ DỤNG THAM SỐ TRONG TRUY VẤN
--1.
DECLARE @MAKH nvarchar(2)
SET @MAKH ='AV'
SELECT MaSV, CONCAT(HoSV,' ',TenSV) AS N'Họ tên',IIF(PHAI=1,N'Nam',N'Nữ') as GIOITINH, TenKH FROM SinhVien
	INNER JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
	WHERE Khoa.MaKH = @MAKH
GO
--2.
DECLARE @DIEM FLOAT
SET @DIEM =3.5
SELECT SV.MaSV, CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',MH.TenMH,KQ.Diem
FROM SinhVien SV
INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
INNER JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
	WHERE TenMH = N'Cơ sở dữ liệu' AND DIEM > @DIEM
GO

--3.
DECLARE @TENMH nvarchar(50)
SET @TENMH =  N'Cơ sở dữ liệu'
SELECT SV.MaSV,KH.TenKH,MH.TenMH,KQ.Diem FROM SinhVien SV
INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
INNER JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
INNER JOIN Khoa KH ON SV.MaKH = KH.MaKH
	WHERE TenMH = @TENMH
GO

--BÀI 5: TRUY VẤN CON
--1.
SELECT MaSV,MaKH, Phai FROM SinhVien
	WHERE MaSV NOT IN (SELECT MaSV FROM Ketqua)

--2.
SELECT MaSV,CONCAT(HoSV,' ',TenSV) AS N'Họ tên',MaKH  FROM SinhVien
	WHERE MaSV NOT IN (SELECT MaSV FROM Ketqua WHERE MaMH IN (SELECT MaMH FROM MonHoc WHERE TenMH =N'Cơ sở dữ liệu' ))
GO


SELECT MaSV,CONCAT(HoSV,' ',TenSV) AS N'Họ tên',MaKH  FROM SinhVien
	WHERE MaSV NOT IN (SELECT MaSV FROM Ketqua KQ
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	WHERE TenMH =N'Cơ sở dữ liệu')

SELECT MaSV FROM Ketqua KQ
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	WHERE TenMH =N'Cơ sở dữ liệu' 	--TÌM KIẾM MÃ SINH VIÊN ĐÃ HỌC MÔN CƠ SỞ DỮ LIỆU

--3.
SELECT MH.MaMH,TenMH,Sotiet FROM MonHoc MH
	WHERE MaMH NOT IN (SELECT MAMH FROM Ketqua)

--4.
SELECT TenKH,MaKH FROM Khoa
	WHERE MaKH NOT IN (SELECT MaKH FROM SinhVien)

--5.


--6.
