/*
1. Given the table cs_course_modules with the fields module_name (variable char of length 50),
module_id (variable char of length 10), etcs (Number), lecture_hours (Number),
and semester_taught (variable char of length 15),
retrieve the names of the modules taken by first year students in decending order.
Modules taken by first year students have the module_id starting with CS1...
*/
SELECT module_name FROM cs_course_modules 
WHERE module_id LIKE "CS1%"
ORDER BY module_name DESC;

/*
2. Given the table cs_course_modules with the fields module_name (variable char of length 50),
module_id (variable char of length 10), etcs (Number),lecture_hours (Number), 
and semester_taught (variable char of length 15), retrieve the names of the modules
and module ids which have less than 33 hours of lectures
*/
SELECT module_name, module_id FROM cs_course_modules
WHERE lecture_hours < 33;

/*
3. Retrieve the total number of lecture hours for second year students from the table cs_course_modules
*/
SELECT SUM(lecture_hours)
FROM cs_course_modules
WHERE module_id LIKE "CS2%";

/*
 Retrieve the name of the module(s) with the minimum number of lecture hours
*/
SELECT module_name
SELECT cs_course_modules
WHERE lecture_hours IN (SELECT MIN(lecture_hours) FROM cs_course_modules);
