CREATE DATABASE QuanLyQuanMiCay
GO

USE QuanLyQuanMiCay
GO

USE master

DROP DATABASE QuanLyQuanMiCay
GO

-- Tạo bảng KhachHang
CREATE TABLE KhachHang(
	MaKH NVARCHAR(20) NOT NULL,
	TenKH NVARCHAR (100) NOT NULL,
	SDT NVARCHAR(15) NOT NULL,
	NgaySinh DATE NOT NULL,
	DiaChi NVARCHAR(255) NOT NULL,
	GioiTinh NVARCHAR(4) NOT NULL,
	CONSTRAINT PK_KhachHang PRIMARY KEY (MaKH),
)

-- Tạo bảng TaiKhoanKhach
CREATE TABLE TaiKhoanKhach(
    MaTaiKhoanKhach NVARCHAR(20) NOT NULL,
	TenTaiKhoanKhach NVARCHAR(20) NOT NULL,
	MatKhauKhach NVARCHAR(15) NOT NULL,
	NgayTao DATETIME NOT NULL,
	MaKH NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_TaiKhoanKhach PRIMARY KEY (MaTaiKhoanKhach)
)

-- Tạo bảng LichDat
CREATE TABLE LichDat(
	MaLichDat NVARCHAR(20) NOT NULL,
	NgayDat DATE NOT NULL,
	GioDat TIME(7) NOT NULL,
	SoBan TINYINT NOT NULL,
	TinhTrang NVARCHAR(11),
	MaKH NVARCHAR(20) NOT NULL,
	MaNV NVARCHAR(20),
	CONSTRAINT PK_LichDat PRIMARY KEY (MaLichDat)
)

-- Tạo bảng PhanHoi
CREATE TABLE PhanHoi(
	MaPhanHoi NVARCHAR(20) NOT NULL,
	NoiDungPhanHoi NVARCHAR(MAX),
	MaKH NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_PhanHoi PRIMARY KEY (MaPhanHoi)
)

-- Tạo bảng NhanVien
CREATE TABLE NhanVien(
	MaNV NVARCHAR(20) NOT NULL,
	TenNV NVARCHAR(100) NOT NULL,
	SDTNV NVARCHAR(15) NOT NULL,
	NgaySinh DATE NOT NULL,
	DiaChi NVARCHAR(255) NOT NULL,
	GioiTinh NVARCHAR(4) NOT NULL,
	CONSTRAINT PK_NhanVien PRIMARY KEY (MaNV)
)

-- Tạo bảng HoaDon
CREATE TABLE HoaDon(
	MaHD NVARCHAR(20) NOT NULL,
	NgayDat DATETIME,
	TongGia DECIMAL(10, 2),
	TinhTrang NVARCHAR(10),
	MaKH NVARCHAR(20) NOT NULL,
	MaNV NVARCHAR(20),
	CONSTRAINT PK_HoaDon PRIMARY KEY (MaHD)
)

-- Tạo bảng LoaiMon
CREATE TABLE LoaiMon(
	MaTheLoai NVARCHAR(20) NOT NULL,
	TenTheLoai NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_LoaiMon PRIMARY KEY (MaTheLoai)
)

-- Tạo bảng Mon
CREATE TABLE Mon(
	MaMon NVARCHAR(20) NOT NULL,
	TenMon NVARCHAR(255) NOT NULL,
	GiaCa DECIMAL(10, 2) NOT NULL,
	AnhMon NVARCHAR(255),
	MaTheLoai NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_Mon PRIMARY KEY (MaMon)
)

-- Tạo bảng Chi tiết hóa đơn
CREATE TABLE CTHD(
	MaHD NVARCHAR(20) NOT NULL,
	MaMon NVARCHAR(20) NOT NULL,
	SoLuongMon INT,
	CONSTRAINT PK_CTHD PRIMARY KEY (MaMon, MaHD)
)

-- Tạo bảng DatVe
--CREATE TABLE DatVe(
--	MaKH NVARCHAR(20) NOT NULL,
--	MaMon NVARCHAR(20) NOT NULL,
--	TinhTrang NVARCHAR(10),
--	CONSTRAINT PK_DatVe PRIMARY KEY (MaKH, MaMon)
--)

