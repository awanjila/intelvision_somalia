-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2025 at 05:18 AM
-- Server version: 10.6.21-MariaDB-cll-lve-log
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grousilb_wabestudio`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `vision` varchar(191) DEFAULT NULL,
  `mission` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `author` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_category_id`, `author`, `name`, `meta_title`, `meta_description`, `slug`, `image`, `description`, `created_at`, `updated_at`) VALUES
(20, 1, 'Admin', 'Wabe Digital Agency: Your One-Stop Solution for Cutting-Edge Technology and Digital Transformation in 2025', 'Wabe Digital Agency', '<p>Get the best CCTV &amp; security installations with cloud storage, e-commerce platform development, SEO, &amp; website development services in Nairobi with Wabe Studio</p>', 'wabe-digital-agency-your-one-stop-solution-for-cutting-edge-technology-and-digital-transformation-in-2025', 'upload/blog_image/wabe-digital-agency-your-one-stop-solution-for-cutting-edge-technology-and-digital-transformation-in-2025.jpg', '<h1>Wabe Digital Agency: Your One-Stop Solution for Cutting-Edge Technology and Digital Transformation in 2025</h1>\r\n<p>&nbsp;</p>\r\n<p>In today&rsquo;s digital age, your business needs to stay ahead of the curve, ensuring not only an impactful online presence but also secure operations. <a title=\"best web developing agency in nairobi\" href=\"../\">Wabe Digital Agency</a> is a top-tier web-developing agency in Kenya that blends creativity with technology, offering a range of innovative solutions for businesses. Whether you&rsquo;re looking for website design, e-commerce platforms, or a cloud-based security, Wabe Digital Agency has the expertise to make it happen. This article explores the range of services offered by Wabe Digital Agency and why it&rsquo;s the go-to partner for businesses in Kenya and beyond.</p>\r\n<h1>What is Wabe Digital Agency?</h1>\r\n<p>Wabe Digital Agency is a digital agency based in Kenya that excels in providing a wide variety of tech-driven services that help businesses strengthen their online presence and improve operational efficiency. The digital agency has a proven track record in delivering high-quality services, ensuring that every project meets the unique needs of each client. Whether it&rsquo;s crafting an engaging website, developing a secure cloud-based POS system, or implementing cutting-edge CCTV and security installations, Wabe digital agency is committed to delivering excellence in everything it does.</p>\r\n<h1>Services Offered by Wabe Studio</h1>\r\n<p>Wabe Digital Agency offers a comprehensive suite of tech-driven services tailored to help businesses grow and succeed in the digital world. Their services include:</p>\r\n<p>&nbsp;</p>\r\n<h2>1. Website Design &amp; Development</h2>\r\n<p>&nbsp;</p>\r\n<p>A company&rsquo;s website is often the first point of contact with potential customers, making it a critical asset. Wabe Digital Agency understands the importance of a well-designed website and provides custom website design and development services that create an engaging and professional online presence across all devices and platforms. Whether you need a simple landing page, an information-based website, or a full-fledged corporate site, Wabe Studio ensures that the design is not only visually appealing but also optimized for speed and functionality.</p>\r\n<p>&nbsp;</p>\r\n<h2>2. E-Commerce Platform Development</h2>\r\n<p>&nbsp;</p>\r\n<p>In the rapidly evolving world of online retail, businesses need a user-friendly e-commerce platform. Wabe Studio specializes in creating <a title=\"best customized e-commerce platform development in nairobi\" href=\"https://www.shopify.com/blog/ecommerce-website-development\">customized e-commerce solutions</a> that cater to the unique needs of businesses looking to sell products online. From small boutique shops to large-scale online marketplaces, Wabe Studio offers tailor-made e-commerce platforms that are designed to enhance the shopping experience for customers. Our e-commerce services include payment gateway integration, product catalog management, user-friendly checkout processes, and full mobile compatibility.</p>\r\n<p>&nbsp;</p>\r\n<h2>3. Cloud-Based CCTV &amp; Security Installations</h2>\r\n<p>&nbsp;</p>\r\n<p>Security is a top priority for any business, and Wabe Studio offers advanced CCTV and security solutions to ensure that businesses are protected at all times. With the increasing reliance on digital tools and remote management, the team at Wabe Studio specializes in installing cloud-based CCTV systems that offer real-time monitoring, remote access, and cloud storage for security footage.</p>\r\n<p>By implementing cloud-based security systems, Wabe Studio ensures that clients can access surveillance footage from anywhere, at any time, without the need for on-site storage. This provides greater flexibility and security, especially for businesses that operate across multiple locations or have remote teams. Our team handles everything from system installation to configuration, ensuring that your security setup is reliable, and tailored to your specific business needs.</p>\r\n<p>&nbsp;</p>\r\n<h2>4. Search Engine Optimization (SEO)</h2>\r\n<p>&nbsp;</p>\r\n<p>A beautifully designed website is only effective if it can be found by potential customers. Wabe Studio&rsquo;s SEO experts help businesses increase their visibility on search engines such as Google, ensuring that your website ranks highly for relevant search terms. Our SEO services include comprehensive keyword research, on-page optimization, and link building, aimed at improving search engine rankings and driving more organic traffic.</p>\r\n<p>&nbsp;</p>\r\n<h2>5. Cloud-Based POS &amp; Inventory Systems</h2>\r\n<p>&nbsp;</p>\r\n<p>Managing sales and inventory efficiently is key to running a successful business. Wabe Studio offers&nbsp;<a title=\"best cloud-based point of sale and inventory development in Nairobi\" href=\"https://www.enerpize.com/?utm_source=google&amp;utm_medium=cpc&amp;utm_campaign=enerpize_kenya_exp_hm&amp;utm_term=software%20for%20small%20business&amp;trk=google_cpc_enerpize_kenya_exp_hm&amp;campaign=22179795347&amp;gad_source=1&amp;gclid=CjwKCAiAzPy8BhBoEiwAbnM9Oz8n7hIvSlXXLtGDtNOIM9oSutAM2VPT-YC3zwEYvsGNls9QePTffhoClacQAvD_BwE\"> cloud-based Point&nbsp;of Sale (POS) </a>and inventory management systems that help businesses streamline their operations and improve customer service. Our cloud-based POS systems allows your business to manage sales, track inventory, and process transactions from any location. By using cloud technology, Wabe Studio ensures that all data is securely stored, easily accessible, and automatically updated in real-time. This eliminates the risk of errors associated with manual inventory tracking and enhances overall business efficiency.</p>\r\n<p>&nbsp;</p>\r\n<h1>Why Choose Wabe Studio?</h1>\r\n<p>&nbsp;</p>\r\n<p>Wabe Studio offers a one-stop-shop for businesses seeking cutting-edge solutions across multiple domains. Here&rsquo;s why businesses should choose Wabe Studio:</p>\r\n<p>&nbsp;</p>\r\n<p>1. Tailored Solutions: Wabe Studio takes a personalized approach to every project, ensuring that the services provided align with your business&rsquo;s unique goals and objectives.</p>\r\n<p>&nbsp;</p>\r\n<p>2. Comprehensive Expertise: Whether you need a high-functioning website, an e-commerce platform, cloud security, or an advanced POS system, Wabe Studio offers a broad range of services, saving you the trouble of dealing with multiple vendors.</p>\r\n<p>&nbsp;</p>\r\n<p>3. Innovative Technology: Wabe Studio leverages the latest technologies, including cloud-based systems and SEO best practices, to deliver top-tier services that keep your business at the forefront of digital innovation.</p>\r\n<p>&nbsp;</p>\r\n<p>4. End-to-End Service: From initial consultation to implementation and ongoing support, Wabe Studio offers end-to-end services. Their dedicated team ensures that your business receives continuous support as it grows.</p>\r\n<p>&nbsp;</p>\r\n<p>5. Client-Focused Approach: Wabe Studio prides itself on its client-centric approach, providing clear communication, collaboration, and flexibility to ensure your satisfaction with every project.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '2025-02-03 00:48:28', '2025-02-03 00:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'Consequatur tempore', NULL, '2025-01-31 21:33:47', '2025-01-31 21:33:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `_lft` int(11) NOT NULL,
  `_rgt` int(11) NOT NULL,
  `depth` int(11) DEFAULT NULL,
  `category_name` varchar(191) NOT NULL,
  `category_image` varchar(191) DEFAULT NULL,
  `meta_title` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `category_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `_lft`, `_rgt`, `depth`, `category_name`, `category_image`, `meta_title`, `slug`, `category_description`, `created_at`, `updated_at`, `lft`, `rgt`) VALUES
(1, NULL, 1, 2, NULL, 'WordPress Plugins', 'upload/categories/wordpress-plugins.jpg', '<p>Custom Wordpress Plugins In Kenya</p>', 'wordpress-plugins', '<p>Are you looking to enhance the functionality and features of your WordPress website in Kenya? Explore a wide range of WordPress plugins specifically tailored to meet the needs of Kenyan websites.</p>\r\n<p>From e-commerce solutions to payment gateways like M-Pesa integration, these plugins cater to the local market, offering seamless integration with popular services and tools used in Kenya.</p>\r\n<p>Boost your website\'s performance, security, and user experience with these versatile plugins designed to help your WordPress site stand out in the Kenyan digital landscape. Whether you are a blogger, business owner, or developer, leverage these plugins to unlock the full potential of your WordPress website in Kenya.</p>', '2024-08-03 07:26:02', '2024-08-04 20:29:23', 0, 0),
(3, NULL, 0, 0, NULL, 'eCommerce Website Templates', 'upload/categories/ecommerce-website-templates.png', '', 'ecommerce-website-templates', '<p data-start=\"457\" data-end=\"927\">Upgrade your <strong data-start=\"470\" data-end=\"491\">eCommerce website</strong> with our <strong data-start=\"501\" data-end=\"522\">premium templates</strong> designed for <strong data-start=\"536\" data-end=\"601\">fast performance, mobile responsiveness, and high conversions</strong>. Whether you run a <strong data-start=\"621\" data-end=\"682\">fashion store, electronics shop, or dropshipping business</strong>, our templates come optimized for <strong data-start=\"717\" data-end=\"752\">SEO, speed, and user experience</strong>. Easily customizable and integrated with major <strong data-start=\"800\" data-end=\"863\">payment gateways, inventory management, and analytics tools</strong>&mdash;giving you everything you need to scale your online business.</p>\r\n<p data-start=\"929\" data-end=\"1059\"><strong data-start=\"929\" data-end=\"966\">✔ Mobile-Optimized &amp; Fast Loading</strong><br data-start=\"966\" data-end=\"969\"><strong data-start=\"969\" data-end=\"1011\">✔ SEO-Friendly &amp; High Conversion Rates</strong><br data-start=\"1011\" data-end=\"1014\"><strong data-start=\"1014\" data-end=\"1057\">✔ Secure, Scalable &amp; Easy Customization</strong></p>\r\n<p data-start=\"1061\" data-end=\"1145\">🚀 <strong data-start=\"1064\" data-end=\"1143\">Get started today and boost your sales with the perfect eCommerce template!</strong></p>', '2025-03-04 01:33:43', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `subject` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `subject`, `created_at`, `updated_at`) VALUES
(1, 'Abraham Wanjila', 'abemuchikan@gmail.com', '0710909198', 'Voluptate quas et se', 'wabestudio.co.ke', '2025-01-31 22:38:47', '2025-01-31 22:38:47'),
(2, 'Rebecca Gecheo', 'beckygecheo@gmail.com', '0791888344', 'khvh', 'wabestudio.co.ke', '2025-01-31 22:49:34', '2025-01-31 22:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `short_description` varchar(191) DEFAULT NULL,
  `home_slide` varchar(191) DEFAULT NULL,
  `video_url` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_17_132130_create_contacts_table', 1),
(6, '2021_12_09_180009_create_blogs_table', 1),
(7, '2021_12_09_212001_create_blog_categories_table', 1),
(8, '2022_03_25_200736_create_services_table', 1),
(9, '2022_04_19_230748_add_slug_to_blog_categories', 1),
(10, '2023_04_06_033314_create_categories_table', 1),
(11, '2023_04_08_000803_create_products_table', 1),
(12, '2023_04_20_045401_create_orders_table', 1),
(13, '2023_04_20_050332_create_order_details_table', 1),
(14, '2023_05_30_033601_add_sales_count_to_products', 1),
(15, '2023_06_23_193305_create_home_sliders_table', 1),
(16, '2023_06_24_024631_create_abouts_table', 1),
(17, '2023_10_26_143325_add_nested_set_columns_to_categories_table', 1),
(18, '2024_01_27_015507_create_product_images_table', 1),
(19, '2024_07_25_185644_create_pricings_table', 1),
(20, '2024_07_26_003337_create_pricing_packages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(191) NOT NULL,
  `customer_email` varchar(191) NOT NULL,
  `customer_phone` varchar(191) NOT NULL,
  `customer_address` varchar(191) NOT NULL,
  `order_date` varchar(191) NOT NULL,
  `order_status` varchar(191) NOT NULL,
  `total_products` varchar(191) NOT NULL,
  `sub_total` varchar(191) DEFAULT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `total` varchar(191) DEFAULT NULL,
  `vat` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `pay` varchar(191) DEFAULT NULL,
  `due` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(191) NOT NULL,
  `quantity` varchar(191) DEFAULT NULL,
  `unit_cost` varchar(191) DEFAULT NULL,
  `total` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('tylerjaykenny@gmail.com', '$2y$10$hrAGpi6lNQnlbWL2WdW1ie1ZCYKw8CzEcb4PLZRsCh2JALzP4MPVi', '2025-01-15 13:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

CREATE TABLE `pricings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `pricing` varchar(191) NOT NULL,
  `duration` varchar(191) NOT NULL,
  `meta_title` text NOT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `pricing_package_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricing_packages`
--

CREATE TABLE `pricing_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `price_range` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_description` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_image` varchar(191) DEFAULT NULL,
  `product_store` varchar(191) DEFAULT NULL,
  `sales_count` int(11) NOT NULL DEFAULT 0,
  `product_code` varchar(191) NOT NULL,
  `buying_date` varchar(191) DEFAULT NULL,
  `expire_date` varchar(191) DEFAULT NULL,
  `buying_price` varchar(191) DEFAULT NULL,
  `selling_price` varchar(191) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_features` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `meta_title`, `meta_description`, `slug`, `category_id`, `brand_id`, `supplier_id`, `product_image`, `product_store`, `sales_count`, `product_code`, `buying_date`, `expire_date`, `buying_price`, `selling_price`, `product_description`, `product_features`, `created_at`, `updated_at`) VALUES
