-- 1. заказы, доставленные в страны 'France', 'Austria', 'Spain' (таблица orders)
SELECT * FROM orders WHERE ship_country IN ('France', 'Austria', 'Spain');

-- 2. все заказы, отсортированные по дате формирования (order_date) по возрастанию и по дате отправки (shipped_date) по убыванию
SELECT * FROM orders ORDER BY order_date ASC, shipped_date DESC;

-- 3. минимальная цена (unit_price) товара, который не снят с продажи (discontinued = 0) (таблица products)
SELECT MIN(unit_price) FROM products WHERE discontinued = 0;

-- 4. максимальная цена (unit_price) товара, который не снят с продажи (discontinued = 0) (таблица products)
SELECT MAX(unit_price) FROM products WHERE discontinued = 0;

-- 5. количество уникальных городов (ship_city), в которые осуществлялась доставка заказов в 1998 году (orders)
SELECT COUNT(DISTINCT ship_city) FROM orders WHERE order_date >= '1998-01-01' AND order_date <= '1998-12-31';