-- Tạo bảng NguyenLieu
CREATE TABLE NguyenLieu(
	MaNguyenLieu NVARCHAR(20) NOT NULL,
	TenNguyenLieu NVARCHAR(20) NOT NULL,
	GiaNguyenLieu DECIMAL(10, 2) NOT NULL,
	DonVi NVARCHAR(10) NOT NULL,
	CONSTRAINT PK_NguyenLieu PRIMARY KEY (MaNguyenLieu)
)

-- Tạo bảng NhaCungCap
CREATE TABLE NhaCungCap(
	MaNCC NVARCHAR(20) NOT NULL,
	TenNCC NVARCHAR(20) NOT NULL,
	SDTNCC NVARCHAR(15),
	DiaChiNCC NVARCHAR(255),
	CONSTRAINT PK_NhaCungCap PRIMARY KEY (MaNCC)
)

-- Tạo bảng CungCap
--CREATE TABLE CungCap(
--	MaNguyenLieu NVARCHAR(20) NOT NULL,
--	MaNCC NVARCHAR(20) NOT NULL,
--	SoLuongTungNguyenLieu INT,
--	NgayCungCap DATE,
--	CONSTRAINT PK_CungCap PRIMARY KEY (MaNguyenLieu, MaNCC)
--)

-- Tạo bảng VaiTro
CREATE TABLE VaiTro(
	MaVaiTro NVARCHAR(6) NOT NULL,
	TenVaiTro NVARCHAR(10) NOT NULL,
	CONSTRAINT PK_VaiTro PRIMARY KEY (MaVaiTro)
)

-- Tạo bảng TaiKhoanNhanVien
CREATE TABLE TaiKhoanNhanVien(
	MaTaiKhoanNV NVARCHAR(20) NOT NULL,
	TenTaiKhoanNV NVARCHAR(20) NOT NULL,
	MatKhau NVARCHAR(20) NOT NULL,
	NgayTao DATETIME NOT NULL,
	MaNV NVARCHAR(20) NOT NULL,
	MaVaiTro NVARCHAR(6) NOT NULL,
	CONSTRAINT PK_TaiKhoanNhanVien PRIMARY KEY (MaTaiKhoanNV)
)

-- Tạo khóa ngoại cho bảng TaiKhoanKhach
ALTER TABLE TaiKhoanKhach ADD CONSTRAINT FK_TaiKhoanKhach_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH) ON DELETE CASCADE

-- Tạo khóa ngoại cho bảng LichDat
ALTER TABLE LichDat ADD CONSTRAINT FK_LichDat_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH)

ALTER TABLE LichDat ADD CONSTRAINT FK_LichDat_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNV)

-- Tạo khóa ngoại cho bảng PhanHoi
ALTER TABLE PhanHoi ADD CONSTRAINT FK_PhanHoi_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH)

-- Tạo khóa ngoại cho bảng HoaDon
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH)

ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNV)

-- Tạo khóa ngoại cho bảng Mon
ALTER TABLE Mon ADD CONSTRAINT FK_Mon_LoaiMon FOREIGN KEY (MaTheLoai) REFERENCES LoaiMon (MaTheLoai)

-- Tạo khóa ngoại cho bảng CTHD
ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_Mon FOREIGN KEY (MaMon) REFERENCES Mon (MaMon)

ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_HoaDon FOREIGN KEY (MaHD) REFERENCES HoaDon (MaHD) ON DELETE CASCADE

-- Tạo khóa ngoại cho bảng DatVe
--ALTER TABLE DatVe ADD CONSTRAINT FK_DatVe_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH)

--ALTER TABLE DatVe ADD CONSTRAINT FK_DatVe_Mon FOREIGN KEY (MaMon) REFERENCES Mon (MaMon)

-- Tạo khóa ngoại cho bảng NguyenLieu
--ALTER TABLE NguyenLieu ADD CONSTRAINT FK_NguyenLieu_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNV)

-- Tạo khóa ngoại cho bảng CungCap
--ALTER TABLE CungCap ADD CONSTRAINT FK_CungCap_NguyenLieu FOREIGN KEY (MaNguyenLieu) REFERENCES NguyenLieu (MaNguyenLieu)

--ALTER TABLE CungCap ADD CONSTRAINT FK_CungCap_NhaCungCap FOREIGN KEY (MaNCC) REFERENCES NhaCungCap (MaNCC)

