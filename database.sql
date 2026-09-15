-- =========================================================
-- SANGAM BAG SHOP - DATABASE SETUP
-- =========================================================

CREATE DATABASE IF NOT EXISTS shop_inventory;

USE shop_inventory;


-- =========================================================
-- 1. PRODUCTS TABLE
-- =========================================================

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_number VARCHAR(20) UNIQUE,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(80) NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    quantity INT NOT NULL DEFAULT 0,
    image_url VARCHAR(1000),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================================
-- 2. SALES TABLE
-- =========================================================

CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- =========================================================
-- 3. CLEAR OLD DATA
--    Prevents "Duplicate entry LUG-001" error
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM sales;
DELETE FROM products;

SET FOREIGN_KEY_CHECKS = 1;


-- =========================================================
-- 4. INSERT 94 PRODUCTS
-- =========================================================

INSERT INTO products
(product_number, name, category, price, quantity, image_url)
VALUES

('LUG-001',
'Safari ETERNA - 56 cm | Graphite Blue; Dark Champagne | 56 x 38 x 25 cm',
'Hard Luggage', 5700, 0, '/static/products/ETERNA.jpg'),

('LUG-002',
'Safari ETERNA - 68 cm | Graphite Blue; Dark Champagne | 68 x 47 x 30 cm',
'Hard Luggage', 7100, 0, '/static/products/ETERNA.jpg'),

('LUG-003',
'Safari ETERNA - 78 cm | Graphite Blue; Dark Champagne | 78 x 53 x 34 cm',
'Hard Luggage', 8600, 0, '/static/products/ETERNA.jpg'),

('LUG-004',
'Safari TRACKR - 56 cm | Cement Grey; Black | 56 x 39 x 24 cm',
'Hard Luggage', 8998, 0, '/static/products/TRACKR.jpg'),

('LUG-005',
'Safari TRACKR - 69 cm | Cement Grey; Black | 69 x 47 x 29 cm',
'Hard Luggage', 11198, 0, '/static/products/TRACKR.jpg'),

('LUG-006',
'Safari TRACKR - 79 cm | Cement Grey; Black | 79 x 54 x 33 cm',
'Hard Luggage', 13398, 0, '/static/products/TRACKR.jpg'),

('LUG-007',
'Safari NOX - 56 cm | Flintstone; Black | 56 x 40 x 26 cm',
'Hard Luggage', 6799, 0, '/static/products/NOX.jpg'),

('LUG-008',
'Safari NOX - 68 cm | Flintstone; Black | 68 x 47 x 29 cm',
'Hard Luggage', 8199, 0, '/static/products/NOX.jpg'),

('LUG-009',
'Safari NOX - 79 cm | Flintstone; Black | 79 x 54 x 33 cm',
'Hard Luggage', 9599, 0, '/static/products/NOX.jpg'),

('LUG-010',
'Safari DUET - 55 cm | Aqua Horizon; Desert Olive | 55 x 40 x 25 cm',
'Hard Luggage', 6998, 0, '/static/products/DUET.jpg'),

('LUG-011',
'Safari DUET - 65 cm | Aqua Horizon; Desert Olive | 65 x 46 x 30 cm',
'Hard Luggage', 8998, 0, '/static/products/DUET.jpg'),

('LUG-012',
'Safari DUET - 77 cm | Aqua Horizon; Desert Olive | 77 x 55 x 32 cm',
'Hard Luggage', 10998, 0, '/static/products/DUET.jpg'),

('LUG-013',
'Safari COSMIC - 56 cm | Fossil; Harbour Blue | 56 x 39 x 24 cm',
'Hard Luggage', 5998, 0, '/static/products/COSMIC.jpg'),

('LUG-014',
'Safari COSMIC - 69 cm | Fossil; Harbour Blue | 69 x 47 x 29 cm',
'Hard Luggage', 7998, 0, '/static/products/COSMIC.jpg'),

('LUG-015',
'Safari COSMIC - 79 cm | Fossil; Harbour Blue | 79 x 54 x 33 cm',
'Hard Luggage', 9998, 0, '/static/products/COSMIC.jpg'),

('LUG-016',
'Safari CLEMENT - 55 cm | Pearl Blue; Dusk Green | 55 x 40 x 25 cm',
'Hard Luggage', 7420, 0, '/static/products/CLEMENT.jpg'),

('LUG-017',
'Safari CLEMENT - 65 cm | Pearl Blue; Dusk Green | 65 x 46 x 30 cm',
'Hard Luggage', 9710, 0, '/static/products/CLEMENT.jpg'),

