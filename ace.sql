-- First Query: Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
SELECT * 
FROM owners o 
FULL OUTER JOIN vehicles v 
ON o.id = v.owner_id;

-- Second Query: Count the number of vehicles owned by each owner, and sort the results by first name.
SELECT 
  first_name, 
  last_name, 
  COUNT(owner_id) 
FROM owners o 
JOIN vehicles v 
ON o.id = v.owner_id 
GROUP BY 
  first_name, 
  last_name 
ORDER BY 
  first_name;

-- Third Query: Find the owners who have more than one vehicle with an average price greater than 10000, and sort the results by average price in descending order.
SELECT 
  first_name, 
  last_name, 
  ROUND(AVG(price)) as average_price, 
  COUNT(owner_id) 
FROM owners o 
JOIN vehicles v 
ON o.id = v.owner_id 
GROUP BY 
  first_name, 
  last_name 
HAVING 
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY 
  average_price DESC;