-- Tạo khóa ngoại cho bảng TaiKhoanNhanVien
ALTER TABLE TaiKhoanNhanVien ADD CONSTRAINT FK_TaiKhoanNhanVien_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNV) ON DELETE CASCADE

ALTER TABLE TaiKhoanNhanVien ADD CONSTRAINT FK_TaiKhoanNhanVien_VaiTro FOREIGN KEY (MaVaiTro) REFERENCES VaiTro (MaVaiTro)

--THÊM DỮ LIỆU
--Khách hàng
insert into KhachHang values ('KH01', 'Nguyen Van A', '0234729423','2003-01-12', '37/B TPHCM', 'Nam')
insert into KhachHang values ('KH02', 'Nguyen Van Be', '02344234423','2003-02-27', '379 TPHCM', N'Nữ')

--Tài khoản khách
insert into TaiKhoanKhach values ('TKK1', 'tminh12930', '31jf203', '2023-10-27', 9, 'KH01')
insert into TaiKhoanKhach values ('TKK2', 'gdat2389', 'r892nf', '2023-12-18', 3, 'KH02')

--Lịch đặt 
insert into LichDat values ('LD1', '2023-10-27 19:00', 5, N'Đã duyệt', 'KH01')
insert into LichDat values ('LD2', '2023-09-12 19:00', 7, N'Chưa duyệt', 'KH02')

--Phản hồi
insert into PhanHoi values ('PH1', N'Khá tốt', 'KH01')
insert into PhanHoi values ('PH2', N'Bình thường', 'KH02')

--Nhân viên

--Hóa đơn
insert into HoaDon values ('HD1', '2023-11-13', 250000, 'KH01', 'NV01')
insert into HoaDon values ('HD2', '2023-12-19', 700000, 'KH02', 'NV02')

--Loại món
insert into LoaiMon values ('LM1', N'Mì cay')
insert into LoaiMon values ('LM2', N'Lẩu')
insert into LoaiMon values ('LM3', N'Đồ ăn kèm lẩu')
insert into LoaiMon values ('LM4', N'Khai vị')
insert into LoaiMon values ('LM5', N'Đồ ăn khác')
insert into LoaiMon values ('LM6', N'Nước uống')

--Món 
insert into Mon values ('M01', N'Mì cay Mikay(thập cẩm)', 55000, 'product-1.jpg', 'LM1')
insert into Mon values ('M02', N'Mì cay kim chi gà', 42000, 'product-2.jpg', 'LM2')
insert into Mon values ('M03', N'Mì cay kim chi bò Mỹ', 89000, 'product-3.jpg', 'LM3')
insert into Mon values ('M04', N'Mì cay kim chi hải sản', 67000, 'product-4.jpg', 'LM4')
insert into Mon values ('M05', N'Mì cay kim chi cá', 31000, 'product-5.jpg', 'LM5')
insert into Mon values ('M06', N'Mì tương đen bò Mỹ', 40000, 'product-6.jpg', 'LM6')

delete from Mon

--CHTD
insert into CTHD values ('HD1', 'M01', 2)
insert into CTHD values ('HD2', 'M05', 6)

--Đặt về
--insert into DatVe values ('KH01','M01', N'Đã duyệt')
--insert into DatVe values ('KH02','M05', N'Chưa duyệt')

--Nguyên liệu
insert into NguyenLieu values ('NL1', N'Thịt bò Mỹ', 20000, 'kg', 'NV02')
insert into NguyenLieu values ('NL2', N'Cá viên chiên', 58000, N'gói', 'NV02')

--Nhà cung cấp
insert into NhaCungCap values ('NC1', N'Công ty Đại Phát', '018923493', '62 Mỹ Thành')
insert into NhaCungCap values ('NC2', N'Nông trại Long Bình', '078211493', '29/1/3 Hải Nam')

--Vai trò
insert into VaiTro values ('staff', N'Nhân viên')
insert into VaiTro values ('admin', 'Admin')

--Tài khoản nhân viên 


-- Tự động sinh khóa cho bảng Khách hàng và Tài khoản khách
CREATE OR ALTER PROC sp_InsertKhachHang
    @TenKH NVARCHAR(100),
    @SDT NVARCHAR(15),
    @NgaySinh DATE,
    @DiaChi NVARCHAR(255),
    @GioiTinh NVARCHAR(4),
	@TenTaiKhoanKhach NVARCHAR(20),
	@MatKhauKhach NVARCHAR(15)
