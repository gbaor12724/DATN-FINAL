-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 14, 2024 lúc 11:05 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `rx_luxury`
--
CREATE DATABASE IF NOT EXISTS `rx_luxury` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `rx_luxury`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

CREATE TABLE `binh_luan` (
  `ma_binh_luan` int NOT NULL,
  `ma_san_pham` int NOT NULL,
  `ma_nguoi_dung` int NOT NULL,
  `noi_dung` text NOT NULL,
  `ngay_tao` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luan`
--

INSERT INTO `binh_luan` (`ma_binh_luan`, `ma_san_pham`, `ma_nguoi_dung`, `noi_dung`, `ngay_tao`) VALUES
(7, 18, 7, 'da', '2024-12-13 20:06:54'),
(8, 15, 6, 'aaaaa', '2024-12-14 12:58:47'),
(9, 15, 6, 'sản phẩm đẹp quá', '2024-12-14 12:59:46'),
(10, 15, 6, 'rất ưng', '2024-12-14 12:59:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatlieu`
--

CREATE TABLE `chatlieu` (
  `ma_chat_lieu` int NOT NULL,
  `ten_chat_lieu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chatlieu`
--

INSERT INTO `chatlieu` (`ma_chat_lieu`, `ten_chat_lieu`, `mo_ta`) VALUES
(1, 'Thép không gỉ', NULL),
(2, 'Da thật', NULL),
(3, 'Nhựa cao cấp', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `ma_chi_tiet_don_hang` int NOT NULL,
  `ma_don_hang` int NOT NULL,
  `ma_san_pham` int NOT NULL,
  `so_luong` int NOT NULL,
  `gia` decimal(10,2) NOT NULL,
  `thoi_gian_bao_hanh` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucsanpham`
--

CREATE TABLE `danhmucsanpham` (
  `ma_danh_muc` int NOT NULL,
  `ten_danh_muc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mo_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucsanpham`
--

INSERT INTO `danhmucsanpham` (`ma_danh_muc`, `ten_danh_muc`, `mo_ta`) VALUES
(1, 'Điện tử', NULL),
(2, 'Thời trang', NULL),
(3, 'Thể thao', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

CREATE TABLE `danh_gia` (
  `ma_danh_gia` int NOT NULL,
  `ma_san_pham` int DEFAULT NULL,
  `ma_nguoi_dung` int DEFAULT NULL,
  `diem_so` int DEFAULT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia_san_pham`
--

CREATE TABLE `danh_gia_san_pham` (
  `ma_danh_gia` int NOT NULL,
  `ma_san_pham` int NOT NULL,
  `ma_nguoi_dung` int NOT NULL,
  `so_sao` int NOT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ngay_danh_gia` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_sach_yeu_thich`
--

CREATE TABLE `danh_sach_yeu_thich` (
  `ma_danh_sach_yeu_thich` int NOT NULL,
  `ma_san_pham` int DEFAULT NULL,
  `ngay_tao` date DEFAULT NULL,
  `ma_nguoi_dung` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `ma_don_hang` int NOT NULL,
  `ma_nguoi_dung` int DEFAULT NULL,
  `ngay_dat_hang` date DEFAULT NULL,
  `trang_thai` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tong_tien` decimal(10,2) DEFAULT NULL,
  `dia_chi_giao_hang` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `theo_doi_don_hang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phi_van_chuyen` decimal(10,2) DEFAULT NULL,
  `trang_thai_thanh_toan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id` int NOT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `dia_chi` text,
  `thanh_pho` varchar(255) DEFAULT NULL,
  `ghi_chu` text,
  `phuong_thuc_thanh_toan` varchar(50) DEFAULT NULL,
  `trang_thai` varchar(50) DEFAULT NULL,
  `tong_tien` decimal(10,2) DEFAULT NULL,
  `phi_van_chuyen` decimal(10,2) DEFAULT NULL,
  `ma_nguoi_dung` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `ma_khuyen_mai` int NOT NULL,
  `ten_khuyen_mai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phan_tram_giam_gia` decimal(5,2) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `ma_san_pham` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kien_thuc_dong_ho`
--

CREATE TABLE `kien_thuc_dong_ho` (
  `id` int NOT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `noi_dung` text NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `ngay_tao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `trang_thai` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `kien_thuc_dong_ho`
--

INSERT INTO `kien_thuc_dong_ho` (`id`, `tieu_de`, `noi_dung`, `hinh_anh`, `ngay_tao`, `trang_thai`) VALUES
(1, 'Cách chọn đồng hồ phù hợp', 'Chọn đồng hồ phù hợp với phong cách và mục đích sử dụng là rất quan trọng. Bạn cần cân nhắc kích thước, chất liệu, và tính năng của đồng hồ.', '/images/dongho1.jpg', '2024-12-12 09:47:13', 'active'),
(2, 'Lịch sử đồng hồ Rolex', 'Rolex là một trong những thương hiệu đồng hồ cao cấp nổi tiếng thế giới, với lịch sử lâu dài và các sản phẩm được ưa chuộng bởi các tín đồ đồng hồ.', '/images/dongho2.jpg', '2024-12-12 09:47:13', 'active'),
(3, 'Công nghệ trong đồng hồ thông minh', 'Đồng hồ thông minh ngày càng phổ biến với nhiều tính năng như theo dõi sức khỏe, thông báo tin nhắn và cuộc gọi, và thậm chí điều khiển các thiết bị khác.', '/images/dongho3.jpg', '2024-12-12 09:47:13', 'active'),
(4, 'Cách bảo quản đồng hồ đúng cách', 'Để đồng hồ bền lâu, bạn cần bảo quản đúng cách. Tránh tiếp xúc với hóa chất, nước, và đảm bảo đồng hồ được vệ sinh thường xuyên.', '/images/dongho4.jpg', '2024-12-12 09:47:13', 'active'),
(5, 'Các loại đồng hồ cơ và đồng hồ quartz', 'Đồng hồ cơ sử dụng chuyển động của các bánh răng cơ học, trong khi đồng hồ quartz sử dụng pin để điều khiển kim đồng hồ. Mỗi loại có những ưu nhược điểm riêng.', '/images/dongho5.jpg', '2024-12-12 09:47:13', 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lich_su_dat_hang`
--

CREATE TABLE `lich_su_dat_hang` (
  `ma_lich_su_dat_hang` int NOT NULL,
  `ma_nguoi_dung` int DEFAULT NULL,
  `ngay_dat_hang` date DEFAULT NULL,
  `trang_thai` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ghi_chu` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `ngay_tao` date DEFAULT NULL,
  `ma_don_hang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `ma_nguoi_dung` int NOT NULL,
  `ten_nguoi_dung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vai_tro` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `so_dien_thoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Điện thoại',
  `hinh` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ file hình',
  `dia_chi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ',
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP,
  `diem_thuong` int DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`ma_nguoi_dung`, `ten_nguoi_dung`, `email`, `email_verified_at`, `mat_khau`, `vai_tro`, `so_dien_thoai`, `hinh`, `dia_chi`, `ngay_tao`, `diem_thuong`, `remember_token`, `google_id`, `reset_token`) VALUES
(2, 'a', 'a@a', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', NULL, NULL, NULL, '2024-11-21 13:11:53', 0, NULL, NULL, NULL),
(3, 'that', '38nguyenvanthat@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'admin', NULL, NULL, NULL, '2024-11-22 19:17:51', 0, NULL, NULL, NULL),
(4, 'admin', 'trunhle@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'admin', NULL, NULL, NULL, '2024-11-22 23:33:48', 0, NULL, NULL, NULL),
(5, 'trung', 'trunh@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', '0372179063', NULL, 'ádasdasd', '2024-11-27 21:43:00', 0, NULL, NULL, NULL),
(6, 'aaaaaaaaaaaaaaaaa', 'trunhle36@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', '1231213131', NULL, 'ádasdad', '2024-11-27 21:45:47', 0, NULL, NULL, NULL),
(7, '1123123aaa', 'tgb1272422@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', '41345456645645', '/uploads/1734100795726.jpg', 'jhopasda', '2024-12-09 21:35:12', 0, NULL, NULL, NULL),
(8, 'giabao122', 'tgb172@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', '0012321343', '/uploads/1733853182329.jpg', '1as312da', '2024-12-09 22:00:16', 0, NULL, NULL, NULL),
(10, 'aaaaaaaaa', 'hehe@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', '0867701641', '/uploads/1733854031572.jpg', 'aksk', '2024-12-11 00:54:32', 0, NULL, NULL, NULL),
(11, 'Trần GIa bảo', 'tgb12724@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', '0131212312231', NULL, 'Hoài Xuân Hoài Nhơn', '2024-12-13 22:11:33', 0, NULL, NULL, NULL),
(12, 'Nguyen van a', 'hoanga@gmail.com', NULL, '$2b$10$s5jbB7OUlHqkQ6z2B0w6BOqZxV4l8cvOC0dIQbou2m2eJvOfvwfni', 'user', '0385323196', NULL, 'khanh hòa', '2024-12-14 20:47:10', 0, NULL, NULL, NULL),
(13, 'lee', 'lee@gmail.com', NULL, '$2b$10$wDhqhaaFFPvfqBf7.DRPAeFP1BIHoDTvyGiaFSwCHyNRLOXwrJoNm', 'user', '0372179063', NULL, 'khanh hoa', '2024-12-15 05:45:37', 0, NULL, NULL, NULL),
(14, 'tuan', 'tuan@gmail.com', NULL, '$2b$10$VSC.cmDREeEp/c5COcCe2uKE7EBRfSRnn17M5HPVyeiJXMmsk1.ty', 'user', '0372179063', NULL, 'khanh hoa', '2024-12-15 05:47:27', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `trangthai` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `notes` text,
  `paymentMethod` varchar(50) NOT NULL,
  `agreeTerms` tinyint(1) NOT NULL,
  `checkoutCart` json DEFAULT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ma_nguoi_dung` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `trangthai`, `address`, `city`, `notes`, `paymentMethod`, `agreeTerms`, `checkoutCart`, `orderDate`, `ma_nguoi_dung`) VALUES
(48, 'Van a', 'hoanga@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"2200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp\", \"mo_ta\": \"Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\\r\\n\\r\\nVỏ trong suốt màu hồng 44mm\\r\\nDây đeo silicon màu xanh lam/tím\\r\\nMặt đồng hồ màu đen mờ\\r\\n3 ATM\\r\\nKhóa Ardillon\\r\\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 17, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Icon Active Chronograph Colorful-Tone Watch 44mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 150, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"40.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}]', '2024-12-03 21:00:53', NULL),
(49, 'Van a', 'hoanga@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"2200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp\", \"mo_ta\": \"Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\\r\\n\\r\\nVỏ trong suốt màu hồng 44mm\\r\\nDây đeo silicon màu xanh lam/tím\\r\\nMặt đồng hồ màu đen mờ\\r\\n3 ATM\\r\\nKhóa Ardillon\\r\\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 17, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Icon Active Chronograph Colorful-Tone Watch 44mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 150, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"40.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"30000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.png.webp\", \"mo_ta\": \"Đồng hồ Rolex sang trọng, thiết kế tinh tế.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"15000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 11, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Seiko SSC817P1 Prospex Chronograph Silver-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 50, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}]', '2024-12-02 21:02:16', NULL),
(50, 'Van a', 'hoanga@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"2200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp\", \"mo_ta\": \"Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\\r\\n\\r\\nVỏ trong suốt màu hồng 44mm\\r\\nDây đeo silicon màu xanh lam/tím\\r\\nMặt đồng hồ màu đen mờ\\r\\n3 ATM\\r\\nKhóa Ardillon\\r\\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 17, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Icon Active Chronograph Colorful-Tone Watch 44mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 150, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"40.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"4000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm1.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm2.png.webp\", \"mo_ta\": \"Kiểu chuyển động: Tự động lên dây cót bằng tay. Dự trữ năng lượng: Xấp xỉ 41 giờ\\r\\nChức năng: Chức năng dừng kim giây, Hiển thị Ngày/Thứ\\r\\nChất liệu vỏ: Thép không gỉ\\r\\nĐộ dày: 13,2mm. Đường kính: 39,4mm\\r\\nGắn vào gờ: 48,1mm. Pha lê: Hardlex cong\\r\\nChất liệu dây đeo: Nylon. Khả năng chống nước: 10 ATM\\r\\nTrọng lượng: 75,0g. Tính năng: Mặt sau trong suốt\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"3800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 12, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPH29K1 5 Sport Green Tone Watch 39.4mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 3, \"so_luong_ton_kho\": 75, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"45.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"5000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm2.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu xanh. Vành bezel cố định bằng thép không gỉ với pha lê. Mặt số lấp lánh màu bạc với kim màu xanh và các vạch chỉ giờ bằng đá quý. Loại mặt số: Analog. Bộ máy thạch anh Seiko caliber V115. Tinh thể Hardlex chống trầy xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật. Kích thước vỏ: 24,7 mm. Độ dày vỏ: 6 mm. Chiều rộng dây đeo: 12 mm. Khóa cài. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"2500000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 13, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SUP429P1 Essentials Silver Tone Watch 25mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 120, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"42.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"3500000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-1.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu nâu. Vành thép không gỉ trơn cố định. Mặt số màu xanh với kim màu bạc phát sáng và số Ả Rập xen kẽ và các vạch chỉ giờ. Vạch chỉ phút. Kiểu mặt số: Analog. Kim và vạch chỉ giờ phát sáng. Hiển thị ngày và thứ trong tuần ở vị trí 3 giờ. Bộ máy tự động Seiko caliber 7S26, dựa trên Seiko 7002, chứa 21 Chân kính, hoạt động ở tần số 21600 vph và có khả năng dự trữ năng lượng khoảng 40 giờ. Kính Hardlex chống xước. Núm điều chỉnh kéo / đẩy. Nắp lưng trong suốt. Hình dạng vỏ đệm. Kích thước vỏ: 43,5 mm. Độ dày vỏ: 11,4 mm. Chiều rộng dây đeo: 24 mm. Khóa cài. Chống nước ở độ sâu 50 mét / 165 feet. Chức năng: ngày, thứ, giờ, phút, giây. Thông tin bổ sung: phù hợp cho thời gian bơi giải trí ngắn, nhưng không lặn hoặc lặn với ống thở. Dòng Recraft. Kiểu đồng hồ thường ngày. Nhãn đồng hồ: Japan Movt.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"2900000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 14, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SNKN37 Recraft Automatic Brown Leather Watch 43mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 60, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"44.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}]', '2024-12-01 21:02:51', NULL),
(51, 'Gia bao', 'tgb12724@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"2200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp\", \"mo_ta\": \"Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\\r\\n\\r\\nVỏ trong suốt màu hồng 44mm\\r\\nDây đeo silicon màu xanh lam/tím\\r\\nMặt đồng hồ màu đen mờ\\r\\n3 ATM\\r\\nKhóa Ardillon\\r\\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 17, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Icon Active Chronograph Colorful-Tone Watch 44mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 150, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"40.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"4000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm1.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm2.png.webp\", \"mo_ta\": \"Kiểu chuyển động: Tự động lên dây cót bằng tay. Dự trữ năng lượng: Xấp xỉ 41 giờ\\r\\nChức năng: Chức năng dừng kim giây, Hiển thị Ngày/Thứ\\r\\nChất liệu vỏ: Thép không gỉ\\r\\nĐộ dày: 13,2mm. Đường kính: 39,4mm\\r\\nGắn vào gờ: 48,1mm. Pha lê: Hardlex cong\\r\\nChất liệu dây đeo: Nylon. Khả năng chống nước: 10 ATM\\r\\nTrọng lượng: 75,0g. Tính năng: Mặt sau trong suốt\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"3800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 12, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPH29K1 5 Sport Green Tone Watch 39.4mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 3, \"so_luong_ton_kho\": 75, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"45.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"5000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm2.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu xanh. Vành bezel cố định bằng thép không gỉ với pha lê. Mặt số lấp lánh màu bạc với kim màu xanh và các vạch chỉ giờ bằng đá quý. Loại mặt số: Analog. Bộ máy thạch anh Seiko caliber V115. Tinh thể Hardlex chống trầy xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật. Kích thước vỏ: 24,7 mm. Độ dày vỏ: 6 mm. Chiều rộng dây đeo: 12 mm. Khóa cài. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"2500000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 13, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SUP429P1 Essentials Silver Tone Watch 25mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 120, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"42.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"3500000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-1.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu nâu. Vành thép không gỉ trơn cố định. Mặt số màu xanh với kim màu bạc phát sáng và số Ả Rập xen kẽ và các vạch chỉ giờ. Vạch chỉ phút. Kiểu mặt số: Analog. Kim và vạch chỉ giờ phát sáng. Hiển thị ngày và thứ trong tuần ở vị trí 3 giờ. Bộ máy tự động Seiko caliber 7S26, dựa trên Seiko 7002, chứa 21 Chân kính, hoạt động ở tần số 21600 vph và có khả năng dự trữ năng lượng khoảng 40 giờ. Kính Hardlex chống xước. Núm điều chỉnh kéo / đẩy. Nắp lưng trong suốt. Hình dạng vỏ đệm. Kích thước vỏ: 43,5 mm. Độ dày vỏ: 11,4 mm. Chiều rộng dây đeo: 24 mm. Khóa cài. Chống nước ở độ sâu 50 mét / 165 feet. Chức năng: ngày, thứ, giờ, phút, giây. Thông tin bổ sung: phù hợp cho thời gian bơi giải trí ngắn, nhưng không lặn hoặc lặn với ống thở. Dòng Recraft. Kiểu đồng hồ thường ngày. Nhãn đồng hồ: Japan Movt.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"2900000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 14, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SNKN37 Recraft Automatic Brown Leather Watch 43mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 60, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"44.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"4200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-m126333-0011-oystersteel-watch-40mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 41 mm, Oystersteel và vàng vàng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n41mm\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép Twinlock bắt vít\\r\\nPha lê\\r\\nKính sapphire chống xước, thấu kính Cyclops lịch ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, Sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc Parachrom màu xanh thuận từ. Giảm xóc Paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto Perpetual\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nOyster, liên kết rắn ba mảnh\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nmóc cài\\r\\nKhóa Oysterclasp gập với mắt xích mở rộng tiện lợi Easylink 5 mm\\r\\nQuay số\\r\\nBộ màu rượu sâm panh đính kim cương\\r\\nCài đặt đá quý\\r\\nKim cương trên nền vàng 18 ct\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"3900000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 20, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust M126333-0011 Oystersteel Watch 41MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 90, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"3100000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-silver-tone-watch-28mm1.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-silver-tone-watch-28mm3.png.webp\", \"mo_ta\": \"Chiếc đồng hồ trang sức thanh lịch này được đặc trưng bởi thân vỏ nhỏ nhắn nữ tính được tô điểm bằng Medusa 3D ở vị trí 12 giờ. Chiếc đồng hồ nhỏ nhắn độc đáo này cực kỳ giàu chi tiết.\\r\\n\\r\\nVỏ thép không gỉ 28mm\\r\\nVòng đeo tay bằng thép không gỉ\\r\\nMặt số Blue Sunray\\r\\n3 ATM\\r\\nKhóa Deployant\\r\\nBộ máy Quartz 2 kim sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 24, \"gia_giam\": \"2900000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 18, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Versace Greca Goddess Silver-Tone Watch 28mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 70, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"34.00\", \"kha_nang_chong_nuoc\": \"Chống nước 30m\"}, {\"Gia\": \"6000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch1.png.webp\", \"mo_ta\": \"Vỏ và dây đeo bằng thép không gỉ tông màu bạc. Vành thép không gỉ tông màu bạc cố định. Mặt số màu xanh lam với kim màu bạc. Đầu Medusa đánh dấu vị trí 12 giờ. Các vạch phút xung quanh vành ngoài. Loại mặt số: Analog. Bộ máy thạch anh. Tinh thể sapphire chống xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật, kích thước vỏ: 27 x 45 mm, độ dày vỏ: 8 mm. Chiều rộng dây đeo: 18 mm. Triển khai bằng khóa bấm nút. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"5000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 16, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Medusa Pop Red-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 40, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"38.00\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}]', '2024-12-14 21:09:06', NULL),
(52, 'Van a', 'hoanga@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"6000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch1.png.webp\", \"mo_ta\": \"Vỏ và dây đeo bằng thép không gỉ tông màu bạc. Vành thép không gỉ tông màu bạc cố định. Mặt số màu xanh lam với kim màu bạc. Đầu Medusa đánh dấu vị trí 12 giờ. Các vạch phút xung quanh vành ngoài. Loại mặt số: Analog. Bộ máy thạch anh. Tinh thể sapphire chống xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật, kích thước vỏ: 27 x 45 mm, độ dày vỏ: 8 mm. Chiều rộng dây đeo: 18 mm. Triển khai bằng khóa bấm nút. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"5000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 0, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 16, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Medusa Pop Red-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 40, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"38.00\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}, {\"Gia\": \"3500000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-1.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu nâu. Vành thép không gỉ trơn cố định. Mặt số màu xanh với kim màu bạc phát sáng và số Ả Rập xen kẽ và các vạch chỉ giờ. Vạch chỉ phút. Kiểu mặt số: Analog. Kim và vạch chỉ giờ phát sáng. Hiển thị ngày và thứ trong tuần ở vị trí 3 giờ. Bộ máy tự động Seiko caliber 7S26, dựa trên Seiko 7002, chứa 21 Chân kính, hoạt động ở tần số 21600 vph và có khả năng dự trữ năng lượng khoảng 40 giờ. Kính Hardlex chống xước. Núm điều chỉnh kéo / đẩy. Nắp lưng trong suốt. Hình dạng vỏ đệm. Kích thước vỏ: 43,5 mm. Độ dày vỏ: 11,4 mm. Chiều rộng dây đeo: 24 mm. Khóa cài. Chống nước ở độ sâu 50 mét / 165 feet. Chức năng: ngày, thứ, giờ, phút, giây. Thông tin bổ sung: phù hợp cho thời gian bơi giải trí ngắn, nhưng không lặn hoặc lặn với ống thở. Dòng Recraft. Kiểu đồng hồ thường ngày. Nhãn đồng hồ: Japan Movt.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"2900000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 14, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SNKN37 Recraft Automatic Brown Leather Watch 43mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 60, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"44.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"4000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm1.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm2.png.webp\", \"mo_ta\": \"Kiểu chuyển động: Tự động lên dây cót bằng tay. Dự trữ năng lượng: Xấp xỉ 41 giờ\\r\\nChức năng: Chức năng dừng kim giây, Hiển thị Ngày/Thứ\\r\\nChất liệu vỏ: Thép không gỉ\\r\\nĐộ dày: 13,2mm. Đường kính: 39,4mm\\r\\nGắn vào gờ: 48,1mm. Pha lê: Hardlex cong\\r\\nChất liệu dây đeo: Nylon. Khả năng chống nước: 10 ATM\\r\\nTrọng lượng: 75,0g. Tính năng: Mặt sau trong suốt\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"3800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 12, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPH29K1 5 Sport Green Tone Watch 39.4mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 3, \"so_luong_ton_kho\": 75, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"45.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"30000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.png.webp\", \"mo_ta\": \"Đồng hồ Rolex sang trọng, thiết kế tinh tế.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"15000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 11, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Seiko SSC817P1 Prospex Chronograph Silver-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 50, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"7500000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-watch-36mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 36 mm, thép hàu và vàng trắng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n36 mm\\r\\nVật liệu\\r\\nRolesor trắng - sự kết hợp giữa thép hàu và vàng trắng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép bắt vít, khóa đôi\\r\\nPha lê\\r\\nThấu kính sapphire chống xước, cyclops theo ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc parachrom màu xanh thuận từ. Giảm xóc paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto vĩnh cửu\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nNăm Thánh, mắt xích năm mảnh\\r\\nVật liệu\\r\\nthép hàu\\r\\nmóc cài\\r\\nKẹp gấp có dây nối mở rộng thoải mái easylink 5 mm\\r\\nQuay số\\r\\nMàu xanh ô liu, họa tiết cọ\\r\\nChi tiết\\r\\nMàn hình ánh sáng màu dễ đọc với khả năng phát quang màu xanh lam bền lâu\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"5500000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 21, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust Watch 36MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 55, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 30m\"}, {\"Gia\": \"3200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-day-date-128236-0011-diamond-watch-36mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Đồng hồ Oyster Perpetual Day-Date 36 bằng bạch kim với mặt số màu ngọc lam, nạm kim cương, đai kính rãnh và dây đeo President.\\r\\n\\r\\nVỏ mẫu: Oyster, 36 mm, bạch kim\\r\\nCấu trúc Oyster: Vỏ giữa nguyên khối, mặt sau vỏ bắt vít và núm vặn lên dây\\r\\nĐường kính: 36 mm\\r\\nChất liệu: Bạch kim\\r\\nViền: Rãnh\\r\\nNúm lên dây: Hệ thống chống thấm nước kép Twinlock bắt vít\\r\\nPha lê: Sapphire chống xước, thấu kính Cyclops hiển thị ngày\\r\\nKhả năng chống nước: Chống nước tới 100 mét / 330 feet\\r\\nChuyển động: vĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng: 3255, Sản xuất Rolex\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"2800000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 24, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Day-Date 128236-0011 Diamond Watch 36mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 60, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"34.00\", \"kha_nang_chong_nuoc\": \"Chống nước 30m\"}, {\"Gia\": \"4200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-m126333-0011-oystersteel-watch-40mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 41 mm, Oystersteel và vàng vàng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n41mm\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép Twinlock bắt vít\\r\\nPha lê\\r\\nKính sapphire chống xước, thấu kính Cyclops lịch ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, Sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc Parachrom màu xanh thuận từ. Giảm xóc Paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto Perpetual\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nOyster, liên kết rắn ba mảnh\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nmóc cài\\r\\nKhóa Oysterclasp gập với mắt xích mở rộng tiện lợi Easylink 5 mm\\r\\nQuay số\\r\\nBộ màu rượu sâm panh đính kim cương\\r\\nCài đặt đá quý\\r\\nKim cương trên nền vàng 18 ct\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"3900000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 20, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust M126333-0011 Oystersteel Watch 41MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 90, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"2200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp\", \"mo_ta\": \"Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\\r\\n\\r\\nVỏ trong suốt màu hồng 44mm\\r\\nDây đeo silicon màu xanh lam/tím\\r\\nMặt đồng hồ màu đen mờ\\r\\n3 ATM\\r\\nKhóa Ardillon\\r\\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 17, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Icon Active Chronograph Colorful-Tone Watch 44mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 150, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"40.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}]', '2024-12-05 05:42:22', NULL),
(53, 'Van a', 'lee@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', 'aaaaaa', 'cod', 1, '[{\"Gia\": \"4200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-m126333-0011-oystersteel-watch-40mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 41 mm, Oystersteel và vàng vàng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n41mm\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép Twinlock bắt vít\\r\\nPha lê\\r\\nKính sapphire chống xước, thấu kính Cyclops lịch ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, Sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc Parachrom màu xanh thuận từ. Giảm xóc Paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto Perpetual\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nOyster, liên kết rắn ba mảnh\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nmóc cài\\r\\nKhóa Oysterclasp gập với mắt xích mở rộng tiện lợi Easylink 5 mm\\r\\nQuay số\\r\\nBộ màu rượu sâm panh đính kim cương\\r\\nCài đặt đá quý\\r\\nKim cương trên nền vàng 18 ct\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"3900000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 20, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust M126333-0011 Oystersteel Watch 41MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 90, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"2200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp\", \"mo_ta\": \"Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\\r\\n\\r\\nVỏ trong suốt màu hồng 44mm\\r\\nDây đeo silicon màu xanh lam/tím\\r\\nMặt đồng hồ màu đen mờ\\r\\n3 ATM\\r\\nKhóa Ardillon\\r\\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 17, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Icon Active Chronograph Colorful-Tone Watch 44mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 150, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"40.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}]', '2024-12-06 05:46:02', NULL),
(54, 'Van a', 'tuan@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', 'aaaaa', 'cod', 1, '[{\"Gia\": \"4200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-m126333-0011-oystersteel-watch-40mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 41 mm, Oystersteel và vàng vàng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n41mm\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép Twinlock bắt vít\\r\\nPha lê\\r\\nKính sapphire chống xước, thấu kính Cyclops lịch ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, Sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc Parachrom màu xanh thuận từ. Giảm xóc Paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto Perpetual\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nOyster, liên kết rắn ba mảnh\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nmóc cài\\r\\nKhóa Oysterclasp gập với mắt xích mở rộng tiện lợi Easylink 5 mm\\r\\nQuay số\\r\\nBộ màu rượu sâm panh đính kim cương\\r\\nCài đặt đá quý\\r\\nKim cương trên nền vàng 18 ct\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"3900000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 20, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust M126333-0011 Oystersteel Watch 41MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 90, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"2200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp\", \"mo_ta\": \"Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\\r\\n\\r\\nVỏ trong suốt màu hồng 44mm\\r\\nDây đeo silicon màu xanh lam/tím\\r\\nMặt đồng hồ màu đen mờ\\r\\n3 ATM\\r\\nKhóa Ardillon\\r\\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 2, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 17, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Icon Active Chronograph Colorful-Tone Watch 44mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 150, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"40.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"6000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch1.png.webp\", \"mo_ta\": \"Vỏ và dây đeo bằng thép không gỉ tông màu bạc. Vành thép không gỉ tông màu bạc cố định. Mặt số màu xanh lam với kim màu bạc. Đầu Medusa đánh dấu vị trí 12 giờ. Các vạch phút xung quanh vành ngoài. Loại mặt số: Analog. Bộ máy thạch anh. Tinh thể sapphire chống xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật, kích thước vỏ: 27 x 45 mm, độ dày vỏ: 8 mm. Chiều rộng dây đeo: 18 mm. Triển khai bằng khóa bấm nút. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"5000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 16, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Medusa Pop Red-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 40, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"38.00\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}, {\"Gia\": \"10000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-gold-tone-watch-28mm1.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-gold-tone-watch-28mm2.png.webp\", \"mo_ta\": \"Chiếc đồng hồ trang sức thanh lịch này được đặc trưng bởi thân vỏ nhỏ nhắn nữ tính được tô điểm bằng Medusa 3D ở vị trí 12 giờ. Chiếc đồng hồ nhỏ nhắn độc đáo này cực kỳ giàu chi tiết.\\r\\n\\r\\nVỏ vàng IP 28mm\\r\\nVòng đeo tay vàng IP\\r\\nMặt số Sunray bạc\\r\\n3 ATM\\r\\nKhóa Deployant\\r\\nBộ máy thạch anh 2 kim sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"8000000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 19, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Greca Goddess Gold-Tone Watch 28mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 3, \"so_luong_ton_kho\": 30, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"42.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"7500000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-watch-36mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 36 mm, thép hàu và vàng trắng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n36 mm\\r\\nVật liệu\\r\\nRolesor trắng - sự kết hợp giữa thép hàu và vàng trắng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép bắt vít, khóa đôi\\r\\nPha lê\\r\\nThấu kính sapphire chống xước, cyclops theo ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc parachrom màu xanh thuận từ. Giảm xóc paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto vĩnh cửu\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nNăm Thánh, mắt xích năm mảnh\\r\\nVật liệu\\r\\nthép hàu\\r\\nmóc cài\\r\\nKẹp gấp có dây nối mở rộng thoải mái easylink 5 mm\\r\\nQuay số\\r\\nMàu xanh ô liu, họa tiết cọ\\r\\nChi tiết\\r\\nMàn hình ánh sáng màu dễ đọc với khả năng phát quang màu xanh lam bền lâu\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"5500000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 21, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust Watch 36MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 55, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 30m\"}, {\"Gia\": \"3500000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-1.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu nâu. Vành thép không gỉ trơn cố định. Mặt số màu xanh với kim màu bạc phát sáng và số Ả Rập xen kẽ và các vạch chỉ giờ. Vạch chỉ phút. Kiểu mặt số: Analog. Kim và vạch chỉ giờ phát sáng. Hiển thị ngày và thứ trong tuần ở vị trí 3 giờ. Bộ máy tự động Seiko caliber 7S26, dựa trên Seiko 7002, chứa 21 Chân kính, hoạt động ở tần số 21600 vph và có khả năng dự trữ năng lượng khoảng 40 giờ. Kính Hardlex chống xước. Núm điều chỉnh kéo / đẩy. Nắp lưng trong suốt. Hình dạng vỏ đệm. Kích thước vỏ: 43,5 mm. Độ dày vỏ: 11,4 mm. Chiều rộng dây đeo: 24 mm. Khóa cài. Chống nước ở độ sâu 50 mét / 165 feet. Chức năng: ngày, thứ, giờ, phút, giây. Thông tin bổ sung: phù hợp cho thời gian bơi giải trí ngắn, nhưng không lặn hoặc lặn với ống thở. Dòng Recraft. Kiểu đồng hồ thường ngày. Nhãn đồng hồ: Japan Movt.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"2900000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 14, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SNKN37 Recraft Automatic Brown Leather Watch 43mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 60, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"44.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"10440000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-presage-cocktail-time-watch-38-5.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/seiko-luxshopping.png.webp\", \"mo_ta\": \"Đồng hồ Casio chính hãng, chống nước.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"9440000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 10, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPE43J1 Presage Cocktail Time Watch 38.5\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 100, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"40.50\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}]', '2024-12-07 05:48:20', NULL),
(55, 'tuan', 'tuan@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"10440000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-presage-cocktail-time-watch-38-5.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/seiko-luxshopping.png.webp\", \"mo_ta\": \"Đồng hồ Casio chính hãng, chống nước.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"9440000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 10, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPE43J1 Presage Cocktail Time Watch 38.5\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 100, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"40.50\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}]', '2024-12-08 05:51:12', NULL);
INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `trangthai`, `address`, `city`, `notes`, `paymentMethod`, `agreeTerms`, `checkoutCart`, `orderDate`, `ma_nguoi_dung`) VALUES
(56, 'kha', 'tuan@gmail.com', '0900099900', 'Giao hàng thành công', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"10440000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-presage-cocktail-time-watch-38-5.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/seiko-luxshopping.png.webp\", \"mo_ta\": \"Đồng hồ Casio chính hãng, chống nước.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"9440000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 10, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPE43J1 Presage Cocktail Time Watch 38.5\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 100, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"40.50\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}, {\"Gia\": \"5000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm2.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu xanh. Vành bezel cố định bằng thép không gỉ với pha lê. Mặt số lấp lánh màu bạc với kim màu xanh và các vạch chỉ giờ bằng đá quý. Loại mặt số: Analog. Bộ máy thạch anh Seiko caliber V115. Tinh thể Hardlex chống trầy xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật. Kích thước vỏ: 24,7 mm. Độ dày vỏ: 6 mm. Chiều rộng dây đeo: 12 mm. Khóa cài. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"2500000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 13, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SUP429P1 Essentials Silver Tone Watch 25mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 120, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"42.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"2300000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-deco-watch-38mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-deco-watch-38mm1.jpg.webp\", \"mo_ta\": \"Vỏ có hình dáng mới dành cho chiếc đồng hồ tôn vinh vẻ đẹp và sự quyến rũ của Medusa nổi trên mặt số. Nổi bật với thiết kế mang tính biểu tượng, chiếc đồng hồ cổ điển này có hình Medusa ba chiều trên mặt số guillochè. Vòng trên cùng được trang trí thêm với biểu tượng Greca để tăng cường kết nối với DNA của Versace.\\r\\nVỏ vàng 38mm\\r\\nDây đeo màu đỏ\\r\\nMặt số guilloche màu đỏ\\r\\n5 atm\\r\\nKhóa triển khai\\r\\nThạch anh 2 tay sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 24, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 15, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Versace Medusa Deco Watch 38mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 80, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"32.00\", \"kha_nang_chong_nuoc\": \"Chống nước 30m\"}, {\"Gia\": \"6000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch1.png.webp\", \"mo_ta\": \"Vỏ và dây đeo bằng thép không gỉ tông màu bạc. Vành thép không gỉ tông màu bạc cố định. Mặt số màu xanh lam với kim màu bạc. Đầu Medusa đánh dấu vị trí 12 giờ. Các vạch phút xung quanh vành ngoài. Loại mặt số: Analog. Bộ máy thạch anh. Tinh thể sapphire chống xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật, kích thước vỏ: 27 x 45 mm, độ dày vỏ: 8 mm. Chiều rộng dây đeo: 18 mm. Triển khai bằng khóa bấm nút. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"5000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 16, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Medusa Pop Red-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 40, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"38.00\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}, {\"Gia\": \"3100000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-silver-tone-watch-28mm1.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-silver-tone-watch-28mm3.png.webp\", \"mo_ta\": \"Chiếc đồng hồ trang sức thanh lịch này được đặc trưng bởi thân vỏ nhỏ nhắn nữ tính được tô điểm bằng Medusa 3D ở vị trí 12 giờ. Chiếc đồng hồ nhỏ nhắn độc đáo này cực kỳ giàu chi tiết.\\r\\n\\r\\nVỏ thép không gỉ 28mm\\r\\nVòng đeo tay bằng thép không gỉ\\r\\nMặt số Blue Sunray\\r\\n3 ATM\\r\\nKhóa Deployant\\r\\nBộ máy Quartz 2 kim sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 24, \"gia_giam\": \"2900000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 18, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Versace Greca Goddess Silver-Tone Watch 28mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 70, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"34.00\", \"kha_nang_chong_nuoc\": \"Chống nước 30m\"}, {\"Gia\": \"2800000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/omega-de-ville-red--tone-mini-tresor-watch-26-mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/omega-de-ville-red--tone-mini-tresor-watch-26-mm1.png.webp\", \"mo_ta\": \"Mẫu đồng hồ này bằng thép không gỉ có vỏ 26 mm với những viên kim cương cong thanh lịch dọc theo mỗi bên. Ngoài ra còn có một viên kim cương duy nhất được đính trên núm vặn, được bao quanh bởi một bông hoa gốm lai màu đỏ. Mặt số hình vòm được chế tác bằng men “Grand Feu” màu trắng đục và được tô điểm bằng các chữ số La Mã chuyển màu đỏ.\\r\\n\\r\\nĐường kính vỏ: 26 mm\\r\\nChất liệu vỏ: Thép\\r\\nVấu: 13 mm\\r\\nĐộ dày: 7,5 mm\\r\\nMàu mặt số: Trắng\\r\\nChất liệu dây đeo: Da cá sấu\\r\\nMàu dây đeo: Đỏ\\r\\nPha lê: Sapphire\\r\\nBộ máy: Thạch anh\\r\\nKhả năng chống nước: 3 ATM\\r\\nĐặc điểm: Kim cương\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"1800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 25, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Omega De Ville Red - Tone Mini Trésor Watch 26 mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 3, \"so_luong_ton_kho\": 80, \"chat_lieu_day_deo\": \"Nhựa\", \"duong_kinh_dong_ho\": \"50.00\", \"kha_nang_chong_nuoc\": \"Chống nước 200m\"}]', '2024-12-09 05:51:55', NULL),
(57, 'tai', 'tuan@gmail.com', '0900099900', 'Chờ xử lý', 'Viet nam', 'Bình Phước', '', 'cod', 1, '[{\"Gia\": \"5000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm2.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu xanh. Vành bezel cố định bằng thép không gỉ với pha lê. Mặt số lấp lánh màu bạc với kim màu xanh và các vạch chỉ giờ bằng đá quý. Loại mặt số: Analog. Bộ máy thạch anh Seiko caliber V115. Tinh thể Hardlex chống trầy xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật. Kích thước vỏ: 24,7 mm. Độ dày vỏ: 6 mm. Chiều rộng dây đeo: 12 mm. Khóa cài. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"2500000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 13, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SUP429P1 Essentials Silver Tone Watch 25mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 120, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"42.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}]', '2024-12-10 05:53:47', NULL),
(58, 'trung', 'trunhle36@gmail.com', '0372179063', 'Giao hàng thành công', '23/16', 'Cà Mau', '', 'cod', 1, '[{\"Gia\": \"5000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm2.png.webp\", \"mo_ta\": \"Vỏ thép không gỉ với dây đeo bằng da màu xanh. Vành bezel cố định bằng thép không gỉ với pha lê. Mặt số lấp lánh màu bạc với kim màu xanh và các vạch chỉ giờ bằng đá quý. Loại mặt số: Analog. Bộ máy thạch anh Seiko caliber V115. Tinh thể Hardlex chống trầy xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật. Kích thước vỏ: 24,7 mm. Độ dày vỏ: 6 mm. Chiều rộng dây đeo: 12 mm. Khóa cài. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"2500000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 13, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SUP429P1 Essentials Silver Tone Watch 25mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 120, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"42.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"30000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.png.webp\", \"mo_ta\": \"Đồng hồ Rolex sang trọng, thiết kế tinh tế.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"15000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 11, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Seiko SSC817P1 Prospex Chronograph Silver-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 50, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"4000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm1.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm2.png.webp\", \"mo_ta\": \"Kiểu chuyển động: Tự động lên dây cót bằng tay. Dự trữ năng lượng: Xấp xỉ 41 giờ\\r\\nChức năng: Chức năng dừng kim giây, Hiển thị Ngày/Thứ\\r\\nChất liệu vỏ: Thép không gỉ\\r\\nĐộ dày: 13,2mm. Đường kính: 39,4mm\\r\\nGắn vào gờ: 48,1mm. Pha lê: Hardlex cong\\r\\nChất liệu dây đeo: Nylon. Khả năng chống nước: 10 ATM\\r\\nTrọng lượng: 75,0g. Tính năng: Mặt sau trong suốt\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"3800000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 12, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPH29K1 5 Sport Green Tone Watch 39.4mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 3, \"so_luong_ton_kho\": 75, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"45.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"10440000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-presage-cocktail-time-watch-38-5.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/seiko-luxshopping.png.webp\", \"mo_ta\": \"Đồng hồ Casio chính hãng, chống nước.\", \"nam_nu\": \"Nam\", \"bao_hanh\": 12, \"gia_giam\": \"9440000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-23T11:35:12.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 10, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Seiko SRPE43J1 Presage Cocktail Time Watch 38.5\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 1, \"so_luong_ton_kho\": 100, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"40.50\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}, {\"Gia\": \"4200000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-m126333-0011-oystersteel-watch-40mm.png_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 41 mm, Oystersteel và vàng vàng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n41mm\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép Twinlock bắt vít\\r\\nPha lê\\r\\nKính sapphire chống xước, thấu kính Cyclops lịch ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, Sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc Parachrom màu xanh thuận từ. Giảm xóc Paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto Perpetual\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nOyster, liên kết rắn ba mảnh\\r\\nVật liệu\\r\\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\\r\\nmóc cài\\r\\nKhóa Oysterclasp gập với mắt xích mở rộng tiện lợi Easylink 5 mm\\r\\nQuay số\\r\\nBộ màu rượu sâm panh đính kim cương\\r\\nCài đặt đá quý\\r\\nKim cương trên nền vàng 18 ct\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"3900000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 20, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust M126333-0011 Oystersteel Watch 41MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 90, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}, {\"Gia\": \"7500000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-watch-36mm.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp\", \"mo_ta\": \"Hộp đựng mẫu\\r\\nOyster, 36 mm, thép hàu và vàng trắng\\r\\nKiến trúc hàu\\r\\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\\r\\nĐường kính\\r\\n36 mm\\r\\nVật liệu\\r\\nRolesor trắng - sự kết hợp giữa thép hàu và vàng trắng\\r\\nViền\\r\\nsáo\\r\\nVương miện uốn lượn\\r\\nHệ thống chống thấm kép bắt vít, khóa đôi\\r\\nPha lê\\r\\nThấu kính sapphire chống xước, cyclops theo ngày\\r\\nKhông thấm nước\\r\\nKhông thấm nước đến 100 mét / 330 feet\\r\\nSự chuyển động\\r\\nVĩnh viễn, cơ khí, tự lên dây\\r\\nCỡ nòng\\r\\n3235, sản xuất Rolex\\r\\nĐộ chính xác\\r\\n-2/+2 giây/ngày, sau khi đặt vỏ\\r\\nChức năng\\r\\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\\r\\nBộ dao động\\r\\nDây tóc parachrom màu xanh thuận từ. Giảm xóc paraflex hiệu suất cao\\r\\nQuanh co\\r\\nTự lên dây hai chiều thông qua rôto vĩnh cửu\\r\\ndự trữ năng lượng\\r\\nKhoảng 70 giờ\\r\\nVòng đeo tay\\r\\nNăm Thánh, mắt xích năm mảnh\\r\\nVật liệu\\r\\nthép hàu\\r\\nmóc cài\\r\\nKẹp gấp có dây nối mở rộng thoải mái easylink 5 mm\\r\\nQuay số\\r\\nMàu xanh ô liu, họa tiết cọ\\r\\nChi tiết\\r\\nMàn hình ánh sáng màu dễ đọc với khả năng phát quang màu xanh lam bền lâu\", \"nam_nu\": \"Nam\", \"bao_hanh\": 24, \"gia_giam\": \"5500000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 2, \"ma_san_pham\": 21, \"ma_chat_lieu\": 2, \"ten_san_pham\": \"Rolex Datejust Watch 36MM\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 55, \"chat_lieu_day_deo\": \"Da\", \"duong_kinh_dong_ho\": \"36.00\", \"kha_nang_chong_nuoc\": \"Chống nước 30m\"}, {\"Gia\": \"6000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch1.png.webp\", \"mo_ta\": \"Vỏ và dây đeo bằng thép không gỉ tông màu bạc. Vành thép không gỉ tông màu bạc cố định. Mặt số màu xanh lam với kim màu bạc. Đầu Medusa đánh dấu vị trí 12 giờ. Các vạch phút xung quanh vành ngoài. Loại mặt số: Analog. Bộ máy thạch anh. Tinh thể sapphire chống xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật, kích thước vỏ: 27 x 45 mm, độ dày vỏ: 8 mm. Chiều rộng dây đeo: 18 mm. Triển khai bằng khóa bấm nút. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"5000000.00\", \"kieu_may\": \"Cơ\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 1, \"ma_san_pham\": 16, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Medusa Pop Red-Tone Watch 39mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 2, \"so_luong_ton_kho\": 40, \"chat_lieu_day_deo\": \"Kim loại\", \"duong_kinh_dong_ho\": \"38.00\", \"kha_nang_chong_nuoc\": \"Chống nước 100m\"}, {\"Gia\": \"10000000.00\", \"hinh\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-gold-tone-watch-28mm1.jpg_980_980.webp\", \"hinh2\": \"https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-gold-tone-watch-28mm2.png.webp\", \"mo_ta\": \"Chiếc đồng hồ trang sức thanh lịch này được đặc trưng bởi thân vỏ nhỏ nhắn nữ tính được tô điểm bằng Medusa 3D ở vị trí 12 giờ. Chiếc đồng hồ nhỏ nhắn độc đáo này cực kỳ giàu chi tiết.\\r\\n\\r\\nVỏ vàng IP 28mm\\r\\nVòng đeo tay vàng IP\\r\\nMặt số Sunray bạc\\r\\n3 ATM\\r\\nKhóa Deployant\\r\\nBộ máy thạch anh 2 kim sản xuất tại Thụy Sĩ\", \"nam_nu\": \"Nữ\", \"bao_hanh\": 12, \"gia_giam\": \"8000000.00\", \"kieu_may\": \"Điện tử\", \"luot_xem\": 0, \"ngay_tao\": \"2024-10-24T01:28:59.000Z\", \"so_luong\": 1, \"binh_luan\": null, \"created_at\": null, \"deleted_at\": null, \"updated_at\": null, \"ma_danh_muc\": 3, \"ma_san_pham\": 19, \"ma_chat_lieu\": 1, \"ten_san_pham\": \"Versace Greca Goddess Gold-Tone Watch 28mm\", \"ma_khuyen_mai\": null, \"ma_thuong_hieu\": 3, \"so_luong_ton_kho\": 30, \"chat_lieu_day_deo\": \"Silicone\", \"duong_kinh_dong_ho\": \"42.00\", \"kha_nang_chong_nuoc\": \"Chống nước 50m\"}]', '2024-12-15 06:00:26', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `provinces`
--

CREATE TABLE `provinces` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
(1, 'Hà Nội'),
(2, 'Hồ Chí Minh'),
(3, 'Hải Phòng'),
(4, 'Đà Nẵng'),
(5, 'Cần Thơ'),
(6, 'An Giang'),
(7, 'Bà Rịa-Vũng Tàu'),
(8, 'Bắc Giang'),
(9, 'Bắc Kạn'),
(10, 'Bạc Liêu'),
(11, 'Bắc Ninh'),
(12, 'Bến Tre'),
(13, 'Bình Dương'),
(14, 'Bình Định'),
(15, 'Bình Phước'),
(16, 'Bình Thuận'),
(17, 'Cà Mau'),
(18, 'Cao Bằng'),
(19, 'Cần Thơ'),
(20, 'Đắk Lắk'),
(21, 'Đắk Nông'),
(22, 'Điện Biên'),
(23, 'Đồng Nai'),
(24, 'Đồng Tháp'),
(25, 'Gia Lai'),
(26, 'Hà Giang'),
(27, 'Hải Dương'),
(28, 'Hậu Giang'),
(29, 'Hòa Bình'),
(30, 'Hưng Yên'),
(31, 'Khánh Hòa'),
(32, 'Kiên Giang'),
(33, 'Kon Tum'),
(34, 'Lai Châu'),
(35, 'Lâm Đồng'),
(36, 'Lạng Sơn'),
(37, 'Lào Cai'),
(38, 'Long An'),
(39, 'Nam Định'),
(40, 'Nghệ An'),
(41, 'Ninh Bình'),
(42, 'Ninh Thuận'),
(43, 'Phú Thọ'),
(44, 'Phú Yên'),
(45, 'Quảng Bình'),
(46, 'Quảng Nam'),
(47, 'Quảng Ngãi'),
(48, 'Quảng Ninh'),
(49, 'Quảng Trị'),
(50, 'Sóc Trăng'),
(51, 'Sơn La'),
(52, 'Tây Ninh'),
(53, 'Thái Bình'),
(54, 'Thái Nguyên'),
(55, 'Thanh Hóa'),
(56, 'Thừa Thiên Huế'),
(57, 'Tiền Giang'),
(58, 'Trà Vinh'),
(59, 'Tuyên Quang'),
(60, 'Vĩnh Long'),
(61, 'Vĩnh Phúc'),
(62, 'Yên Bái');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `ma_san_pham` int NOT NULL,
  `ten_san_pham` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gia` decimal(15,2) DEFAULT NULL,
  `so_luong_ton_kho` int DEFAULT NULL,
  `hinh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hinh2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ma_danh_muc` int DEFAULT NULL,
  `ma_thuong_hieu` int DEFAULT NULL,
  `ma_chat_lieu` int DEFAULT NULL,
  `kieu_may` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `kha_nang_chong_nuoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `duong_kinh_dong_ho` decimal(5,2) DEFAULT NULL,
  `chat_lieu_day_deo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `nam_nu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `bao_hanh` int DEFAULT NULL,
  `gia_giam` decimal(15,2) DEFAULT NULL,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP,
  `ma_khuyen_mai` int DEFAULT NULL,
  `luot_xem` int NOT NULL DEFAULT '0',
  `mo_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `binh_luan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`ma_san_pham`, `ten_san_pham`, `Gia`, `so_luong_ton_kho`, `hinh`, `hinh2`, `ma_danh_muc`, `ma_thuong_hieu`, `ma_chat_lieu`, `kieu_may`, `kha_nang_chong_nuoc`, `duong_kinh_dong_ho`, `chat_lieu_day_deo`, `nam_nu`, `bao_hanh`, `gia_giam`, `ngay_tao`, `ma_khuyen_mai`, `luot_xem`, `mo_ta`, `created_at`, `updated_at`, `deleted_at`, `binh_luan`) VALUES
(10, 'Seiko SRPE43J1 Presage Cocktail Time Watch 38.5', 10440000.00, 100, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-presage-cocktail-time-watch-38-5.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/Images/seiko-luxshopping.png.webp', 1, 1, 1, 'Điện tử', 'Chống nước 100m', 40.50, 'Kim loại', 'Nam', 12, 9440000.00, '2024-10-23 18:35:12', NULL, 0, 'Đồng hồ Casio chính hãng, chống nước.', NULL, NULL, NULL, NULL),
(11, 'Seiko SSC817P1 Prospex Chronograph Silver-Tone Watch 39mm', 30000000.00, 50, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.jpg_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-prospex-chronograph-silver-tone-watch-39mm.png.webp', 2, 2, 2, 'Cơ', 'Chống nước 50m', 36.00, 'Da', 'Nam', 24, 15000000.00, '2024-10-23 18:35:12', NULL, 0, 'Đồng hồ Rolex sang trọng, thiết kế tinh tế.', NULL, NULL, NULL, NULL),
(12, 'Seiko SRPH29K1 5 Sport Green Tone Watch 39.4mm', 4000000.00, 75, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm1.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-5-sport-green-tone-watch-39-4mm2.png.webp', 3, 3, 1, 'Điện tử', 'Chống nước 50m', 45.00, 'Silicone', 'Nam', 12, 3800000.00, '2024-10-23 18:35:12', NULL, 0, 'Kiểu chuyển động: Tự động lên dây cót bằng tay. Dự trữ năng lượng: Xấp xỉ 41 giờ\r\nChức năng: Chức năng dừng kim giây, Hiển thị Ngày/Thứ\r\nChất liệu vỏ: Thép không gỉ\r\nĐộ dày: 13,2mm. Đường kính: 39,4mm\r\nGắn vào gờ: 48,1mm. Pha lê: Hardlex cong\r\nChất liệu dây đeo: Nylon. Khả năng chống nước: 10 ATM\r\nTrọng lượng: 75,0g. Tính năng: Mặt sau trong suốt', NULL, NULL, NULL, NULL),
(13, 'Seiko SUP429P1 Essentials Silver Tone Watch 25mm', 5000000.00, 120, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-essentials-silver-tone-watch-25mm2.png.webp', 1, 1, 1, 'Điện tử', 'Chống nước 50m', 42.00, 'Silicone', 'Nữ', 12, 2500000.00, '2024-10-24 08:28:59', NULL, 0, 'Vỏ thép không gỉ với dây đeo bằng da màu xanh. Vành bezel cố định bằng thép không gỉ với pha lê. Mặt số lấp lánh màu bạc với kim màu xanh và các vạch chỉ giờ bằng đá quý. Loại mặt số: Analog. Bộ máy thạch anh Seiko caliber V115. Tinh thể Hardlex chống trầy xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật. Kích thước vỏ: 24,7 mm. Độ dày vỏ: 6 mm. Chiều rộng dây đeo: 12 mm. Khóa cài. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút', NULL, NULL, NULL, NULL),
(14, 'Seiko SNKN37 Recraft Automatic Brown Leather Watch 43mm', 3500000.00, 60, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-recraft-automatic-brown-leather-watch-43mm-1.png.webp', 3, 2, 1, 'Điện tử', 'Chống nước 50m', 44.00, 'Silicone', 'Nam', 12, 2900000.00, '2024-10-24 08:28:59', NULL, 0, 'Vỏ thép không gỉ với dây đeo bằng da màu nâu. Vành thép không gỉ trơn cố định. Mặt số màu xanh với kim màu bạc phát sáng và số Ả Rập xen kẽ và các vạch chỉ giờ. Vạch chỉ phút. Kiểu mặt số: Analog. Kim và vạch chỉ giờ phát sáng. Hiển thị ngày và thứ trong tuần ở vị trí 3 giờ. Bộ máy tự động Seiko caliber 7S26, dựa trên Seiko 7002, chứa 21 Chân kính, hoạt động ở tần số 21600 vph và có khả năng dự trữ năng lượng khoảng 40 giờ. Kính Hardlex chống xước. Núm điều chỉnh kéo / đẩy. Nắp lưng trong suốt. Hình dạng vỏ đệm. Kích thước vỏ: 43,5 mm. Độ dày vỏ: 11,4 mm. Chiều rộng dây đeo: 24 mm. Khóa cài. Chống nước ở độ sâu 50 mét / 165 feet. Chức năng: ngày, thứ, giờ, phút, giây. Thông tin bổ sung: phù hợp cho thời gian bơi giải trí ngắn, nhưng không lặn hoặc lặn với ống thở. Dòng Recraft. Kiểu đồng hồ thường ngày. Nhãn đồng hồ: Japan Movt.', NULL, NULL, NULL, NULL),
(15, 'Versace Medusa Deco Watch 38mm', 2300000.00, 80, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-deco-watch-38mm.jpg_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-deco-watch-38mm1.jpg.webp', 2, 1, 2, 'Cơ', 'Chống nước 30m', 32.00, 'Da', 'Nữ', 24, 1800000.00, '2024-10-24 08:28:59', NULL, 0, 'Vỏ có hình dáng mới dành cho chiếc đồng hồ tôn vinh vẻ đẹp và sự quyến rũ của Medusa nổi trên mặt số. Nổi bật với thiết kế mang tính biểu tượng, chiếc đồng hồ cổ điển này có hình Medusa ba chiều trên mặt số guillochè. Vòng trên cùng được trang trí thêm với biểu tượng Greca để tăng cường kết nối với DNA của Versace.\r\nVỏ vàng 38mm\r\nDây đeo màu đỏ\r\nMặt số guilloche màu đỏ\r\n5 atm\r\nKhóa triển khai\r\nThạch anh 2 tay sản xuất tại Thụy Sĩ', NULL, NULL, NULL, NULL),
(16, 'Versace Medusa Pop Red-Tone Watch 39mm', 6000000.00, 40, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch.jpg_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-medusa-pop-silicone-watch1.png.webp', 1, 2, 1, 'Cơ', 'Chống nước 100m', 38.00, 'Kim loại', 'Nữ', 12, 5000000.00, '2024-10-24 08:28:59', NULL, 0, 'Vỏ và dây đeo bằng thép không gỉ tông màu bạc. Vành thép không gỉ tông màu bạc cố định. Mặt số màu xanh lam với kim màu bạc. Đầu Medusa đánh dấu vị trí 12 giờ. Các vạch phút xung quanh vành ngoài. Loại mặt số: Analog. Bộ máy thạch anh. Tinh thể sapphire chống xước. Núm vặn kéo / đẩy. Mặt sau vỏ chắc chắn. Hình dạng vỏ hình chữ nhật, kích thước vỏ: 27 x 45 mm, độ dày vỏ: 8 mm. Chiều rộng dây đeo: 18 mm. Triển khai bằng khóa bấm nút. Chống nước ở độ sâu 30 mét / 100 feet. Chức năng: giờ, phút', NULL, NULL, NULL, NULL),
(17, 'Versace Icon Active Chronograph Colorful-Tone Watch 44mm', 2200000.00, 150, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.jpg_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-icon-active-chronograph-colorful-tone-watch-44mm.png.webp', 1, 1, 1, 'Điện tử', 'Chống nước 50m', 40.00, 'Silicone', 'Nữ', 12, 1800000.00, '2024-10-24 08:28:59', NULL, 0, 'Chiếc đồng hồ sáng tạo nhất trong bộ sưu tập FW24 là chiếc Icon Active đầy màu sắc, tỏa sáng rực rỡ trong bóng tối, không chỉ mặt đồng hồ mà toàn bộ chiếc đồng hồ đều biến đổi trong bóng tối. Mặt đồng hồ màu hồng neon và xanh lá cây cho phép tạo ra vô số sự kết hợp nhờ dây đeo màu có thể thay đổi, đảm bảo sự độc đáo và phong cách.\r\n\r\nVỏ trong suốt màu hồng 44mm\r\nDây đeo silicon màu xanh lam/tím\r\nMặt đồng hồ màu đen mờ\r\n3 ATM\r\nKhóa Ardillon\r\nBộ máy thạch anh bấm giờ ngày sản xuất tại Thụy Sĩ', NULL, NULL, NULL, NULL),
(18, 'Versace Greca Goddess Silver-Tone Watch 28mm', 3100000.00, 70, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-silver-tone-watch-28mm1.jpg_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-silver-tone-watch-28mm3.png.webp', 2, 1, 2, 'Cơ', 'Chống nước 30m', 34.00, 'Da', 'Nữ', 24, 2900000.00, '2024-10-24 08:28:59', NULL, 0, 'Chiếc đồng hồ trang sức thanh lịch này được đặc trưng bởi thân vỏ nhỏ nhắn nữ tính được tô điểm bằng Medusa 3D ở vị trí 12 giờ. Chiếc đồng hồ nhỏ nhắn độc đáo này cực kỳ giàu chi tiết.\r\n\r\nVỏ thép không gỉ 28mm\r\nVòng đeo tay bằng thép không gỉ\r\nMặt số Blue Sunray\r\n3 ATM\r\nKhóa Deployant\r\nBộ máy Quartz 2 kim sản xuất tại Thụy Sĩ', NULL, NULL, NULL, NULL),
(19, 'Versace Greca Goddess Gold-Tone Watch 28mm', 10000000.00, 30, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-gold-tone-watch-28mm1.jpg_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/versace-greca-goddess-gold-tone-watch-28mm2.png.webp', 3, 3, 1, 'Điện tử', 'Chống nước 50m', 42.00, 'Silicone', 'Nữ', 12, 8000000.00, '2024-10-24 08:28:59', NULL, 0, 'Chiếc đồng hồ trang sức thanh lịch này được đặc trưng bởi thân vỏ nhỏ nhắn nữ tính được tô điểm bằng Medusa 3D ở vị trí 12 giờ. Chiếc đồng hồ nhỏ nhắn độc đáo này cực kỳ giàu chi tiết.\r\n\r\nVỏ vàng IP 28mm\r\nVòng đeo tay vàng IP\r\nMặt số Sunray bạc\r\n3 ATM\r\nKhóa Deployant\r\nBộ máy thạch anh 2 kim sản xuất tại Thụy Sĩ', NULL, NULL, NULL, NULL),
(20, 'Rolex Datejust M126333-0011 Oystersteel Watch 41MM', 4200000.00, 90, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-m126333-0011-oystersteel-watch-40mm.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp', 2, 2, 2, 'Cơ', 'Chống nước 50m', 36.00, 'Da', 'Nam', 24, 3900000.00, '2024-10-24 08:28:59', NULL, 0, 'Hộp đựng mẫu\r\nOyster, 41 mm, Oystersteel và vàng vàng\r\nKiến trúc hàu\r\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\r\nĐường kính\r\n41mm\r\nVật liệu\r\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\r\nViền\r\nsáo\r\nVương miện uốn lượn\r\nHệ thống chống thấm kép Twinlock bắt vít\r\nPha lê\r\nKính sapphire chống xước, thấu kính Cyclops lịch ngày\r\nKhông thấm nước\r\nKhông thấm nước đến 100 mét / 330 feet\r\nSự chuyển động\r\nVĩnh viễn, cơ khí, tự lên dây\r\nCỡ nòng\r\n3235, Sản xuất Rolex\r\nĐộ chính xác\r\n-2/+2 giây/ngày, sau khi đặt vỏ\r\nChức năng\r\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\r\nBộ dao động\r\nDây tóc Parachrom màu xanh thuận từ. Giảm xóc Paraflex hiệu suất cao\r\nQuanh co\r\nTự lên dây hai chiều thông qua rôto Perpetual\r\ndự trữ năng lượng\r\nKhoảng 70 giờ\r\nVòng đeo tay\r\nOyster, liên kết rắn ba mảnh\r\nVật liệu\r\nRolesor vàng - sự kết hợp giữa Oystersteel và vàng vàng\r\nmóc cài\r\nKhóa Oysterclasp gập với mắt xích mở rộng tiện lợi Easylink 5 mm\r\nQuay số\r\nBộ màu rượu sâm panh đính kim cương\r\nCài đặt đá quý\r\nKim cương trên nền vàng 18 ct', NULL, NULL, NULL, NULL),
(21, 'Rolex Datejust Watch 36MM', 7500000.00, 55, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-watch-36mm.jpg_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp', 2, 2, 2, 'Cơ', 'Chống nước 30m', 36.00, 'Da', 'Nam', 24, 5500000.00, '2024-10-24 08:28:59', NULL, 0, 'Hộp đựng mẫu\r\nOyster, 36 mm, thép hàu và vàng trắng\r\nKiến trúc hàu\r\nVỏ giữa nguyên khối, vỏ sau bắt vít và núm vặn lên dây\r\nĐường kính\r\n36 mm\r\nVật liệu\r\nRolesor trắng - sự kết hợp giữa thép hàu và vàng trắng\r\nViền\r\nsáo\r\nVương miện uốn lượn\r\nHệ thống chống thấm kép bắt vít, khóa đôi\r\nPha lê\r\nThấu kính sapphire chống xước, cyclops theo ngày\r\nKhông thấm nước\r\nKhông thấm nước đến 100 mét / 330 feet\r\nSự chuyển động\r\nVĩnh viễn, cơ khí, tự lên dây\r\nCỡ nòng\r\n3235, sản xuất Rolex\r\nĐộ chính xác\r\n-2/+2 giây/ngày, sau khi đặt vỏ\r\nChức năng\r\nKim giờ, phút và giây ở giữa. Ngày tức thời với cài đặt nhanh chóng. Dừng giây để cài đặt thời gian chính xác\r\nBộ dao động\r\nDây tóc parachrom màu xanh thuận từ. Giảm xóc paraflex hiệu suất cao\r\nQuanh co\r\nTự lên dây hai chiều thông qua rôto vĩnh cửu\r\ndự trữ năng lượng\r\nKhoảng 70 giờ\r\nVòng đeo tay\r\nNăm Thánh, mắt xích năm mảnh\r\nVật liệu\r\nthép hàu\r\nmóc cài\r\nKẹp gấp có dây nối mở rộng thoải mái easylink 5 mm\r\nQuay số\r\nMàu xanh ô liu, họa tiết cọ\r\nChi tiết\r\nMàn hình ánh sáng màu dễ đọc với khả năng phát quang màu xanh lam bền lâu', NULL, NULL, NULL, NULL),
(22, 'Rolex Datejust 126231-0031 Oystersteel 36MM', 6000000.00, 45, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-datejust-126231-0031-oystersteel-36mm.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp', 3, 3, 1, 'Điện tử', 'Chống nước 100m', 48.00, 'Silicone', 'Nam', 12, 5000000.00, '2024-10-24 08:28:59', NULL, 0, 'Rolex có bí quyết và thiết bị cần thiết để thường xuyên tạo ra diện mạo mới cho mặt số đồng hồ của mình.\r\n\r\nCác nhà thiết kế của thương hiệu đã sử dụng phương pháp hoàn thiện tia mặt trời truyền thống – một đặc điểm đặc trưng của mặt số Rolex – làm nền trên đó họa tiết được khắc bằng tia laser femto giây, sử dụng các xung điện từ siêu ngắn để đánh dấu tinh xảo bề mặt. Lấy cảm hứng từ thảm thực vật tươi tốt, họa tiết \'cây cọ\' mô tả những nhánh cọ có lá xếp chồng lên nhau tạo ra hiệu ứng ánh sáng và bóng râm.\r\nVành bezel dạng rãnh của Rolex là một dấu hiệu của sự khác biệt. Ban đầu, đường rãnh của đai kính Oyster có một mục đích chức năng: nó dùng để vặn đai kính vào vỏ giúp đảm bảo khả năng chống thấm nước của đồng hồ.\r\n\r\nDo đó, nó giống hệt với đường rãnh ở mặt sau vỏ, cũng được vặn vào vỏ để chống thấm nước bằng các công cụ cụ thể của Rolex. Theo thời gian, đường rãnh đã trở thành một yếu tố thẩm mỹ, một đặc điểm đặc trưng của Rolex. Ngày nay, vành bezel dạng rãnh là một điểm nhấn khác biệt, được làm bằng vàng trên chiếc Datejust 36 này.', NULL, NULL, NULL, NULL),
(24, 'Rolex Day-Date 128236-0011 Diamond Watch 36mm', 3200000.00, 60, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/rolex-day-date-128236-0011-diamond-watch-36mm.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/Images/rolex-luxshopping2.png.webp', 2, 2, 2, 'Cơ', 'Chống nước 30m', 34.00, 'Da', 'Nam', 24, 2800000.00, '2024-10-24 08:28:59', NULL, 0, 'Đồng hồ Oyster Perpetual Day-Date 36 bằng bạch kim với mặt số màu ngọc lam, nạm kim cương, đai kính rãnh và dây đeo President.\r\n\r\nVỏ mẫu: Oyster, 36 mm, bạch kim\r\nCấu trúc Oyster: Vỏ giữa nguyên khối, mặt sau vỏ bắt vít và núm vặn lên dây\r\nĐường kính: 36 mm\r\nChất liệu: Bạch kim\r\nViền: Rãnh\r\nNúm lên dây: Hệ thống chống thấm nước kép Twinlock bắt vít\r\nPha lê: Sapphire chống xước, thấu kính Cyclops hiển thị ngày\r\nKhả năng chống nước: Chống nước tới 100 mét / 330 feet\r\nChuyển động: vĩnh viễn, cơ khí, tự lên dây\r\nCỡ nòng: 3255, Sản xuất Rolex', NULL, NULL, NULL, NULL),
(25, 'Omega De Ville Red - Tone Mini Trésor Watch 26 mm', 2800000.00, 80, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/omega-de-ville-red--tone-mini-tresor-watch-26-mm.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/omega-de-ville-red--tone-mini-tresor-watch-26-mm1.png.webp', 3, 3, 1, 'Điện tử', 'Chống nước 200m', 50.00, 'Nhựa', 'Nữ', 12, 1800000.00, '2024-10-24 08:28:59', NULL, 0, 'Mẫu đồng hồ này bằng thép không gỉ có vỏ 26 mm với những viên kim cương cong thanh lịch dọc theo mỗi bên. Ngoài ra còn có một viên kim cương duy nhất được đính trên núm vặn, được bao quanh bởi một bông hoa gốm lai màu đỏ. Mặt số hình vòm được chế tác bằng men “Grand Feu” màu trắng đục và được tô điểm bằng các chữ số La Mã chuyển màu đỏ.\r\n\r\nĐường kính vỏ: 26 mm\r\nChất liệu vỏ: Thép\r\nVấu: 13 mm\r\nĐộ dày: 7,5 mm\r\nMàu mặt số: Trắng\r\nChất liệu dây đeo: Da cá sấu\r\nMàu dây đeo: Đỏ\r\nPha lê: Sapphire\r\nBộ máy: Thạch anh\r\nKhả năng chống nước: 3 ATM\r\nĐặc điểm: Kim cương', NULL, NULL, NULL, NULL),
(26, 'Omega De Ville Moonshine™ Gold Mini Trésor Watch 26mm', 4800000.00, 20, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/omega-de-ville-moonshine-gold-mini-tresor-watch-26mm2.png_980_980.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/omega-de-ville-moonshine-gold-mini-tresor-watch-26mm3.png.webp', 1, 2, 1, 'Cơ', 'Chống nước 50m', 40.00, 'Da', '', 12, 2800000.00, '2024-10-24 08:28:59', NULL, 0, 'Mẫu đồng hồ này bằng vàng Moonshine™ 18K có vỏ 26 mm với những viên kim cương cong thanh lịch dọc theo mỗi cạnh. Ngoài ra còn có một viên kim cương duy nhất được đính trên núm vặn, được bao quanh bởi một bông hoa gốm lai màu đỏ. Mặt số hình vòm được chế tác bằng vàng Moonshine™ 18K và được trình bày với họa tiết giống như lụa tương phản với kim cương đánh bóng và số La Mã nổi.\r\n\r\nĐường kính vỏ: 26 mm\r\nChất liệu vỏ: Vàng Moonshine™\r\nVấu: 13 mm\r\nĐộ dày: 7,5 mm\r\nMàu mặt số: Vàng\r\nChất liệu dây đeo: Da cá sấu\r\nMàu dây đeo: Xanh lá cây\r\nPha lê: Sapphire\r\nBộ máy: Thạch anh\r\nKhả năng chống nước: 3 ATM\r\nĐặc điểm: Kim cương', NULL, NULL, NULL, NULL),
(30, 'aaaa', 1112321.00, 22, 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-presage-automatic-blue-watch-47mm.png_540_660.webp', 'https://cdn.luxshopping.vn/Thumnails/Uploads/News/seiko-presage-automatic-blue-watch-47mm.png_540_660.webp', 1, 1, 1, 'đasa', 'có', 113.00, 'aaa', 'nam', 12, 2222.00, '2024-11-23 08:26:16', NULL, 0, '1sdsadadsad', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `ma_thanh_toan` int NOT NULL,
  `ma_don_hang` int DEFAULT NULL,
  `phuong_thuc_thanh_toan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ngay_thanh_toan` date DEFAULT NULL,
  `trang_thai_thanh_toan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `ma_thuong_hieu` int NOT NULL,
  `ten_thuong_hieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quoc_gia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mo_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `thuonghieu`
--

INSERT INTO `thuonghieu` (`ma_thuong_hieu`, `ten_thuong_hieu`, `quoc_gia`, `mo_ta`) VALUES
(1, 'G-shock', 'Nhật Bản', 'G-Shock là một trong những thương hiệu đồng hồ nổi tiếng của Casio, đây là một công ty đồng hồ hàng đầu có nguồn gốc tại Nhật Bản. '),
(2, 'Casio', 'Nhật Bản', 'chuyên sản xuất các loại đồng hồ điện tử, đồng hồ thể thao, đồng hồ thông minh và nhiều sản phẩm khác.'),
(3, 'Rolex', 'Anh', 'là một trong những thương hiệu đồng hồ xa xỉ nổi tiếng nhất trên thế giới, được biết đến với sự tinh xảo, độ chính xác tuyệt đối và thiết kế sang trọng.'),
(5, 'Orient', 'Nhật Bản', ' là một thương hiệu đồng hồ cao cấp nổi tiếng của Nhật Bản'),
(6, 'Anne Klein', 'Mỹ', 'Nếu bạn là cô gái yêu thích sự năng động, trẻ trung, nhưng lại không muốn cầu kì, thích đơn giản, thanh lịch thì chắc chắn bạn sẽ hài lòng với sản phẩm của hãng.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`ma_binh_luan`),
  ADD KEY `ma_san_pham` (`ma_san_pham`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `chatlieu`
--
ALTER TABLE `chatlieu`
  ADD PRIMARY KEY (`ma_chat_lieu`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`ma_chi_tiet_don_hang`),
  ADD KEY `ma_don_hang` (`ma_don_hang`),
  ADD KEY `ma_san_pham` (`ma_san_pham`);

--
-- Chỉ mục cho bảng `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  ADD PRIMARY KEY (`ma_danh_muc`);

--
-- Chỉ mục cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD PRIMARY KEY (`ma_danh_gia`),
  ADD KEY `ma_san_pham` (`ma_san_pham`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `danh_gia_san_pham`
--
ALTER TABLE `danh_gia_san_pham`
  ADD PRIMARY KEY (`ma_danh_gia`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`),
  ADD KEY `ma_san_pham` (`ma_san_pham`);

--
-- Chỉ mục cho bảng `danh_sach_yeu_thich`
--
ALTER TABLE `danh_sach_yeu_thich`
  ADD PRIMARY KEY (`ma_danh_sach_yeu_thich`),
  ADD KEY `ma_san_pham` (`ma_san_pham`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`ma_don_hang`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`ma_khuyen_mai`),
  ADD KEY `ma_san_pham` (`ma_san_pham`);

--
-- Chỉ mục cho bảng `kien_thuc_dong_ho`
--
ALTER TABLE `kien_thuc_dong_ho`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lich_su_dat_hang`
--
ALTER TABLE `lich_su_dat_hang`
  ADD PRIMARY KEY (`ma_lich_su_dat_hang`),
  ADD UNIQUE KEY `ma_nguoi_dung` (`ma_nguoi_dung`,`ma_don_hang`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`ma_san_pham`),
  ADD KEY `ma_danh_muc` (`ma_danh_muc`),
  ADD KEY `ma_thuong_hieu` (`ma_thuong_hieu`),
  ADD KEY `ma_chat_lieu` (`ma_chat_lieu`);

--
-- Chỉ mục cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`ma_thanh_toan`),
  ADD UNIQUE KEY `ma_don_hang` (`ma_don_hang`);

--
-- Chỉ mục cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`ma_thuong_hieu`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `ma_binh_luan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `chatlieu`
--
ALTER TABLE `chatlieu`
  MODIFY `ma_chat_lieu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `ma_chi_tiet_don_hang` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  MODIFY `ma_danh_muc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  MODIFY `ma_danh_gia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_gia_san_pham`
--
ALTER TABLE `danh_gia_san_pham`
  MODIFY `ma_danh_gia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_sach_yeu_thich`
--
ALTER TABLE `danh_sach_yeu_thich`
  MODIFY `ma_danh_sach_yeu_thich` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `ma_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `ma_khuyen_mai` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `kien_thuc_dong_ho`
--
ALTER TABLE `kien_thuc_dong_ho`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `ma_nguoi_dung` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `ma_san_pham` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `ma_thuong_hieu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`ma_san_pham`),
  ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`ma_don_hang`) REFERENCES `donhang` (`ma_don_hang`),
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`ma_san_pham`);

--
-- Các ràng buộc cho bảng `danh_gia_san_pham`
--
ALTER TABLE `danh_gia_san_pham`
  ADD CONSTRAINT `danh_gia_san_pham_ibfk_1` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `danh_gia_san_pham_ibfk_2` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`ma_san_pham`);

--
-- Các ràng buộc cho bảng `danh_sach_yeu_thich`
--
ALTER TABLE `danh_sach_yeu_thich`
  ADD CONSTRAINT `danh_sach_yeu_thich_ibfk_1` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`ma_san_pham`),
  ADD CONSTRAINT `danh_sach_yeu_thich_ibfk_2` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);

--
-- Các ràng buộc cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD CONSTRAINT `khuyenmai_ibfk_1` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`ma_san_pham`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_ma_nguoi_dung` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`ma_danh_muc`) REFERENCES `danhmucsanpham` (`ma_danh_muc`),
  ADD CONSTRAINT `san_pham_ibfk_2` FOREIGN KEY (`ma_thuong_hieu`) REFERENCES `thuonghieu` (`ma_thuong_hieu`),
  ADD CONSTRAINT `san_pham_ibfk_3` FOREIGN KEY (`ma_chat_lieu`) REFERENCES `chatlieu` (`ma_chat_lieu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
