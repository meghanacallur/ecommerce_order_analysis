##ORDER_STATUS_SPLIT
SELECT order_status, COUNT(*) AS num_orders
FROM orders
GROUP BY order_status;

##TOP_10_CATEGORIES_BY_SALE
SELECT p.product_category_name,
       SUM(oi.price) AS total_sales,
       COUNT(DISTINCT oi.order_id) AS order_count
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC
LIMIT 10;

##PAYMENT_METHODS_SPLIT
SELECT payment_type,
       COUNT(*) AS num_orders,
       SUM(payment_value) AS total_value
FROM payments
GROUP BY payment_type
ORDER BY total_value DESC;


##AVG_ORDER_VALUE
SELECT ROUND(SUM(payment_value) * 1.0 / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM payments;