AS
BEGIN
    DECLARE @NewMaKH NVARCHAR(20);
	DECLARE @NewMaTaiKhoanKhach NVARCHAR(20);

    -- Tìm giá trị mới cho MaKH
    SELECT @NewMaKH = 'KH' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaKH, 3, LEN(MaKH) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM KhachHang;

	-- Tìm giá trị mới cho MaTaiKhoanKhach
	SELECT @NewMaTaiKhoanKhach = 'TKK' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaKH, 3, LEN(MaKH) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM TaiKhoanKhach;

	-- Kiểm tra xem tên tài khoản đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM TaiKhoanKhach WHERE TenTaiKhoanKhach = @TenTaiKhoanKhach) OR 
	   EXISTS (SELECT 1 FROM TaiKhoanNhanVien WHERE TenTaiKhoanNV = @TenTaiKhoanKhach)
    BEGIN
        RAISERROR ('Tên tài khoản đã tồn tại. Vui lòng chọn tên tài khoản khác.', 16, 1);
        RETURN;
    END

    -- Insert dữ liệu mới
    INSERT INTO KhachHang VALUES (@NewMaKH, @TenKH, @SDT, @NgaySinh, @DiaChi, @GioiTinh);
	INSERT INTO TaiKhoanKhach (MaTaiKhoanKhach, TenTaiKhoanKhach, MatKhauKhach, MaKH, NgayTao) VALUES (@NewMaTaiKhoanKhach, @TenTaiKhoanKhach, @MatKhauKhach, @NewMaKH, GETDATE());
END;

EXEC sp_InsertKhachHang 'Nguyen Van A', '0123456789', '2000-01-01', 'TP Ho Chi Minh', 'Nam', 'dat', '1'
EXEC sp_InsertKhachHang N'Lê Thị Như Ái', '0123453339', '1996-05-26', 'TP Ho Chi Minh', N'Nữ', 'loan', '1'
EXEC sp_InsertKhachHang N'Trần Hoàng Minh', '0123111339', '1992-05-26', 'TP Ho Chi Minh', 'Nam', 'loan2', '1'
EXEC sp_InsertKhachHang 'Nguyen Van A', '0123456789', '2000-01-01', 'TP Ho Chi Minh', 'Nam', 'da2t', '1'

DELETE FROM TaiKhoanKhach WHERE MaTaiKhoanKhach = 'TKK06'
DELETE FROM KhachHang WHERE MaKH = 'KH06'

SELECT * FROM KhachHang
SELECT * FROM TaiKhoanKhach

UPDATE KhachHang
SET NgaySinh = '2001-11-29'
WHERE MaKH ='KH02'

-- Tự động sinh khóa cho bảng Nhân viên và Tài khoản nhân viên
CREATE OR ALTER PROC sp_InsertNhanVien
    @TenNV NVARCHAR(100),
    @SDTNV NVARCHAR(15),
    @NgaySinh DATE,
    @DiaChi NVARCHAR(255),
    @GioiTinh NVARCHAR(4),
	@TenTaiKhoanNV NVARCHAR(20),
	@MatKhau NVARCHAR(15)
AS
BEGIN
    DECLARE @NewMaNV NVARCHAR(20);
	DECLARE @NewMaTaiKhoanNV NVARCHAR(20);

    -- Tìm giá trị mới cho MaNV
    SELECT @NewMaNV = 'NV' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaNV, 3, LEN(MaNV) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM NhanVien;

	SELECT @NewMaTaiKhoanNV = 'TKNV' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaNV, 3, LEN(MaNV) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM TaiKhoanNhanVien;

	-- Kiểm tra xem tên tài khoản đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM TaiKhoanNhanVien WHERE TenTaiKhoanNV = @TenTaiKhoanNV)
    BEGIN
        RAISERROR ('Tên tài khoản đã tồn tại. Vui lòng chọn tên tài khoản khác.', 16, 1);
        RETURN;
    END

    -- Insert dữ liệu mới
    INSERT INTO NhanVien VALUES (@NewMaNV, @TenNV, @SDTNV, @NgaySinh, @DiaChi, @GioiTinh);
	INSERT INTO TaiKhoanNhanVien (MaTaiKhoanNV, TenTaiKhoanNV, MatKhau, MaNV, NgayTao, MaVaiTro) VALUES (@NewMaTaiKhoanNV, @TenTaiKhoanNV, @MatKhau, @NewMaNV, GETDATE(), 'staff');
