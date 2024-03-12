-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2024 at 10:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgucoffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_Image` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `category_Image`) VALUES
(1, 'Cafe', 'https://www.shutterstock.com/image-vector/vector-sketch-illustration-cup-coffee-600nw-169482620.jpg'),
(2, 'Frosty', 'https://img.freepik.com/premium-vector/dessert-plastic-cup-with-cream-straw_532041-52.jpg'),
(3, 'Tea', 'https://img.freepik.com/free-vector/coffee-cup-draw-dish-illustration-isolated_24911-114425.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1708300800&semt=ais'),
(4, 'Bakery', 'https://static.vecteezy.com/system/resources/thumbnails/025/866/868/small_2x/isolate-black-and-white-hand-drawing-chocolate-cake-vector.jpg'),
(5, 'Other', 'https://static.vecteezy.com/system/resources/previews/004/682/029/original/a-bowl-of-noodles-illustrated-in-hand-drawn-style-a-food-illustration-isolated-on-white-uncolored-drawing-of-the-eastern-dish-suitable-for-decorative-element-design-free-vector.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `address` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `country` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fullname` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `payment_method` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `description` varchar(11111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_selling` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `product_name` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `created_at`, `description`, `is_active`, `is_selling`, `price`, `product_name`, `quantity`, `sold`, `category_id`) VALUES
(1, '2024-01-23', 'Cà phê đen, thức uống dành cho người trưởng thành', 1, 1, 25000, 'Cafe Đen', 200, 15, 1),
(2, '2022-11-21', 'Không chỉ là một thức uống, cà phê sữa còn là một phần của cuộc sống xã hội.', 1, 1, 27000, 'Cafe Sữa', 100, 10, 1),
(3, '2022-11-11', 'Một chút đậm đà hơn so với Latte, Cappuccino của chúng tôi bắt đầu với cà phê espresso, sau đó thêm một lượng tương đương giữa sữa tươi và bọt sữa cho thật hấp dẫn. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 1, 1, 45000, 'Cappuchino', 100, 20, 1),
(4, '2022-03-30', 'Americano là sự kết hợp giữa cà phê espresso thêm vào nước đun sôi. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 1, 1, 30000, 'Americano', 100, 90, 1),
(5, '2022-12-09', 'Đích thực là ly cà phê espresso ngon đậm đà! Được chiết xuất một cách hoàn hảo từ loại cà phê rang được phối trộn độc đáo từ những hạt cà phê Robusta và Arabica chất lượng hảo hạng.', 1, 1, 45000, 'Espresso', 100, 80, 1),
(6, '2022-11-03', 'Một thức uống dành cho người căng thẳng', 1, 1, 28000, 'Bạc Xỉu Đá', 100, 130, 1),
(7, '2022-11-21', 'Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào.', 1, 1, 69000, 'Caramel Macchiato', 100, 20, 1),
(8, '2022-01-21', 'Latte của chúng tôi bắt đầu với cà phê espresso, sau đó thêm sữa tươi và bọt sữa một cách đầy nghệ thuật. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 1, 1, 65000, 'Latte', 100, 70, 1),
(9, '2022-10-02', 'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà mang thương hiệu Highlands Coffee. ', 1, 1, 69000, 'Mocha Macchiato', 100, 20, 1),
(10, '2022-10-10', 'Chỉ 2 phút có ngay ly Trà sữa trân châu ngon chuẩn vị quán. Thơm vị trà, béo vị sữa, cùng trân châu thật giòn dai sật sật. Đặc biệt, đây còn là thức uống tốt cho sức khoẻ nhờ thành phần 100% chiết xuất trà tự nhiên, không chất hoá học.', 1, 1, 38000, 'Trà Sữa Trân Châu Tearoma 250g', 100, 90, 3),
(11, '2022-03-09', 'Được chiết xuất từ 100% trà tự nhiên, không phẩm màu tổng hợp, Trà vị Đào Tearoma mang đến cảm giác thanh mát cực đã. Nhấp một ngụm, cảm nhận trọn vị đào chua ngọt thơm ngon bùng nổ. Ngoài ra, trà còn bổ sung vitamin C cực kỳ có lợi cho sức khoẻ.\r\n\r\n', 1, 1, 32000, 'Trà Vị Đào Tearoma', 100, 10, 3),
(12, '2022-10-10', 'Thổi bùng sảng khoái cùng Trà vị Tắc Mật Ong Tearoma không phẩm màu tổng hợp. Chiết xuất từ 100% trà tự nhiên, bổ sung vitamin C tốt cho sức khoẻ. Vị tắc chua chua hoà cùng mật ong ngọt dịu giúp bật vị giác, bừng vị mát tức thì.', 1, 1, 32000, 'Trà Vị Tắc Mật Ong Tearoma', 100, 75, 3),
(13, '2022-10-09', 'Đá Xay Frosty Phin-Gato là lựa chọn không thể bỏ lỡ cho tín đồ cà phê. Cà phê nguyên chất pha phin truyền thống, thơm đậm đà, đắng mượt mà, quyện cùng kem sữa béo ngậy và đá xay mát lạnh. Nhân đôi vị cà phê nhờ có thêm thạch cà phê đậm đà, giòn dai. Thức uống khơi ngay sự tỉnh táo tức thì. Lưu ý: Khuấy đều phần đá xay trước khi dùng', 1, 1, 55000, 'Frosty Phin Gato', 100, 90, 2),
(14, '2022-11-07', 'Đá Xay Frosty Cà Phê Đường Đen mát lạnh, sảng khoái ngay từ ngụm đầu tiên nhờ sự kết hợp vượt chuẩn vị quen giữa Espresso đậm đà và Đường Đen ngọt thơm. Đặc biệt, whipping cream beo béo cùng thạch cà phê giòn dai, đậm vị nhân đôi sự hấp dẫn, khơi bừng sự hứng khởi trong tích tắc.', 1, 1, 59000, 'Frosty Cà Phê Đường Đen', 100, 20, 2),
(15, '2022-11-06', 'Caramel ngọt thơm quyện cùng cà phê Arabica Cầu Đất đượm hương gỗ thông, hạt dẻ và nốt sô cô la đặc trưng tạo nên Đá Xay Frosty Caramel Arabica độc đáo chỉ có tại Nhà. Cực cuốn với lớp whipping cream béo mịn, thêm thạch cà phê giòn ngon bắt miệng.', 1, 1, 59000, 'Frosty Caramel Arabica', 100, 200, 2),
(16, '2022-10-17', 'Tiêu điểm sáng (theo thời giá)', 1, 1, 35000, 'Bánh Mì', 100, 200, 5),
(17, '2022-09-11', 'Tiêu điểm sáng (theo thời giá)', 1, 1, 65000, 'Phở Bò', 100, 10, 5),
(18, '2022-01-18', 'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân phúc bồn tử ngọt ngào. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', 1, 1, 19000, 'Bánh Mochi Kem Phúc Bồn Tử', 100, 20, 4),
(19, '2022-08-04', 'Một sự kết hợp khéo léo giữa kem và lớp bánh mềm, được phủ lên trên vài lát đào ngon tuyệt.', 1, 1, 35000, 'Bánh Mousse Đào', 100, 80, 4),
(20, '2022-11-11', 'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân việt quất đặc trưng thơm thơm, ngọt dịu. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', 1, 1, 35000, 'Bánh Mochi Kem Việt Quất', 100, 50, 4),
(21, '2022-10-10', 'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân dừa dứa thơm lừng lạ miệng. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', 1, 1, 35000, 'Bánh Mochi Kem Dừa Dứa', 100, 10, 4),
(22, '2022-10-10', 'Vị béo của phô mai cùng với vị chua của chanh dây, tạo nên chiếc bánh thơm ngon hấp dẫn!', 1, 1, 30000, 'Bánh Phô Mai Chanh Dây', 100, 10, 4),
(23, '2022-07-29', 'Một sự sáng tạo mới mẻ, kết hợp giữa trà xanh đậm đà và phô mai ít béo.', 1, 1, 35000, 'Bánh Phô Mai Trà Xanh', 100, 20, 4),
(24, '2022-10-30', 'Ngon khó cưỡng! Bánh phô mai thơm béo được phủ bằng lớp caramel ngọt ngào.', 1, 1, 35000, 'Bánh Caramel Phô Mai', 100, 20, 4),
(25, '2022-09-12', 'Tiramisu thơm béo, làm từ ca-cao Việt Nam đậm đà, kết hợp với phô mai ít béo, vani và chút rum nhẹ nhàng.', 1, 1, 35000, 'Bánh Tiramisu', 100, 100, 4),
(26, '2022-10-29', 'Thức uống từ quả dừa', 1, 1, 35000, 'Dừa Tươi', 100, 70, 5),
(27, '2022-07-24', 'Aquavina', 1, 1, 15000, 'Nước Suối Aquavina', 100, 50, 5),
(28, '2022-05-23', 'Cà phê trứng là sự kết hợp giữa vị đắng của cà phê và sự ngọt ngào, béo ngậy của lòng đỏ trứng gà, đường và sữa đặc. Đồ uống này mang đến trải nghiệm hương vị độc đáo, là một biểu tượng của ẩm thực Việt Nam.', 1, 1, 55000, 'Cà phê Trứng', 100, 90, 1),
(29, '2022-03-09', 'Cà phê cốt dừa là một biến thể độc đáo của cà phê, nơi hương vị thơm ngon của dừa tươi và cà phê hòa quyện, tạo ra trải nghiệm đắm chìm trong hương thơm đặc trưng của ẩm thực Việt Nam.', 1, 1, 55000, 'Cà phê Cốt Dừa', 100, 100, 1),
(30, '2024-02-08', 'Tiêu điểm sáng (theo thời giá)', 1, 1, 40000, 'Mì Bò', 200, 310, 5),
(31, '2022-08-04', 'Đá me', 1, 1, 55000, 'Đá Me', 100, 10, 5),
(32, '2022-12-14', 'Thức uống từ trái dưa hấu', 1, 1, 35000, 'Ép dưa hấu', 100, 90, 5),
(33, '2022-11-16', 'Thức uống được làm ra bằng cách ép trái thơm.', 1, 1, 35000, 'Ép Thơm', 100, 20, 5),
(34, '2022-10-23', 'Thức uống có thể giảm cân', 1, 1, 35000, 'Ép Carot', 100, 70, 5),
(35, '2022-03-25', 'Thức uống tươi mát từ quả cam', 1, 1, 35000, 'Ép Cam', 100, 90, 5),
(36, '2022-01-19', 'Thức uống ép từ táo', 1, 1, 35000, 'Ép Táo', 100, 78, 5),
(37, '2022-01-15', 'Thức uống ép từ ổi', 1, 1, 35000, 'Ép Ổi', 100, 120, 5),
(38, '2022-07-04', 'Thức uống ép từ bưởi', 1, 1, 35000, 'Ép Bưởi', 100, 30, 5),
(39, '2022-05-30', 'Sinh tố bơ', 1, 1, 55000, 'Sinh tố Bơ', 40, 50, 5),
(40, '2022-01-29', 'Sinh tố mẵng cầu', 1, 1, 55000, 'Sinh tố Mẵng Cầu', 80, 70, 5),
(41, '2022-09-27', 'Sinh tố xoài', 1, 1, 55000, 'Sinh tố Xoài', 100, 10, 5),
(42, '2022-04-06', 'Sinh tố dâu tây', 1, 1, 55000, 'Sinh tố Dâu Tây', 100, 20, 5),
(43, '2022-03-30', 'Sinh tố thanh long', 1, 1, 55000, 'Sinh tố Thanh Long', 100, 90, 5),
(44, '2022-04-15', 'Trà đào', 1, 1, 35000, 'Trà Đào', 100, 10, 3),
(45, '2022-08-16', 'Trà đào dâu', 1, 1, 45000, 'Trà Đào Dâu', 100, 50, 3),
(46, '2022-03-11', 'Thức uống được làm từ những quả dưa lưới', 1, 1, 55000, 'Ép Dưa Lưới', 100, 500, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `url_image` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `url_image`, `product_id`) VALUES
(1, 'https://cafebuivan.com.vn/thumbs/500x470x2/upload/product/ca-phe-den-da-1362.png', 1),
(2, 'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-asm/posts/uong-ca-phe-den-2.webp', 1),
(3, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-den-da_4.jpg', 1),
(4, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-den-da_7.jpg', 1),
(5, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-sua-da_3.jpg', 2),
(6, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-sua-da_8.jpg', 2),
(7, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-sua-da_10.jpg', 2),
(8, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-sua-da_17.jpg', 2),
(9, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-capuchino_2.jpg', 3),
(10, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-capuchino_3.jpg', 3),
(11, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-capuchino_5.jpg', 3),
(12, 'https://thuytinhocean.net/wp-content/uploads/2023/07/hinh-anh-ly-cafe-capuchino_6.jpg', 3),
(13, 'https://cdn.tgdd.vn/2021/11/CookDish/americano-la-gi-nguon-goc-cach-pha-americano-don-gian-va-avt-1200x676.jpg', 4),
(14, 'https://www.acouplecooks.com/wp-content/uploads/2022/01/Iced-Americano-008.jpg', 4),
(15, 'https://www.acouplecooks.com/wp-content/uploads/2022/01/Iced-Americano-010.jpg', 4),
(16, 'https://www.acouplecooks.com/wp-content/uploads/2022/01/Iced-Americano-004.jpg', 4),
(17, 'https://vuanem.com/blog/wp-content/uploads/2022/12/cach-pha-espresso-1.jpg', 5),
(18, 'https://vuanem.com/blog/wp-content/uploads/2022/12/espresso-la-gi.jpg', 5),
(19, 'https://product.hstatic.net/1000075078/product/espressonong_612688_41d0812d5efb47aaaebaea91a3b206db.jpg', 5),
(20, 'https://product.hstatic.net/1000075078/product/1645968236_espresso-nong-lifestyle_7dbb993a70414756b17c62965bd57c34.jpg', 5),
(21, 'https://product.hstatic.net/1000075078/product/1639377904_bac-siu_525b9fa5055b41f183088c8e479a9472.jpg', 6),
(22, 'https://product.hstatic.net/1000075078/product/1645962337_bac-siu-da-2_e2c96c8ab5f44365bfbc32b0849c0f62.png', 6),
(23, 'https://cdn.tgdd.vn/2021/03/CookProduct/Bac-xiu-la-gi-nguon-goc-va-cach-lam-bac-xiu-thom-ngon-don-gian-tai-nha-0-1200x676.jpg', 6),
(24, 'https://cdn.tgdd.vn/2021/03/content/13-800x549.jpg', 6),
(25, 'https://product.hstatic.net/1000075078/product/caramel-macchiato_143623_0e070a39d0e54e808db4d91049430b51.jpg', 7),
(26, 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/caa21cd668b93fadaad07fefc530ace5/Derivates/6b93b4ab826fe249292790890b8f2e96d6f6f1b4.jpg', 7),
(27, 'https://vndhomecoffee.com/public/uploads/images/2018/12/caramel-macchiato-1545377631.jpg', 7),
(28, 'https://vietblend.vn/wp-content/uploads/2018/12/caramel-macchiato_830x550.jpg', 7),
(29, 'https://product.hstatic.net/1000075078/product/latte-da_438410_ff2be8d76067434385f8e27b33fed780.jpg', 8),
(30, 'https://product.hstatic.net/1000075078/product/latte_851143_377d5e11c1e145a8bf5f82a64047e60d.jpg', 8),
(31, 'https://cdn.tgdd.vn/2021/09/CookProduct/Cafe-latte-la-gi-latte-va-cupuchino-co-gi-khac-cac-loai-cach-pha-latte-0-1200x676.jpg', 8),
(32, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Latte_art_3.jpg/1200px-Latte_art_3.jpg', 8),
(33, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Mocha_coffee.jpg/900px-Mocha_coffee.jpg', 9),
(34, 'https://lifeboostcoffee.com/cdn/shop/articles/mocha_cloud_macchiato.jpg?v=1657168427', 9),
(35, 'https://cdn.shopify.com/s/files/1/0838/4525/files/iced_mocha_cloud_macchiato_9242c59b-cca1-400b-a602-b35069816021_1024x1024.jpg?v=1657167871', 9),
(36, 'https://giacaphe.com/wp-content/uploads/2011/04/latte-macchiato.jpg', 9),
(37, 'https://product.hstatic.net/1000075078/product/1669880647_bg-trasua-min_692fe6532d03400f89496332672dfe50.jpg', 10),
(38, 'https://cdn.tgdd.vn/Products/Images/2385/306510/bhx/tra-sua-tran-chau-tearoma-truyen-thong-hop-250g-5-goi-tra-sua-22g-5-goi-tran-chau-28g-202305091525304684.jpg', 10),
(39, 'https://cdn.tgdd.vn/Products/Images/2385/306510/bhx/tra-sua-tran-chau-tearoma-truyen-thong-hop-250g-5-goi-tra-sua-22g-5-goi-tran-chau-28g-202305091525308135.jpg', 10),
(40, 'https://cdn.tgdd.vn/Products/Images/2385/306510/bhx/tra-sua-tran-chau-tearoma-truyen-thong-hop-250g-5-goi-tra-sua-22g-5-goi-tran-chau-28g-202305091525314597.jpg', 10),
(41, 'https://product.hstatic.net/1000075078/product/1669706771_bg-tradao-min_28c767bc07194739999efe07f15e8ad6.jpg', 11),
(42, 'https://product.hstatic.net/200000408617/product/dao_2_ce206d12832f4296bcaf31ad166325c6_master.png', 11),
(43, 'https://product.hstatic.net/200000408617/product/220715_cpg_ft_7oa-10_486f23496bd04037a62ee41cd868ca21_master.jpg', 11),
(44, 'https://product.hstatic.net/200000408617/product/220715_cpg_ft_7oa-09_2f3426b4ff4c447f9a453c5893996d57_master.jpg', 11),
(45, 'https://product.hstatic.net/1000075078/product/1669706748_bg-tratatmatong-min_2526ca4468ae4ba9bffebc69567ed68a.jpg', 12),
(46, 'https://product.hstatic.net/200000408617/product/220715_cpg_ft_7oa-01_7725e8dc2e7a4b3f8170bb2094e35b26_master.jpg', 12),
(47, 'https://product.hstatic.net/200000408617/product/220715_cpg_ft_7oa-03_0fa427a6e9794c4ba1666a226934f53f_master.jpg', 12),
(48, 'https://product.hstatic.net/200000408617/product/220715_cpg_ft_7oa-04_c40cdfe01cf24827b11fd5e2a09f2a09_master.jpg', 12),
(49, 'https://product.hstatic.net/1000075078/product/1697441914_phin-gato_304446dce9ec4fe0a5527536b93f6eda.png', 13),
(53, 'https://product.hstatic.net/1000075078/product/1697441939_ca-phe-duong-den_684615fd8fce40c2a1f6a03e0555fe62.png', 14),
(57, 'https://product.hstatic.net/1000075078/product/1697441933_caramel-arabica_64cd3e11a9904076b7a64e24d6d20f21.png', 15),
(61, 'https://diemdungchandongthap.com/wp-content/uploads/2021/06/banh-my-768x576.jpg', 16),
(62, 'https://cdn.tgdd.vn/2021/05/CookProduct/Banh-Mi-Bo-Nuong-Sa-(Vietnamese-Beef-Banh-Mi)-6-5-screenshot-1200x676.jpg', 16),
(63, 'https://cdn.tgdd.vn/Files/2022/05/18/1433515/cach-lam-banh-mi-thit-nguoi-gion-ngon-hap-dan-nhu-ngoai-hang-202205182236528024.jpg', 16),
(64, 'https://thanhnien.mediacdn.vn/Uploaded/trantam/2022_11_17/anh-chup-man-hinh-2022-10-07-luc-172838-4541-9511.png', 16),
(65, 'https://cdn.tgdd.vn/Files/2022/01/25/1412805/cach-nau-pho-bo-nam-dinh-chuan-vi-thom-ngon-nhu-hang-quan-202201250230038502.jpg', 17),
(66, 'https://cachnau.vn/wp-content/uploads/2021/11/cach-nau-pho-bo-nam-dinh.jpg', 17),
(67, 'https://cdn.24h.com.vn/upload/4-2020/images/2020-12-04/Chia-se-cong-thuc--Bi-quyet-nau-pho-bo-gia-truyen-an-la-ghien-pho-sai-gon-1-1607071758-719-width660height440.jpg', 17),
(68, 'https://cuahangminhlong1.com/wp-content/uploads/2020/12/cach-nau-pho-bo.jpg', 17),
(69, 'https://product.hstatic.net/1000075078/product/1643102019_mochi-phucbontu_301e7e72fbba4aaf9a04f4a635650583.jpg', 18),
(70, 'https://product.hstatic.net/1000075078/product/1645982011_thtm0782_12a4f4bbf0c0401d98ae4ee83ed42fa4.jpeg', 18),
(73, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/MOUSSEDAO.png', 19),
(77, 'https://product.hstatic.net/1000075078/product/1643102034_mochi-vietquat_f34b48cb55bd4b9d8917bbf33c2905c0.jpg', 20),
(81, 'https://product.hstatic.net/1000075078/product/1643101996_mochi-dua_c19c95245a3142d1883612671af0abb4.jpg', 21),
(82, 'https://product.hstatic.net/1000075078/product/1645981262_165939265-2942167786057228-1331140616181543686-n_991567068f74441ba70a2fdaa4b77175.jpeg', 21),
(85, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/PHOMAICHANHDAY.jpg', 22),
(89, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/PHOMAITRAXANH.jpg', 23),
(93, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/CARAMELPHOMAI.jpg', 24),
(97, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/TIRAMISU.jpg', 25),
(98, 'https://tannamchinh.com/wp-content/uploads/2020/08/gia-tri-xuat-khau-cua-dua-tuoi-tai-viet-nam.jpg', 26),
(99, 'https://kingfoodmart.com/_next/image?url=https%3A%2F%2Fstorage.googleapis.com%2Fsc_pcm_product%2Fprod%2F2023%2F4%2F28%2F624-369723.jpg&w=3840&q=75', 27),
(109, 'https://cdn.tgdd.vn/Files/2017/11/01/1037559/cach-lam-ca-phe-trung-ha-noi-la-mieng-thom-ngon-kho-cuo-202112061119554466.jpg', 28),
(110, 'https://cdn.tgdd.vn/Files/2017/11/01/1037559/cach-lam-ca-phe-trung-ha-noi-la-mieng-thom-ngon-kho-cuong-202303101234148052.jpg', 28),
(111, 'https://cdn.tgdd.vn/Files/2017/11/01/1037559/cach-lam-ca-phe-trung-ha-noi-la-mieng-thom-ngon-kho-cuong-202205241522303059.jpg', 28),
(112, 'https://blog.dktcdn.net/files/cafe-trung-2.jpg', 28),
(113, 'https://cdn.tgdd.vn/Files/2021/08/05/1373215/giai-nhiet-voi-cafe-cot-dua-thom-ngon-beo-ngay-202201171030280974.jpg', 29),
(114, 'https://caphemuoi.com.vn/wp-content/uploads/2022/09/1.png', 29),
(115, 'https://classiccoffee.com.vn/files/common/cham-soc-gia-dinh-bang-ly-ca-phe-cot-dua-ngon-nga-nghieng-ohve4.jpg', 29),
(116, 'https://cdn.tgdd.vn/2021/09/CookDish/cach-nau-mi-thit-bo-sieu-hap-dan-cho-bua-sang-day-nang-luong-avt-1200x676.jpg', 30),
(117, 'https://cdn.tgdd.vn/Files/2019/05/23/1168472/4-cach-lam-da-me-ngao-duong-mat-lanh-da-khat-giai-nhiet-he-202203051141397183.jpg', 31),
(118, 'https://hutiuthanhdat.vn/data/Product/nuoc-ep-dua-hau-tao.jpg', 32),
(130, 'https://product.hstatic.net/200000768759/product/nuoc-ep-thom_546f42a46789403985b8e203cd279a7e.png', 33),
(131, 'https://cdn11.dienmaycholon.vn/filewebdmclnew/public//userupload/images/cach-lam-nuoc-ep-ca-rot-don-gian-1.jpg', 34),
(132, 'https://www.btaskee.com/wp-content/uploads/2023/06/nuoc-ep-cam-tuoi-thom-ngon-tai-nha.jpg', 35),
(133, 'https://cdn.tgdd.vn/Files/2019/07/14/1179531/nuoc-ep-tao-co-tac-dung-gi-ma-ai-cung-thi-nhau-uong-201907142252239995.jpg', 36),
(134, 'https://cdn.tgdd.vn/Files/2019/10/30/1213704/cach-lam-nuoc-ep-oi-thom-ngon-de-uong-201910300940367150.jpg', 37),
(135, 'https://vnn-imgs-a1.vgcloud.vn/img.infonet.vn/w490/Uploaded/2020/ovhunsf/2020_02_27/1569285483a007d08be8d647c8c59fd0332e48e454_1.jpg', 38),
(136, 'https://quangon.vn/resources/2020/03/12/sinh-to-bo-sua-dua-2.jpg', 39),
(137, 'https://cdn.tgdd.vn/2020/10/CookProduct/6-1200x676.jpg', 40),
(138, 'https://dayphache.edu.vn/wp-content/uploads/2016/02/cach-lam-sinh-to-xoai-sua-dac.jpg', 41),
(139, 'https://cdn.tgdd.vn/2021/03/CookRecipe/GalleryStep/thanh-pham-756.jpg', 42),
(140, 'https://cdn.tgdd.vn/Files/2020/02/12/1235928/gia-thanh-long-dang-re-mua-ngay-lam-sinh-to-ngot-mat-cuc-ky-202002120848019944.jpg', 43),
(141, 'https://www.unileverfoodsolutions.com.vn/dam/global-ufs/mcos/phvn/vietnam/calcmenu/recipes/VN-recipes/other/fresh-peach-tea/main-header.jpg', 44),
(142, 'https://img-global.cpcdn.com/recipes/4573f59870f650f3/680x482cq70/tra-dao-cam-dau-recipe-main-photo.jpg', 45),
(143, 'https://www.huongnghiepaau.com/wp-content/uploads/2021/12/nuoc-ep-dua-luoi.jpg', 46);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `avatar` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_type` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_number` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(1111) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `avatar`, `email`, `login_type`, `password`, `phone_number`, `role`, `user_name`, `address`) VALUES
('admin', 'https://i.pinimg.com/564x/aa/f9/cb/aaf9cb487381bc229f4b45444de660ff.jpg', 'admin@gmail.com', 'default', 'MQ==', '0123456789', 'admin', 'Admin Bảo Đẹp Zai', NULL),
('chibao', 'https://i.pinimg.com/736x/7a/87/78/7a8778df17c669476fd41cc7ab7c0f59.jpg', 'dcbao@gmail.com', 'default', 'MQ==', '0123456789', 'user', 'Đặng Chí Bảo', NULL),
('ducanh', 'https://i.pinimg.com/564x/19/a1/53/19a153f9441df0d9359c55324c99af31.jpg', 'ndanh@gmail.com', 'default', 'MQ==', '0123456789', 'user', 'Nguyễn Đức Anh', NULL),
('factory', 'https://images-ng.pixai.art/images/orig/78cb0957-3a18-400e-ae4b-943cd775f3d0', 'factory@gmail.com', 'default', 'MQ==', '0123456789', 'admin', 'Admin Bảo Cute', NULL),
('quocnam', 'https://i.pinimg.com/564x/ba/70/39/ba7039a1e96fc55db010670c2c0634eb.jpg', 'tqnam@gmail.com', 'default', 'MQ==', '0123456789', 'user', 'Trần Quốc Nam', NULL),
('thienphuc', 'https://i.pinimg.com/originals/18/2b/7c/182b7c200e06d95d60c7707cbd39bf16.jpg', 'ntphuc@gmail.com', 'default', 'MQ==', '0123456789', 'user', 'Nguyễn Thiên Phúc', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  ADD KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs234mi6jususbx4b37k44cipy` (`order_id`),
  ADD KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKs234mi6jususbx4b37k44cipy` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