('LUG-018',
'Safari CLEMENT - 77 cm | Pearl Blue; Dusk Green | 77 x 55 x 32 cm',
'Hard Luggage', 11997, 0, '/static/products/CLEMENT.jpg'),

('LUG-019',
'Safari SCRIB - 55 cm | Amber Dune; Grey | 55 x 40 x 25 cm',
'Hard Luggage', 5198, 0, '/static/products/SCRIB.jpg'),

('LUG-020',
'Safari SCRIB - 65 cm | Amber Dune; Grey | 65 x 46 x 30 cm',
'Hard Luggage', 6798, 0, '/static/products/SCRIB.jpg'),

('LUG-021',
'Safari SCRIB - 77 cm | Amber Dune; Grey | 77 x 55 x 32 cm',
'Hard Luggage', 8598, 0, '/static/products/SCRIB.jpg'),

('LUG-022',
'Safari CITYMILES - 59 cm | Black; Thyme Green | 59 x 40 x 27 cm',
'Hard Luggage', 7710, 0, '/static/products/CITYMILES.jpg'),

('LUG-023',
'Safari CITYMILES - 69 cm | Black; Thyme Green | 69 x 49 x 31 cm',
'Hard Luggage', 9855, 0, '/static/products/CITYMILES.jpg'),

('LUG-024',
'Safari CITYMILES - 79 cm | Black; Thyme Green | 79 x 57 x 34 cm',
'Hard Luggage', 11996, 0, '/static/products/CITYMILES.jpg'),

('LUG-025',
'Safari REGENT - 3P | Sage Green; Fossil',
'Hard Luggage', 32750, 0, '/static/products/REGENT.jpg'),

('LUG-026',
'Safari REGENT - SM | Sage Green; Fossil | 67 x 47 x 28 cm',
'Hard Luggage', 19000, 0, '/static/products/REGENT.jpg'),

('LUG-027',
'Safari REGENT - Large | Sage Green; Fossil | 76 x 55 x 31 cm',
'Hard Luggage', 0, 0, '/static/products/REGENT.jpg'),

('LUG-028',
'Safari CARTER PRO CM - 3P | Cyan; Luxury Beige; Dusk Green; Rose Gold | 55 x 39 x 24 cm',
'Hard Luggage', 27200, 0,
'https://rukmini1.flixcart.com/image/1500/1500/xif0q/suitcase/m/b/y/67-carter-pro-67-medium-size-1-carterpro674wcyn-check-in-watermarked-original-imahhy24dyy9yyhg.jpeg?q=70'),

('LUG-029',
'Safari CARTER PRO CM - 55 cm | Cyan; Luxury Beige; Dusk Green; Rose Gold',
'Hard Luggage', 6700, 0,
'https://rukmini1.flixcart.com/image/1500/1500/xif0q/suitcase/m/b/y/67-carter-pro-67-medium-size-1-carterpro674wcyn-check-in-watermarked-original-imahhy24dyy9yyhg.jpeg?q=70'),

('LUG-030',
'Safari CARTER PRO CM - SM | Cyan; Luxury Beige; Dusk Green; Rose Gold | 67 x 47 x 28 cm',
'Hard Luggage', 15800, 0,
'https://rukmini1.flixcart.com/image/1500/1500/xif0q/suitcase/m/b/y/67-carter-pro-67-medium-size-1-carterpro674wcyn-check-in-watermarked-original-imahhy24dyy9yyhg.jpeg?q=70'),

('LUG-031',
'Safari CARTER PRO CM - 67 cm | Cyan; Luxury Beige; Dusk Green; Rose Gold | 76 x 55 x 31 cm',
'Hard Luggage', 9100, 0,
'https://rukmini1.flixcart.com/image/1500/1500/xif0q/suitcase/m/b/y/67-carter-pro-67-medium-size-1-carterpro674wcyn-check-in-watermarked-original-imahhy24dyy9yyhg.jpeg?q=70'),

('LUG-032',
'Safari LANCER PLUS - 3P | Ink Blue; Teal Green | 55 x 40 x 25 cm',
'Hard Luggage', 24000, 0,
'https://roshanbags.com/RoshanDoc/ProductMainImage/BAG868.webp'),

('LUG-033',
'Safari LANCER PLUS - SM | Ink Blue; Teal Green | 66 x 46 x 30 cm',
'Hard Luggage', 13950, 0,
'https://roshanbags.com/RoshanDoc/ProductMainImage/BAG868.webp'),

('LUG-034',
'Safari LANCER PLUS - Large | Ink Blue; Teal Green | 76 x 55 x 31 cm',
'Hard Luggage', 0, 0,
'https://roshanbags.com/RoshanDoc/ProductMainImage/BAG868.webp'),