END;

EXEC sp_InsertNhanVien N'Lê Hồng Phát', '0123456781', '1994-12-03', 'TP Hue', 'Nam', 'dat', '1'
EXEC sp_InsertNhanVien N'Nguyễn Trần Phúc', '0123456781', '1994-12-03', 'TP Hue', 'Nam', 'dat1', '1'
EXEC sp_InsertNhanVien N'Cao Thị Thủy', '0123456781', '1994-12-03', 'TP Hue', N'Nữ', 'dat2', '1'
EXEC sp_InsertNhanVien N'Trần Đức Anh', '0123456781', '1994-12-03', 'TP Hue', 'Nam', 'dat3', '1'

DELETE FROM NhanVien WHERE MaNV = 'NV02'

INSERT INTO NhanVien VALUES('AD01', 'Trum Admin', '0901092207', '2002-05-29', 'TP Da Nang', N'Nữ')
INSERT INTO TaiKhoanNhanVien VALUES('TKKAD01', 'admin', '1', '2023-12-14', 'AD01', 'admin')
EXEC sp_InsertNhanVien 'Trum Admin', '0901092207', '2002-05-29', 'TP Da Nang', N'Nữ', 'admin', '1'

SELECT * FROM NhanVien
SELECT * FROM VaiTro
SELECT * FROM TaiKhoanNhanVien

DELETE FROM NhanVien WHERE MaNV = 'NV05'

-- Tự động sinh khóa cho bảng LichDat
CREATE OR ALTER PROC sp_InsertLichDat
    @NgayDat DATE,
    @GioDat TIME(7),
    @SoBan TINYINT,
	@MaKH NVARCHAR(20)
AS
BEGIN
    DECLARE @NewMaLichDat NVARCHAR(20);

    -- Tìm giá trị mới cho MaLichDat
    SELECT @NewMaLichDat = 'LD' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaLichDat, 3, LEN(MaLichDat) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM LichDat;

    INSERT INTO LichDat(MaLichDat, NgayDat, GioDat, SoBan, TinhTrang, MaKH) VALUES (@NewMaLichDat, @NgayDat, @GioDat, @SoBan, N'Chưa duyệt', @MaKH)
END;

EXEC sp_InsertLichDat '2023-01-23', '13:00', 2, 'KH01'

SELECT * FROM LichDat

DELETE FROM LichDat

-- Tự động sinh khóa cho bảng PhanHoi
CREATE OR ALTER PROC sp_InsertPhanHoi
    @NoiDungPhanHoi NVARCHAR(MAX),
	@MaKH NVARCHAR(20)
AS
BEGIN
    DECLARE @NewMaPhanHoi NVARCHAR(20);

    -- Tìm giá trị mới cho MaPhanHoi
    SELECT @NewMaPhanHoi = 'PH' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaPhanHoi, 3, LEN(MaPhanHoi) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM PhanHoi;

    INSERT INTO PhanHoi(MaPhanHoi, NoiDungPhanHoi, MaKH) VALUES (@NewMaPhanHoi, @NoiDungPhanHoi, @MaKH)
END;

delete from PhanHoi

-- Tự động sinh khóa cho bảng Mon
CREATE OR ALTER PROC sp_InsertMon
    @TenMon NVARCHAR(255),
    @GiaCa DECIMAL(10, 2),
    @AnhMon NVARCHAR(255),
    @MaTheLoai NVARCHAR(20)
AS
BEGIN
    DECLARE @NewMaMon NVARCHAR(20);

    -- Tìm giá trị mới cho Mon
    SELECT @NewMaMon = 'M' + RIGHT('00' + CAST((ISNULL(MAX(CAST(SUBSTRING(MaMon, 2, LEN(MaMon) - 1) AS INT)), 0) + 1) AS NVARCHAR(20)), 2)
	FROM Mon;

    -- Thêm món vào CSDL
    INSERT INTO Mon (MaMon, TenMon, GiaCa, AnhMon, MaTheLoai) VALUES (@NewMaMon, @TenMon, @GiaCa, @AnhMon, @MaTheLoai);
END;

SELECT * FROM LoaiMon
SELECT * FROM Mon
SELECT * FROM Mon JOIN LoaiMon ON Mon.MaTheLoai = LoaiMon.MaTheLoai

