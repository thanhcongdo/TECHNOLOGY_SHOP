USE [master]
GO
/****** Object:  Database [BanHang]    Script Date: 4/3/2022 2:03:36 PM ******/
CREATE DATABASE [BanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanHang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanHang] SET RECOVERY FULL 
GO
ALTER DATABASE [BanHang] SET  MULTI_USER 
GO
ALTER DATABASE [BanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanHang', N'ON'
GO
ALTER DATABASE [BanHang] SET QUERY_STORE = OFF
GO
USE [BanHang]
GO
/****** Object:  Table [dbo].[tb_DonHang]    Script Date: 4/3/2022 2:03:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_DonHang](
	[idDonHang] [int] IDENTITY(1,1) NOT NULL,
	[idTaiKhoan] [int] NOT NULL,
	[ngayDat] [datetime] NOT NULL,
	[ngayGiao] [datetime] NOT NULL,
	[daGiao] [bit] NOT NULL,
	[daThanhToan] [bit] NOT NULL,
 CONSTRAINT [PK__tb_DonHa__D5DE7ED70DB330BB] PRIMARY KEY CLUSTERED 
(
	[idDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_DonHang_SanPham]    Script Date: 4/3/2022 2:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_DonHang_SanPham](
	[idDonHang] [int] NOT NULL,
	[idSP] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[donGia] [decimal](18, 0) NOT NULL,
	[thanhTien] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__tb_DonHa__6C05FDD3A8F364EC] PRIMARY KEY CLUSTERED 
(
	[idDonHang] ASC,
	[idSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_HangSanPham]    Script Date: 4/3/2022 2:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_HangSanPham](
	[idHang] [int] IDENTITY(1,1) NOT NULL,
	[tenHang] [nvarchar](50) NOT NULL,
	[logo] [varchar](100) NOT NULL,
	[linhVuc] [nvarchar](max) NOT NULL,
	[quocGia] [nvarchar](50) NOT NULL,
	[namThanhLap] [int] NOT NULL,
 CONSTRAINT [PK__tb_HangS__03D9F6792D66A976] PRIMARY KEY CLUSTERED 
(
	[idHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_LoaiSanPham]    Script Date: 4/3/2022 2:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_LoaiSanPham](
	[idLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[tenLoaiSP] [nvarchar](100) NOT NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK__tb_LoaiS__5BB3A83C197D6AA3] PRIMARY KEY CLUSTERED 
(
	[idLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_SanPham]    Script Date: 4/3/2022 2:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SanPham](
	[idSP] [int] IDENTITY(1,1) NOT NULL,
	[idLoaiSP] [int] NOT NULL,
	[tenSP] [nvarchar](max) NOT NULL,
	[trangThai] [bit] NOT NULL,
	[giaBan] [decimal](18, 0) NOT NULL,
	[moTa] [nvarchar](1000) NOT NULL,
	[hinh] [nvarchar](100) NOT NULL,
	[soLuongTon] [int] NOT NULL,
	[ngayCapNhat] [datetime] NOT NULL,
	[idHang] [int] NOT NULL,
 CONSTRAINT [PK__tb_SanPh__9DB8304A43933F64] PRIMARY KEY CLUSTERED 
(
	[idSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_TaiKhoan]    Script Date: 4/3/2022 2:03:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TaiKhoan](
	[idTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[tenDangNhap] [varchar](20) NOT NULL,
	[matKhau] [varchar](20) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[soDienThoai] [char](10) NOT NULL,
	[ngaySinh] [datetime] NULL,
	[diaChi] [nvarchar](100) NOT NULL,
	[eMail] [varchar](50) NULL,
	[laAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__tb_TaiKh__8FA29E4A16FA791A] PRIMARY KEY CLUSTERED 
(
	[idTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_DonHang] ON 

INSERT [dbo].[tb_DonHang] ([idDonHang], [idTaiKhoan], [ngayDat], [ngayGiao], [daGiao], [daThanhToan]) VALUES (7, 3, CAST(N'2022-04-03T03:57:15.003' AS DateTime), CAST(N'2022-04-03T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tb_DonHang] ([idDonHang], [idTaiKhoan], [ngayDat], [ngayGiao], [daGiao], [daThanhToan]) VALUES (8, 3, CAST(N'2022-04-03T04:04:15.297' AS DateTime), CAST(N'2022-04-03T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[tb_DonHang] ([idDonHang], [idTaiKhoan], [ngayDat], [ngayGiao], [daGiao], [daThanhToan]) VALUES (9, 3, CAST(N'2022-04-03T04:47:56.233' AS DateTime), CAST(N'2022-04-03T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[tb_DonHang] ([idDonHang], [idTaiKhoan], [ngayDat], [ngayGiao], [daGiao], [daThanhToan]) VALUES (10, 3, CAST(N'2022-04-03T14:00:25.583' AS DateTime), CAST(N'2022-04-03T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[tb_DonHang] OFF
GO
INSERT [dbo].[tb_DonHang_SanPham] ([idDonHang], [idSP], [soLuong], [donGia], [thanhTien]) VALUES (7, 5, 100, CAST(36990000 AS Decimal(18, 0)), CAST(3699000000 AS Decimal(18, 0)))
INSERT [dbo].[tb_DonHang_SanPham] ([idDonHang], [idSP], [soLuong], [donGia], [thanhTien]) VALUES (8, 8, 2, CAST(18990000 AS Decimal(18, 0)), CAST(52960000 AS Decimal(18, 0)))
INSERT [dbo].[tb_DonHang_SanPham] ([idDonHang], [idSP], [soLuong], [donGia], [thanhTien]) VALUES (8, 9, 2, CAST(7490000 AS Decimal(18, 0)), CAST(52960000 AS Decimal(18, 0)))
INSERT [dbo].[tb_DonHang_SanPham] ([idDonHang], [idSP], [soLuong], [donGia], [thanhTien]) VALUES (9, 10, 2, CAST(34190000 AS Decimal(18, 0)), CAST(68380000 AS Decimal(18, 0)))
INSERT [dbo].[tb_DonHang_SanPham] ([idDonHang], [idSP], [soLuong], [donGia], [thanhTien]) VALUES (10, 18, 1, CAST(28000000 AS Decimal(18, 0)), CAST(28000000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[tb_HangSanPham] ON 

INSERT [dbo].[tb_HangSanPham] ([idHang], [tenHang], [logo], [linhVuc], [quocGia], [namThanhLap]) VALUES (1, N'SAMSUNG', N'/Content/images/logo_samsung.png', N'Điện thoại, Máy tính bảng, Laptop, Hàng điện tử tiêu dùng,... ', N'Hàn Quốc', 1938)
INSERT [dbo].[tb_HangSanPham] ([idHang], [tenHang], [logo], [linhVuc], [quocGia], [namThanhLap]) VALUES (3, N'APPLE', N'/Content/images/logo_apple.png', N'Điện thoại, Máy tính bảng, Laptop, Thiết bị điện tử,...', N'Hoa Kỳ', 1976)
INSERT [dbo].[tb_HangSanPham] ([idHang], [tenHang], [logo], [linhVuc], [quocGia], [namThanhLap]) VALUES (4, N'DELL', N'/Content/images/logo_dell.png', N'Máy tính cá nhân, Máy chủ, Thiết bị ngoại vi, Máy thu hình', N'Hoa kỳ', 1984)
SET IDENTITY_INSERT [dbo].[tb_HangSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_LoaiSanPham] ON 

INSERT [dbo].[tb_LoaiSanPham] ([idLoaiSP], [tenLoaiSP], [trangThai]) VALUES (10, N'Máy tính bảng', 1)
INSERT [dbo].[tb_LoaiSanPham] ([idLoaiSP], [tenLoaiSP], [trangThai]) VALUES (25, N'Điện thoại', 1)
INSERT [dbo].[tb_LoaiSanPham] ([idLoaiSP], [tenLoaiSP], [trangThai]) VALUES (26, N'Máy tính xách tay', 1)
INSERT [dbo].[tb_LoaiSanPham] ([idLoaiSP], [tenLoaiSP], [trangThai]) VALUES (28, N'Âm thanh', 1)
INSERT [dbo].[tb_LoaiSanPham] ([idLoaiSP], [tenLoaiSP], [trangThai]) VALUES (29, N'Đồng hồ', 1)
INSERT [dbo].[tb_LoaiSanPham] ([idLoaiSP], [tenLoaiSP], [trangThai]) VALUES (30, N'Phụ kiện', 1)
SET IDENTITY_INSERT [dbo].[tb_LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_SanPham] ON 

INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (3, 10, N'Tab S8 Ultra', 1, CAST(32000000 AS Decimal(18, 0)), N'Kích thước màn hình	14 inchesCông nghệ màn hình	Super AMOLEDCamera sau	13 MP, f/2.0 góc rộng6 MP, f/2.2 góc siêu rộngCamera trước	12 MP, f/2.2 (góc rộng)12MP (góc siêu rộng)Chipset	Qualcomm Snapdragon 8 Gen 1 (4 nm)Dung lượng RAM	8 GBBộ nhớ trong	128 GBPin	Li-Po 11200 mAhThẻ SIM	Nano-SIMHệ điều hành	Android 12, One UI 4.1Loại CPU	Octa-core (1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)Kích thước	326.4 x 208.6 x 5.5 mm Trọng lượng	726 gBluetooth	5.2, A2DP, LE', N'/Content/images/tab_s8_ultra.png', 50, CAST(N'2022-04-03T11:22:08.913' AS DateTime), 1)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (5, 25, N'iPhone 13 Pro Max 256GB Gold', 1, CAST(36990000 AS Decimal(18, 0)), N'Màn hình: OLED6.7"Super Retina XDR
Hệ điều hành: iOS 15
Camera sau: 3 camera 12 MP
Camera trước: 12 MP
Chip: Apple A15 Bionic
RAM: 6 GB
Bộ nhớ trong: 256 GB
SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G
Pin, Sạc: 4352 mAh20 W', N'/Content/images/iphone13prm.png', 51, CAST(N'2022-04-03T11:22:14.380' AS DateTime), 3)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (6, 10, N'Máy tính bảng iPad Pro M1 11 inch WiFi Cellular 1TB (2021)', 1, CAST(44590000 AS Decimal(18, 0)), N'Màn hình:

11"Liquid Retina
Hệ điều hành:

iPadOS 15
Chip:

Apple M1 8 nhân
RAM:

16 GB
Bộ nhớ trong:

1 TB
Kết nối:

5GNghe gọi qua FaceTime
SIM:

1 Nano SIM hoặc 1 eSIM
Camera sau:

Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR
Camera trước:

12 MP
Pin, Sạc:

28.65 Wh (~ 7538 mAh)20 W', N'/Content/images/ipadpro2021.png', 16, CAST(N'2022-04-03T11:22:24.770' AS DateTime), 3)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (7, 26, N'Laptop ASUS ZenBook Flip UX363EA', 1, CAST(23390000 AS Decimal(18, 0)), N'Loại CPU	Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB
Loại card đồ họa	Intel Iris Xe Graphics
Dung lượng RAM	8GB
Loại RAM	LPDDR4X không hỗ trợ nâng cấp
Ổ cứng	512GB SSD PCIE G3x4
Kích thước màn hình	13.3 inches
Độ phân giải màn hình	1920 x 1080 pixels (FullHD)
Cổng giao tiếp	2x Thunderbolt™ 4 supports display / power delivery
1x USB 3.2 Gen 1 Type-A
1x HDMI 1.4
Hệ điều hành	Windows 11
Pin	4 Cell 67WHr
Kích thước	30.5 x 21.1 x 1.19 ~ 1.39 (cm)
Trọng lượng	1.3 kg
Công nghệ màn hình	100% DCI-P3 color gamut, 1,000,000:1, VESA CERTIFIED Display HDR True Black 500, 1.07 billion colors, PANTONE Validated
Bluetooth	v5.0', N'/Content/images/zenbook_flip.png', 20, CAST(N'2022-04-03T11:22:30.243' AS DateTime), 4)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (8, 25, N'Samsung Galaxy Note 20 Ultra 5G', 1, CAST(18990000 AS Decimal(18, 0)), N'Kích thước màn hình	6.9 inches
Công nghệ màn hình	Dynamic AMOLED
Camera sau	108 MP, f/1.8, 26mm (wide), 1/1.33", 0.8µm, PDAF, Laser AF, OIS
12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom
12 MP, f/2.2, 13mm (ultrawide), 1/2.55", 1.4µm
Camera trước	10 MP, f/2.2, 26mm (wide), 1/3.2", 1.22µm, Dual Pixel PDAF
Chipset	Exynos 990 (7 nm+)
Dung lượng RAM	12 GB
Bộ nhớ trong	256 GB
Pin	Non-removable Li-Ion 4500 mAh battery
Fast charging 25W
USB Power Delivery 3.0
Fast Qi/PMA wireless charging
Reverse wireless charging 9W
Thẻ SIM	2 SIM (Nano-SIM)
Hệ điều hành	Android 10, One UI 2.1
Độ phân giải màn hình	1440 x 3088 pixels (QHD+)
Loại CPU	Octa-core (2x2.73 GHz Mongoose M5 & 2x2.50 GHz Cortex-A76 & 4x2.0 GHz Cortex-A55)
Kích thước	164.8 x 77.2 x 8.1 mm
Trọng lượng	208 g
Bluetooth	5.0, A2DP, LE, aptX', N'/Content/images/note20ultra.png', 95, CAST(N'2022-04-03T11:22:36.203' AS DateTime), 1)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (9, 25, N'Xiaomi Redmi Note 11 Pro', 1, CAST(7490000 AS Decimal(18, 0)), N'Kích thước màn hình	6.67 inches
Công nghệ màn hình	AMOLED
Camera sau	Camera góc rộng: 108 MP, f/1.9, PDAF
Camera góc siêu rộng: 8 MP
Camera Tele: 2 MP, f/2.4
Camera chân dung: 2MP f/2.4
Camera trước	16MP f/2.4
Chipset	MediaTek Helio G96
Dung lượng RAM	8 GB
Bộ nhớ trong	128 GB
Pin	5000mAh (typ)
Thẻ SIM	2 SIM (Nano-SIM)
Hệ điều hành	Android 11, MIUI 12.5
Độ phân giải màn hình	1080 x 2400 pixels (FullHD+)
Loại CPU	Octa-core CPU, up to 2.05GHz
Kích thước	163.7 x 76.2 x 8.3 mm
Trọng lượng	202g
Bluetooth	5.2, A2DP, LE', N'/Content/images/redminote11pro.png', 18, CAST(N'2022-04-03T11:22:45.017' AS DateTime), 1)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (10, 25, N'Samsung Galaxy Z Fold3 5G', 1, CAST(34190000 AS Decimal(18, 0)), N'Kích thước màn hình	7.6 inches
Công nghệ màn hình	Dynamic AMOLED
Camera sau	Camera góc rộng: 12 MP, f/1.8, 26mm, Dual Pixel PDAF, OIS
Camera tele: 12 MP, f/2.4, 52mm, PDAF, OIS, 2x Zoom quang học
Camera góc siêu rộng: 12 MP, f/2.2
Camera màn hình phụ: 10MP, f/2.2
Camera trước	Camera ẩn dưới màn hình: 4MP, f/1.8
Chipset	Snapdragon 888 5G (5 nm)
Dung lượng RAM	12 GB
Bộ nhớ trong	256 GB
Pin	Li-Po 4400 mAh
Thẻ SIM	2 SIM (nano‑SIM và eSIM)
Hệ điều hành	Android 11
Loại CPU	1 nhân 2.84 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz
Kích thước	Khi gập:158.2 x 67.1 x 16mm
Khi mở:158.2 x 128.1 x 6.4mm
Trọng lượng	271g
Bluetooth	v 5.0', N'/Content/images/zfold3.png', 18, CAST(N'2022-04-03T11:22:55.833' AS DateTime), 1)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (11, 25, N'OPPO Reno7 (5G)', 1, CAST(12990000 AS Decimal(18, 0)), N'Kích thước màn hình	6.4 inches
Công nghệ màn hình	AMOLED
Camera sau	Camera chính: 64 MP, f/1.7, PDAF
Camera góc siêu rộng: 8 MP, f/2.25, 120˚
Camera macro: 2 MP, f/2.4
Camera trước	32MP f/2.4
Chipset	MediaTek Dimensity 900
Dung lượng RAM	8 GB
Bộ nhớ trong	256 GB
Pin	Li-Po 4500 mAh
Thẻ SIM	2 SIM (Nano-SIM)
Hệ điều hành	Android 11, ColorOS 12
Độ phân giải màn hình	1080 x 2400 pixels (FullHD+)
Loại CPU	4x2.4 GHz Kryo 670 & 4x1.9 GHz Kryo 670
Kích thước	173 g
Trọng lượng	160.6 x 73.2 x 7.81 mm
Bluetooth	5.2, A2DP, LE, aptX HD', N'/Content/images/reno7.png', 20, CAST(N'2022-04-03T11:23:01.200' AS DateTime), 1)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (17, 25, N'iPhone 13 Pro Max 256GB Gold', 1, CAST(59589000 AS Decimal(18, 0)), N'1', N'/Content/images/iphone13prm.png', 1, CAST(N'2022-04-03T11:23:08.353' AS DateTime), 3)
INSERT [dbo].[tb_SanPham] ([idSP], [idLoaiSP], [tenSP], [trangThai], [giaBan], [moTa], [hinh], [soLuongTon], [ngayCapNhat], [idHang]) VALUES (18, 25, N'iPhone 13 Pro Max 256GB Gold', 1, CAST(28000000 AS Decimal(18, 0)), N'1', N'/Content/images/iphone13prm.png', 2, CAST(N'2022-04-03T13:56:10.610' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[tb_SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_TaiKhoan] ON 

INSERT [dbo].[tb_TaiKhoan] ([idTaiKhoan], [tenDangNhap], [matKhau], [hoTen], [soDienThoai], [ngaySinh], [diaChi], [eMail], [laAdmin]) VALUES (2, N'nguyenphuduc', N'1911066051', N'Nguyễn Phú Đức', N'0964732222', NULL, N'Bình Dương', N'meo@gmail.com', 1)
INSERT [dbo].[tb_TaiKhoan] ([idTaiKhoan], [tenDangNhap], [matKhau], [hoTen], [soDienThoai], [ngaySinh], [diaChi], [eMail], [laAdmin]) VALUES (3, N'nguyenphuduc307', N'admin12345', N'Nguyễn Phú Đức', N'0964732231', CAST(N'2001-07-31T00:00:00.000' AS DateTime), N'Bình Dương', N'nguyenphuduc62001@gmail.com', 0)
INSERT [dbo].[tb_TaiKhoan] ([idTaiKhoan], [tenDangNhap], [matKhau], [hoTen], [soDienThoai], [ngaySinh], [diaChi], [eMail], [laAdmin]) VALUES (6, N'nguyenduchau', N'nguyenduchau', N'Nguyễn Đức Hậu', N'0964732231', NULL, N'Đồng Nai', NULL, 0)
SET IDENTITY_INSERT [dbo].[tb_TaiKhoan] OFF
GO
ALTER TABLE [dbo].[tb_DonHang]  WITH CHECK ADD  CONSTRAINT [FK__tb_DonHan__idTai__30F848ED] FOREIGN KEY([idTaiKhoan])
REFERENCES [dbo].[tb_TaiKhoan] ([idTaiKhoan])
GO
ALTER TABLE [dbo].[tb_DonHang] CHECK CONSTRAINT [FK__tb_DonHan__idTai__30F848ED]
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham]  WITH CHECK ADD  CONSTRAINT [FK__tb_DonHan__idDon__31EC6D26] FOREIGN KEY([idDonHang])
REFERENCES [dbo].[tb_DonHang] ([idDonHang])
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham] CHECK CONSTRAINT [FK__tb_DonHan__idDon__31EC6D26]
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham]  WITH CHECK ADD  CONSTRAINT [FK__tb_DonHang__idSP__2E1BDC42] FOREIGN KEY([idSP])
REFERENCES [dbo].[tb_SanPham] ([idSP])
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham] CHECK CONSTRAINT [FK__tb_DonHang__idSP__2E1BDC42]
GO
ALTER TABLE [dbo].[tb_SanPham]  WITH CHECK ADD  CONSTRAINT [FK__tb_SanPha__idLoa__2F10007B] FOREIGN KEY([idLoaiSP])
REFERENCES [dbo].[tb_LoaiSanPham] ([idLoaiSP])
GO
ALTER TABLE [dbo].[tb_SanPham] CHECK CONSTRAINT [FK__tb_SanPha__idLoa__2F10007B]
GO
ALTER TABLE [dbo].[tb_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_tb_SanPham_tb_HangSanPham] FOREIGN KEY([idHang])
REFERENCES [dbo].[tb_HangSanPham] ([idHang])
GO
ALTER TABLE [dbo].[tb_SanPham] CHECK CONSTRAINT [FK_tb_SanPham_tb_HangSanPham]
GO
USE [master]
GO
ALTER DATABASE [BanHang] SET  READ_WRITE 
GO