('LUG-035',
'Safari CAIRO - 3P | Cyan; Maroon; Black; Sage Green | 55 x 38 x 23 cm',
'Hard Luggage', 25500, 0, '/static/products/CAIRO.jpg'),

('LUG-036',
'Safari CAIRO - SM | Cyan; Maroon; Black; Sage Green | 66 x 47 x 28 cm',
'Hard Luggage', 14810, 0, '/static/products/CAIRO.jpg'),

('LUG-037',
'Safari CAIRO - Large | Cyan; Maroon; Black; Sage Green | 75 x 54 x 31 cm',
'Hard Luggage', 0, 0, '/static/products/CAIRO.jpg'),

('LUG-038',
'Safari AVENUE SECURE - 59 cm | Navy Blue; Teal | 59 x 38 x 24 cm',
'Soft Luggage', 8300, 0,
'https://safaribags.com/cdn/shop/files/Softluggage_avenue_red_d79b82f3-1201-4a7e-943e-de64a5307b9b_1000x.jpg?v=1686568389'),

('LUG-039',
'Safari AVENUE SECURE - 71 cm | Navy Blue; Teal | 71 x 43 x 27 cm',
'Soft Luggage', 10300, 0,
'https://safaribags.com/cdn/shop/files/Softluggage_avenue_red_d79b82f3-1201-4a7e-943e-de64a5307b9b_1000x.jpg?v=1686568389'),

('LUG-040',
'Safari AVENUE SECURE - 81 cm | Navy Blue; Teal | 81 x 49 x 32 cm',
'Soft Luggage', 12300, 0,
'https://safaribags.com/cdn/shop/files/Softluggage_avenue_red_d79b82f3-1201-4a7e-943e-de64a5307b9b_1000x.jpg?v=1686568389'),

('LUG-041',
'Safari STREAM SECURE - 59 cm | Teal; Grey; Blue | 59 x 38 x 27 cm',
'Soft Luggage', 6798, 0,
'https://safaribags.com/cdn/shop/files/Softluggage_avenue_red_d79b82f3-1201-4a7e-943e-de64a5307b9b_1000x.jpg?v=1686568389'),

('LUG-042',
'Safari STREAM SECURE - 71 cm | Teal; Grey; Blue | 71 x 43 x 30 cm',
'Soft Luggage', 8198, 0,
'https://safaribags.com/cdn/shop/files/Softluggage_avenue_red_d79b82f3-1201-4a7e-943e-de64a5307b9b_1000x.jpg?v=1686568389'),

('LUG-043',
'Safari STREAM SECURE - 81 cm | Teal; Grey; Blue | 81 x 49 x 35 cm',
'Soft Luggage', 9798, 0,
'https://safaribags.com/cdn/shop/files/Softluggage_avenue_red_d79b82f3-1201-4a7e-943e-de64a5307b9b_1000x.jpg?v=1686568389'),

('LUG-044',
'Safari ZYNK - 3P | Teal; Grey; Maroon | 57 x 37 x 29 cm',
'Soft Luggage', 24800, 0, '/static/products/ZYNK.jpg'),

('LUG-045',
'Safari ZYNK - SM | Teal; Grey; Maroon | 67 x 42 x 32 cm',
'Soft Luggage', 15155, 0, '/static/products/ZYNK.jpg'),

('LUG-046',
'Safari ZYNK - Large | Teal; Grey; Maroon | 77 x 47 x 35 cm',
'Soft Luggage', 0, 0, '/static/products/ZYNK.jpg'),

('LUG-047',
'Safari HERA - 58 cm | Black; Teal | 58 x 29 x 33 cm',
'Rolling Duffle', 4568, 0, '/static/products/HERA.jpg'),

('LUG-048',
'Safari HERA - 66 cm | Black; Teal | 66 x 33 x 37 cm',
'Rolling Duffle', 5714, 0, '/static/products/HERA.jpg'),

('LUG-049',
'Safari BEAMER - 57 cm | Grey; Blue | 57 x 35 x 36 cm',
'Rolling Duffle', 5650, 0, '/static/products/BEAMER.jpg'),

('LUG-050',
'Safari BEAMER - 67 cm | Grey; Blue | 67 x 39 x 38 cm',
'Rolling Duffle', 6675, 0, '/static/products/BEAMER.jpg'),

('LUG-051',
'Safari EDEN - 55 cm | Red; Blue; Black | 55 x 26 x 30 cm',
'Rolling Duffle', 3330, 0, '/static/products/EDEN.jpg'),