DELETE FROM Mon

EXEC sp_InsertMon N'Mì cay Mikay(thập cẩm)1', 55000, 'product-1.jpg', 'LM1'

-- Tự động thêm món vào Hóa đơn và CTHĐ
CREATE TYPE dbo.OrderDetailsType AS TABLE
(
    MaMon NVARCHAR(20),
    SoLuongMon INT
);

CREATE OR ALTER PROC sp_InsertOrder
    @MaKH NVARCHAR(20),
    @TongGia DECIMAL(10, 2),
    @OrderDetails dbo.OrderDetailsType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    -- Tạo mã hóa đơn tự động
    DECLARE @NewMaHD NVARCHAR(20)
    SELECT @NewMaHD = 'HD' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaHD, 3, LEN(MaHD) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM HoaDon;

    -- Thêm hóa đơn vào bảng HoaDon
    INSERT INTO HoaDon (MaHD, NgayDat, TongGia, TinhTrang, MaKH)
    VALUES (@NewMaHD, GETDATE(), @TongGia, N'Chưa duyệt', @MaKH)

    -- Thêm chi tiết hóa đơn vào bảng CTHD từ bảng tạm
    INSERT INTO CTHD (MaHD, MaMon, SoLuongMon)
    SELECT @NewMaHD, MaMon, SoLuongMon
    FROM @OrderDetails;
END;

-- Sử dụng stored procedure
DECLARE @TempOrderDetails AS dbo.OrderDetailsType;
INSERT INTO @TempOrderDetails (MaMon, SoLuongMon) VALUES ('M03', 12), ('M04', 3);

EXEC sp_InsertOrder 'KH02', 10000, @TempOrderDetails;

SELECT * FROM HoaDon
SELECT * FROM CTHD
SELECT * FROM Mon

DELETE FROM HoaDon
DELETE FROM CTHD

-- Tự động sinh khóa cho bảng Nhà Cung cấp
CREATE OR ALTER PROC sp_InsertNhaCC
    @TenNCC NVARCHAR(255),
    @SDTNCC NVARCHAR(11),
    @DiaChiNCC NVARCHAR(40)
AS
BEGIN
    DECLARE @NewMaNhaCC NVARCHAR(20);

    -- Tìm giá trị mới cho NhaCungCap
    SELECT @NewMaNhaCC= 'NCC' + RIGHT('00' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaNCC, 4, LEN(MaNCC) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM NhaCungCap

	-- Kiểm tra xem tên nhà cung cấp đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM NhaCungCap WHERE TenNCC = @TenNCC)
    BEGIN
        RAISERROR ('Tên nhà cung cấp đã tồn tại. Vui lòng chọn tên nhà cung cấp khác.', 16, 1);
        RETURN;
    END

    -- Thêm nhà cung cấp vào CSDL
    INSERT INTO NhaCungCap(MaNCC, TenNCC, SDTNCC, DiaChiNCC) 
    VALUES (@NewMaNhaCC, @TenNCC, @SDTNCC, @DiaChiNCC)
END;

--code test
SELECT * FROM NhaCungCap

DELETE NhaCungCap WHERE MaNCC = 'NCC02'

EXEC sp_InsertNhaCC N'Cửa hàng Bò Mỹ Thành','0189234973', N'62 Mỹ Thà2nh'

-- Tự động sinh khóa cho bảng NguyenLieu
CREATE OR ALTER PROC sp_InsertNguyenLieu
    @TenNguyenLieu NVARCHAR(255),
    @GiaNguyenLieu DECIMAL(10, 2),
    @DonVi NVARCHAR(10)
AS
BEGIN
    DECLARE @NewMaNguyenLieu NVARCHAR(20);
	DECLARE @NewNgayNhap DATE;
	
    -- Tìm giá trị mới cho NguyenLieu
    SELECT @NewMaNguyenLieu = 'NL' + RIGHT('' + CAST(ISNULL(MAX(CAST(SUBSTRING(MaNguyenLieu, 3, LEN(MaNguyenLieu) - 2) AS INT)), 0) + 1 AS NVARCHAR(20)), 2)
    FROM NguyenLieu

	-- Kiểm tra xem tên nguyên liệu đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM NguyenLieu WHERE TenNguyenLieu = @TenNguyenLieu)
    BEGIN
        RAISERROR ('Tên nguyên liệu đã tồn tại. Vui lòng chọn tên nguyên liệu khác.', 16, 1);
        RETURN;
    END

    -- Thêm nguyên liệu vào CSDL
    INSERT INTO NguyenLieu (MaNguyenLieu, TenNguyenLieu, GiaNguyenLieu, DonVi) 
    VALUES (@NewMaNguyenLieu, @TenNguyenLieu, @GiaNguyenLieu, @DonVi)
