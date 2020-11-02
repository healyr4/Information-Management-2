/*
Given the table 1. cs_course_modules with the fields module_name (variable char of length 50), m
odule_id (variable char of length 10), etcs (Number), lecture_hours (Number),
and semester_taught (variable char of length 15), and given table 2. eng_course_modules
(same fields as cs_course_modules), produce a view called 'shared_modules' of modules 
(modules_name and module_id) shared by both tables
*/

CREATE VIEW shared_modules AS
SELECT module_name, module_id 
FROM cs_course_modules 
INNER JOIN eng_course_modules ON cs_course_modules.module_name=eng_course_modules.module_name
AND cs_course_modules.module_id=eng_course_modules.module_id;
/*

2. Create a join between cs_course_modules and eng_course_modules which retrieves
the module_name and module_id of modules taken by students from both courses.
*/
SELECT module_name, module_id 
FROM cs_course_modules 
INNER JOIN eng_course_modules 
WHERE cs_course_modules.module_id=eng_course_modules.module_id