(1, 'Mpesa Integration Wordpress Plugin', '<p>M-Pesa Integration WordPress Plugin: Seamlessly Accept Payments in Kenya</p>', '<p>Enhance your WordPress website in Kenya with the M-Pesa Integration Plugin. Accept payments conveniently through M-Pesa, reaching a wider audience and improving user experience.</p>', 'mpesa-integration-wordpress-plugin', 1, 1, 0, 'upload/products/mpesa-integration-wordpress-plugin.png', '10000', 0, 'WABE001', NULL, NULL, '5000', '5000', '<p>The Mpesa Integration Wordpress Plugin is a tool designed to seamlessly integrate the popular mobile money transfer service, M-Pesa, with WordPress websites. This plugin allows website owners to accept payments, donations, or subscriptions through M-Pesa, providing a convenient and widely-used payment option for their users. By installing and configuring this plugin, businesses and organizations can tap into the vast user base of M-Pesa customers, enabling secure and efficient transactions directly on their WordPress site. The plugin can be customized to fit specific needs, such as setting payment notifications, handling refunds, and managing transaction logs. It simplifies the payment process for both site owners and customers, enhancing the overall user experience and expanding the reach of their online business.</p>', '<ul>\r\n<li>\r\n<p><strong>Compatible with WordPress themes.</strong></p>\r\n</li>\r\n<li style=\"font-weight: bold;\">\r\n<p><strong>Easy to use.</strong></p>\r\n</li>\r\n<li style=\"font-weight: bold;\">\r\n<p><strong>Lightweight.</strong></p>\r\n</li>\r\n<li style=\"font-weight: bold;\">\r\n<p><strong>Supports all modern browsers.</strong></p>\r\n</li>\r\n</ul>', '2024-08-04 20:35:36', '2024-08-04 20:35:36'),
(2, 'Multi Currency Switcher Plugin', '<p>Best Multi-Currency Switcher Plugin for eCommerce &ndash; Supports 50+ Currencies\"</p>', '<p>Enhance your WordPress eCommerce site with our Multi-Currency Switcher Plugin. Easily support multiple currencies, improve user experience, and boost global sales</p>', 'multi-currency-switcher-plugin', 1, 1, 0, 'upload/products/multi-currency-switcher-plugin.jpg', '1000', 0, 'WABE01', NULL, NULL, '3000', '5000', '<p>Transform your WordPress eCommerce store with our powerful Multi-Currency Switcher Plugin. Designed to seamlessly integrate with your site, this plugin allows you to offer customers a wide range of currency options, enhancing their shopping experience and expanding your market reach</p>', '<ul>\r\n<li><strong>Support for Multiple Currencies</strong>: Add and manage multiple currencies with ease.</li>\r\n<li><strong>Automatic Currency Updates</strong>: Keep exchange rates up-to-date automatically.</li>\r\n<li><strong>Customizable Display</strong>: Choose how currencies are displayed on your site with flexible settings.</li>\r\n<li><strong>Easy Integration</strong>: Simple setup and integration with popular WordPress themes and plugins.</li>\r\n<li><strong>User-Friendly Interface</strong>: Intuitive dashboard for managing currencies and settings.</li>\r\n</ul>', '2024-08-04 20:43:52', NULL),
(3, 'Electronics & Gadgets', '<p>WabeTech - The Ultimate eCommerce Template for Electronics &amp; Gadgets</p>', '<p>WabeTech is a premium eCommerce template designed for electronics and gadget stores.&nbsp;</p>', 'electronics-gadgets', 3, 1, 0, 'upload/products/electronics-gadgets.png', '10000', 0, 'WABE02', NULL, NULL, '50000', '45000', '<p>WabeTech is a premium eCommerce template designed for electronics and gadget stores. Sell smartphones, laptops, gaming gear, and accessories with a lightning-fast, SEO-optimized, and mobile-friendly storefront. Elevate your online business with WabeTech today!</p>', '<ul>\r\n<li data-start=\"68\" data-end=\"142\"><strong data-start=\"70\" data-end=\"96\">High-Speed Performance</strong> (Fast loading, Lazy loading, CDN &amp; caching)</li>\r\n<li data-start=\"143\" data-end=\"222\"><strong data-start=\"145\" data-end=\"170\">Mobile &amp; SEO Friendly</strong> (Responsive design, SEO-optimized, Schema markup)</li>\r\n<li data-start=\"223\" data-end=\"328\"><strong data-start=\"225\" data-end=\"256\">Advanced Search &amp; Filtering</strong> (AI-powered recommendations, Multi-level filtering, Auto-suggestions)</li>\r\n<li data-start=\"329\" data-end=\"427\"><strong data-start=\"331\" data-end=\"361\">Secure &amp; Seamless Checkout</strong> (One-click checkout, Multiple payment gateways, Guest checkout)</li>\r\n<li data-start=\"428\" data-end=\"515\"><strong data-start=\"430\" data-end=\"457\">Dynamic Product Display</strong> (HD images with zoom, 360-degree view, Video embedding)</li>\r\n<li data-start=\"516\" data-end=\"613\"><strong data-start=\"518\" data-end=\"553\">Customer Engagement &amp; Retention</strong> (Live chat, Reviews &amp; ratings, Wishlist &amp; save-for-later)</li>\r\n<li data-start=\"614\" data-end=\"714\"><strong data-start=\"616\" data-end=\"652\">Multi-Vendor &amp; Wholesale Support</strong> (Multiple sellers, Commission-based earnings, Bulk pricing)</li>\r\n<li data-start=\"715\" data-end=\"816\"><strong data-start=\"717\" data-end=\"744\">Marketing &amp; Sales Tools</strong> (Discount coupons, Abandoned cart recovery, Social media integration)</li>\r\n<li data-start=\"817\" data-end=\"911\"><strong data-start=\"819\" data-end=\"850\">Order Management &amp; Tracking</strong> (Real-time updates, Automated invoices, Delivery tracking)</li>\r\n<li data-start=\"912\" data-end=\"995\" data-is-last-node=\"\"><strong data-start=\"914\" data-end=\"941\">Scalable &amp; Customizable</strong> (Drag-and-drop builder, Custom branding, API-ready)</li>\r\n</ul>', '2025-03-04 01:45:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `meta_title`, `meta_description`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Website Design and Development', 'website-design-and-development', 'Professional Website Design and Development Services | Wabe Digital Agency', 'Elevate your brand with stunning, user-friendly, and mobile-responsive websites by Wabe Digital Agency. We specialize in SEO-optimized designs for better performance and conversions.', '<p>Transform your online presence with our cutting-edge website design and development services. At Wabe Digital Agency, we create visually stunning, user-friendly, and mobile-responsive webs', 'upload/service_image/1821291603041560.jpg', '2025-01-15 13:30:24', '2025-01-15 13:30:24'),
(3, 'Search Engine Optimization (SEO)', 'search-engine-optimization-seo', 'SEO Services to Boost Your Rankings | Wabe Digital Agency', 'Get discovered by your audience with Wabe Digital Agency’s proven SEO strategies. Boost rankings, drive traffic, and achieve sustainable growth.', '<p>Achieve top rankings on search engines and grow your organic traffic with our proven SEO strategies. Our services include comprehensive keyword research, on-page and off-page optimization,', 'upload/service_image/1821291972874260.jpg', '2025-01-15 13:36:17', '2025-01-15 13:36:17'),
(4, 'eCommerce Platform Development', 'ecommerce-platform-development', 'Custom eCommerce Platform Development Services | Wabe Digital Agency', 'Launch a high-performance eCommerce store with Wabe Digital Agency. We design scalable, secure, and feature-rich platforms to boost your online sales.', '<p>Take your online store to the next level with Wabe Digital Agency&rsquo;s custom eCommerce platform development services. Our team specializes in creating scalable, secure, and user-friend', 'upload/service_image/1821292212122217.jpg', '2025-01-15 13:40:05', '2025-01-15 13:40:05'),
(5, 'Cloud-Based POS/Inventory System', 'cloud-based-posinventory-system', 'WABE Point: Advanced Cloud-Based POS/Inventory System | Wabe Digital Agency', 'Streamline your operations with WABE Point, the ultimate cloud-based POS and inventory management system. Smart, scalable, and secure solutions for your business.', '<p>Revolutionize your business operations with <strong>WABE Point</strong>, Wabe Digital Agency&rsquo;s cutting-edge cloud-based POS and inventory management system. Designed for scalability ', 'upload/service_image/1821292694124273.jpg', '2025-01-15 13:47:45', '2025-01-15 13:47:45'),
(6, 'CCTV and Security Installations with Cloud-Based Storage', 'cctv-and-security-installations-with-cloud-based-storage', 'CCTV and Security Solutions with Cloud-Based Storage | Wabe Digital Agency', 'Secure your property with Wabe Digital Agency’s advanced CCTV and security systems. Enjoy seamless monitoring with cloud-based storage for residential, commercial, and vehicle needs.', '<p>Protect what matters most with Wabe Digital Agency&rsquo;s comprehensive CCTV and security installation services. Whether for residential properties, commercial spaces, or vehicles, our sy', 'upload/service_image/1821292933046353.jpg', '2025-01-15 13:51:33', '2025-01-15 13:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abraham', 'abemuchikan@gmail.com', 'awanjila', NULL, '$2y$10$goEbuQiJBeTfxzRqcSCEOebRWGDRdu9T9lGt9FPeeQ3lkSF9AYa4u', NULL, '2024-08-03 07:05:09', '2024-08-03 07:05:09'),
(2, 'Gershom', 'yemakhakha@gmail.com', 'yemakhakha', NULL, '$2y$10$DoUE8Jo1xt0W2/mwkokcYuxeuQ8k3XWbxzaucD3qEyDWs3tLehV22', NULL, '2024-08-28 16:58:49', '2024-08-28 16:58:49'),
(3, 'tyler   mwalo', 'tylerjaykenny@gmail.com', 'MwaloTyler', NULL, '$2y$10$Uo5O/3QGrw4jeWMKPNK6RuHuhVsQ.O7B9SD9YhQHReJEQ1R302TC6', NULL, '2025-01-15 02:06:21', '2025-01-15 02:06:21'),
(4, 'Tyler Mwalo', 'keanealvin096@gmail.com', 'tyler', NULL, '$2y$10$BFc599H/K/T/pcSeOmdLL.xFrOuCphvwfebyCQlQGPoGGdja9l98C', NULL, '2025-01-15 13:26:23', '2025-01-15 13:26:23'),
(5, 'Rebecca', 'rebecca@foxcap.eu', 'Becca', NULL, '$2y$10$ZvEtS4mRD/R49NvZXD9TtOO9X/PBaecj.8vaSMx/y3pyREoDmf87.', NULL, '2025-01-31 15:45:21', '2025-01-31 15:45:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing_packages`
--
ALTER TABLE `pricing_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricing_packages`
--
ALTER TABLE `pricing_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