('LUG-052',
'Safari EDEN - 65 cm | Red; Blue; Black | 65 x 28 x 33 cm',
'Rolling Duffle', 4220, 0, '/static/products/EDEN.jpg'),

('LUG-053',
'Safari ZION CM - 55 cm | Teal Green; Dark Grey | 55 x 38 x 23 cm',
'Hard Luggage', 7199, 0,
'https://bf1af2.akinoncloudcdn.com/products/2024/09/06/36599/0ae6428f-ad50-45f9-88f9-7ae6ca75b57a_size3840_cropCenter.jpg'),

('LUG-054',
'Safari ZION CM - 67 cm | Teal Green; Dark Grey | 67 x 47 x 28 cm',
'Hard Luggage', 8799, 0,
'https://bf1af2.akinoncloudcdn.com/products/2024/09/06/36599/0ae6428f-ad50-45f9-88f9-7ae6ca75b57a_size3840_cropCenter.jpg'),

('LUG-055',
'Safari ZION CM - 76 cm | Teal Green; Dark Grey | 76 x 55 x 31 cm',
'Hard Luggage', 9998, 0,
'https://bf1af2.akinoncloudcdn.com/products/2024/09/06/36599/0ae6428f-ad50-45f9-88f9-7ae6ca75b57a_size3840_cropCenter.jpg'),

('LUG-056',
'Safari Select LYKOS - 56 cm | Flintstone Blue; Fog Grey | 56 x 39 x 24.5 cm',
'Hard Luggage', 5300, 0, '/static/products/LYKOS.jpg'),

('LUG-057',
'Safari Select LYKOS - 69 cm | Flintstone Blue; Fog Grey | 69 x 47.5 x 29.5 cm',
'Hard Luggage', 6400, 0, '/static/products/LYKOS.jpg'),

('LUG-058',
'Safari Select LYKOS - 79 cm | Flintstone Blue; Fog Grey | 79 x 54 x 33 cm',
'Hard Luggage', 7800, 0, '/static/products/LYKOS.jpg'),

('LUG-059',
'Timus STARLITE - 58 cm | Blue; Olive Green; Ivory; Maroon | 39.5 x 22 x 55 cm',
'Hard Luggage', 18600, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-060',
'Timus STARLITE - 68 cm | Blue; Olive Green; Ivory; Maroon | 44.5 x 27 x 66 cm',
'Hard Luggage', 16800, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-061',
'Timus STARLITE - 78 cm | Blue; Olive Green; Ivory; Maroon | 51.5 x 30.5 x 75 cm',
'Hard Luggage', 19400, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-062',
'Timus NEOLITE - 58 cm | Blue; Olive Green; Yellow | 34 x 22.5 x 51 cm',
'Hard Luggage', 8500, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-063',
'Timus NEOLITE - 68 cm | Blue; Olive Green; Yellow | 41 x 26 x 61 cm',
'Hard Luggage', 10600, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-064',
'Timus NEOLITE - 78 cm | Blue; Olive Green; Yellow | 49 x 30 x 71 cm',
'Hard Luggage', 12800, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-065',
'Timus LEOLITE - 58 cm | Maroon Red; Charcoal Grey; Metallic Blue | 39 x 26.5 x 58 cm',
'Hard Luggage', 12000, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-066',
'Timus LEOLITE - 68 cm | Maroon Red; Charcoal Grey; Metallic Blue | 44 x 29 x 69 cm',
'Hard Luggage', 14000, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-067',
'Timus LEOLITE - 78 cm | Maroon Red; Charcoal Grey; Metallic Blue | 50 x 32.5 x 78 cm',
'Hard Luggage', 16000, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-068',
'Timus STORM - 58 cm | Blue/Orange; Silver/Black; Black/Yellow; Black/Green | 37 x 23.5 x 58 cm',
'Hard Luggage', 5500, 0,
'https://timus.in/cdn/shop/files/StormCatalogue-02.jpg?v=1771319118'),

('LUG-069',
'Timus STORM - 68 cm | Blue/Orange; Silver/Black; Black/Yellow; Black/Green | 44 x 28 x 68 cm',
'Hard Luggage', 7400, 0,
'https://timus.in/cdn/shop/files/StormCatalogue-02.jpg?v=1771319118'),

('LUG-070',
'Timus STORM - 78 cm | Blue/Orange; Silver/Black; Black/Yellow; Black/Green | 51 x 30 x 78 cm',
'Hard Luggage', 8600, 0,
'https://timus.in/cdn/shop/files/StormCatalogue-02.jpg?v=1771319118'),

