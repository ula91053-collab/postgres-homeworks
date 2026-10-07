-- 1. заказы, доставленные в города, начинающиеся на букву 'M' (таблица orders)
SELECT * FROM orders WHERE ship_city LIKE 'M%';

-- 2. товары, в названии которых есть слово 'sauce' (таблица products)
SELECT * FROM products WHERE product_name LIKE '%sauce%';

-- 3. количество товаров в каждой категории, где товаров больше 5 (таблица products, группировка по category_id)
SELECT category_id, COUNT(*) FROM products GROUP BY category_id HAVING COUNT(*) > 5;

-- 4. суммарный вес (freight) заказов по каждой стране доставки, отсортированный по убыванию веса (таблица orders)
SELECT ship_country, SUM(freight) FROM orders GROUP BY ship_country ORDER BY SUM(freight) DESC;

-- 5. количество заказов, оформленных каждым сотрудником в 1997 году (таблица orders, группировка по employee_id)
SELECT employee_id, COUNT(*) FROM orders WHERE order_date >= '1997-01-01' AND order_date <= '1997-12-31' GROUP BY employee_id;