END;

--code test
SELECT * FROM NguyenLieu
SELECT * FROM NhaCungCap
EXEC sp_InsertNguyenLieu N'Đùi gà', 80000, N'kg'

-- Thêm món
insert into Mon values ('M01',N'Mì cay kim chi gà',40000,'Mi-dui-ga-kim-chi.jpg','LM1')
insert into Mon values ('M02',N'Mì cay kim chi bò Mỹ',45000,'mi-kim-chi-bo.jpg','LM1')
insert into Mon values ('M03',N'Mì cay kim chi hải sản',45000,'mi-kim-chi-hai-san.jpg','LM1')
insert into Mon values ('M04',N'Lẩu bò kim chi',130000,'lau-bo-kim-chi.jpg','LM2')
insert into Mon values ('M05',N'Lẩu tokbokki',110000,'lau-tokbokki.jpg','LM2')
insert into Mon values ('M06',N'Lẩu tomyum',110000,'lau-thai-tom-yum.jpg','LM2')
insert into Mon values ('M07',N'Nấm',100000,'nam.jpg','LM3')
insert into Mon values ('M08',N'Tokbokki',35000,'tobokki.jpg','LM3')
insert into Mon values ('M09',N'Thịt bò',30000,'thit-bo.jpg','LM3')
insert into Mon values ('M10',N'Phô mai viên',30000,'pho-mai-vien.jpg','LM4')
insert into Mon values ('M11',N'Cơm nắm',30000,'com-nam.jpg','LM4')
insert into Mon values ('M12',N'Bánh bạch tuộc',35000,'takoyaki.jpg','LM4')
insert into Mon values ('M13',N'Cơm trộn thịt bò Mỹ',40000,'comtronbo.jpg','LM5')
insert into Mon values ('M14',N'Cơm trộn Gimbap',40000,'com-tron-gimbap.jpg','LM5')
insert into Mon values ('M15',N'Cơm thịt hèo xào cay',40000,'com-tron-thit-heo-cay.jpg','LM5')
insert into Mon values ('M16','Pepsi',15000,'pepsi.jpg','LM6')
insert into Mon values ('M17',N'Trà sữa thái đỏ',20000,'tra-sua-thai-do.jpg','LM6')
insert into Mon values ('M18',N'Trà đảo chanh xả',20000,'tra-dao-chanh-sa.jpg','LM6')

DELETE FROM LoaiMon
DELETE FROM Mon

SELECT * FROM LoaiMon
SELECT * FROM Mon

ALTER TABLE HoaDon
ALTER COLUMN TongGia decimal(10, 2);

ALTER TABLE Mon
ALTER COLUMN GiaCa decimal(10, 2);

DELETE FROM PhanHoi
SELECT * FROM PhanHoi


-- Tạo bảng lưu tổng doanh thu theo tháng
CREATE TABLE TongDoanhThuTheoThang (
	ID INT PRIMARY KEY IDENTITY(1,1),
    Thang INT,
    Nam INT,
    TongDoanhThu DECIMAL(10, 2)
);

-- Tạo trigger sau khi insert vào bảng HoaDon (Tính tổng doanh thu)
CREATE OR ALTER TRIGGER trg_TinhTongDoanhThu
ON HoaDon
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật tổng doanh thu theo tháng cho các hóa đơn đã duyệt đi
    INSERT INTO TongDoanhThuTheoThang (Thang, Nam, TongDoanhThu)
    SELECT MONTH(i.NgayDat) AS Thang, YEAR(i.NgayDat) AS Nam, SUM(i.TongGia) AS TongDoanhThu
    FROM inserted i
    WHERE i.TinhTrang = N'Đã duyệt'
    GROUP BY MONTH(i.NgayDat), YEAR(i.NgayDat);
END;

SELECT * FROM TongDoanhThuTheoThang

SELECT * FROM NguyenLieu