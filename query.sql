SELECT color, COUNT(color) as total FROM cars
GROUP BY color
HAVING COUNT(color) > 1
ORDER BY total DESC 