('LUG-071',
'Timus SUNLITE - 58 cm | Red; Black; T-Blue; Orange/Black | 37 x 24 x 56.5 cm',
'Hard Luggage', 6200, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-072',
'Timus SUNLITE - 68 cm | Red; Black; T-Blue; Orange/Black | 46.5 x 26.5 x 65.5 cm',
'Hard Luggage', 7400, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-073',
'Timus SUNLITE - 78 cm | Red; Black; T-Blue; Orange/Black | 53 x 28.5 x 76 cm',
'Hard Luggage', 8600, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-074',
'Timus WAVELITE - 58 cm | Blue/Orange; Silver/Black | 36.5 x 24 x 55 cm',
'Hard Luggage', 6800, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-075',
'Timus WAVELITE - 68 cm | Blue/Orange; Silver/Black | 45 x 27 x 65 cm',
'Hard Luggage', 8800, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-076',
'Timus WAVELITE - 78 cm | Blue/Orange; Silver/Black | 51.5 x 30.5 x 77 cm',
'Hard Luggage', 10400, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-077',
'Timus SALSA PLUS - 58 cm | Red; Black; N-Blue; T-Blue | 39.5 x 24.5 x 54.5 cm',
'Soft Luggage', 8500, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-078',
'Timus SALSA PLUS - 68 cm | Red; Black; N-Blue; T-Blue | 41 x 25.5 x 68 cm',
'Soft Luggage', 9000, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-079',
'Timus SALSA PLUS - 78 cm | Red; Black; N-Blue; T-Blue | 45.5 x 29 x 78.5 cm',
'Soft Luggage', 10000, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-080',
'Timus NEXON - 58 cm | Red; Black; N-Blue | 37.5 x 23.5 x 56.5 cm',
'Soft Luggage', 6400, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-081',
'Timus NEXON - 68 cm | Red; Black; N-Blue | 42.5 x 26 x 68.5 cm',
'Soft Luggage', 7800, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-082',
'Timus NEXON - 78 cm | Red; Black; N-Blue | 47 x 30.5 x 77.5 cm',
'Soft Luggage', 9600, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-083',
'Timus FLASH PLUS - 58 cm | Red; Black; N-Blue; Grey | 40.5 x 24 x 56 cm',
'Soft Luggage', 6390, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-084',
'Timus FLASH PLUS - 68 cm | Red; Black; N-Blue; Grey | 44.5 x 29 x 66 cm',
'Soft Luggage', 7195, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-085',
'Timus FLASH PLUS - 78 cm | Red; Black; N-Blue; Grey | 53 x 33.5 x 82 cm',
'Soft Luggage', 7820, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-086',
'Timus SPORTIVE - 58 cm | Red; Black; N-Blue; T-Blue | 39.5 x 26.1 x 55 cm',
'Soft Luggage', 8400, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-087',
'Timus SPORTIVE - 68 cm | Red; Black; N-Blue; T-Blue | 43 x 31 x 69 cm',
'Soft Luggage', 9100, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-088',
'Timus SPORTIVE - 78 cm | Red; Black; N-Blue; T-Blue | 48.5 x 36 x 78.5 cm',
'Soft Luggage', 9980, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-089',
'Timus SUMO DUFFEL BAG - 55 cm | Black; Navy Blue; Red | 52 x 26 x 29.5 cm',
'Duffle / Travel Bag', 1775, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-090',
'Timus SUMO DUFFEL BAG - 65 cm | Black; Navy Blue; Red | 60 x 31 x 28 cm',
'Duffle / Travel Bag', 2095, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-091',
'Timus SUMO WHEELED DUFFEL BAG - 55 cm | Black; Navy Blue; Red | 52 x 26 x 29.5 cm',
'Duffle / Travel Bag', 2095, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-092',
'Timus SUMO WHEELED DUFFEL BAG - 65 cm | Black; Navy Blue; Red | 60 x 31 x 28 cm',
'Duffle / Travel Bag', 2475, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-093',
'Timus DYNAMITE DUFFEL - 55 cm | Black; Wine; Grey; Red | 51 x 26.5 x 28.5 cm',
'Duffle / Travel Bag', 3400, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764'),

('LUG-094',
'Timus DYNAMITE DUFFEL - 65 cm | Black; Wine; Grey; Red | 60.5 x 31.5 x 29 cm',
'Duffle / Travel Bag', 3740, 0,
'https://timus.in/cdn/shop/files/Timus_Salsa_Plus_Blue_68_78_cm_Combo.jpg?v=1761819764');


-- =========================================================
-- 5. VERIFY DATA
-- =========================================================

SELECT COUNT(*) AS total_products
FROM products;

SELECT product_number, name, category, price, quantity
FROM products
ORDER BY product_id;
