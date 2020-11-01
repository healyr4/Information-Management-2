/*
1. Given the table cs_course_modules with the fields module_name (variable char of length 50),
module_id (variable char of length 10), etcs (Number), lecture_hours (Number),
and semester_taught (variable char of length 15),
insert a row with the following values:
module_name (Information Management II),
module_id (CS3041), etc (5), lecture_hours (33),
semester_taught (first semester).
*/
INSERT INTO cs_course_modules
VALUES ('Information Management II', 'CS3041', 5, 33, 'first semester');


/*
2. Update the table cs_course_modules which has the module id CS3041, 
setting the module_id to CS4D2A and the lecture_hours to 27
*/
UPDATE cs_course_modules
SET module_id = 'CS4D2A', lecture_hours = 27
WHERE module_id = 'CS3041';

/*
3. Delete the row with module_id CS4D2A from table cs_course_modules
*/

DELETE FROM cs_course_modules WHERE module_id='CS4D2A';
