-- List of all students
SELECT First_Name, Last_Name
FROM `student_information.csv`;

-- The total number of students
SELECT COUNT(Student_ID)
FROM `student_information.csv`;

-- Students with a GPA greater than 3.5
select First_Name, Last_Name, GPA
FROM  `student_information.csv`
WHERE GPA > 3.5;

-- all students enrolled in Biology
select `student_information.csv`.First_Name, 
`student_information.csv`.Last_Name,
`courses_data.csv`.Course_Name
FROM `student_information.csv`
JOIN `enrollments_data.csv`
ON `student_information.csv`.Student_ID = `enrollments_data.csv`.Student_ID
JOIN `courses_data.csv`
ON `enrollments_data.csv`.Course_ID = `courses_data.csv`.Course_ID
WHERE `courses_data.csv`.Course_Name = 'Biology';


-- The number of students in each Departent
select Department, count(Student_ID)
from `student_information.csv`
group by Department;


-- The average GPA by Department
select Department, round(avg(GPA),3) as Avg_GPA
FROM `student_information.csv`
group by Department
order by Avg_GPA DESC ;


-- Courses with more than 10 enrollments
select `courses_data.csv`.Course_Name,
count(`enrollments_data.csv`.Enrollment_ID) AS No_of_enrollment
FROM `courses_data.csv`
JOIN `enrollments_data.csv`
ON `courses_data.csv`.Course_ID = `enrollments_data.csv`.Course_ID
GROUP BY `courses_data.csv`.Course_Name
HAVING No_of_enrollment > 10; -- count(`enrollments_data.csv`.Enrollment_ID) ;

-- Students who received an A grade
select `student_information.csv`.First_Name,
		`student_information.csv`.Last_Name,
        `enrollments_data.csv`.Grade
from `student_information.csv`
join `enrollments_data.csv`
on `student_information.csv`.Student_ID = `enrollments_data.csv`.Student_ID
WHERE `enrollments_data.csv`.Grade = 'A';

-- Each students enrolled courses 
SELECT `student_information.csv`.First_Name,
		`student_information.csv`.Last_Name,
        `courses_data.csv`.Course_Name
FROM `student_information.csv`
JOIN `enrollments_data.csv`
ON `student_information.csv`.Student_ID = `enrollments_data.csv`.Student_ID
JOIN `courses_data.csv`
ON `courses_data.csv`. Course_ID = `enrollments_data.csv`.Course_ID;
        
-- The course with the higest number of enrollments
select `courses_data.csv`.Course_Name,
count(`enrollments_data.csv`.Enrollment_ID) AS No_of_enrollment
FROM `courses_data.csv`
JOIN `enrollments_data.csv`
ON `courses_data.csv`.Course_ID = `enrollments_data.csv`.Course_ID
GROUP BY `courses_data.csv`.Course_Name
HAVING count(`enrollments_data.csv`.Enrollment_ID) > 10
ORDER BY count(`enrollments_data.csv`.Enrollment_ID) DESC
LIMIT 1;

-- Total credits taken by each student
SELECT `student_information.csv`.First_Name,
		`student_information.csv`.Last_Name,
        sum(`courses_data.csv`.Credits) AS Sum_of_credits
FROM `student_information.csv`
JOIN `enrollments_data.csv`
ON `student_information.csv`.Student_ID = `enrollments_data.csv`.Student_ID 
JOIN `courses_data.csv`
ON `courses_data.csv`.Course_ID = `enrollments_data.csv`.Course_ID
GROUP BY `student_information.csv`.First_Name,
		 `student_information.csv`.Last_Name;


         
-- Students not enrolled in any course
SELECT
    `student_information.csv`.Student_ID ,
    `student_information.csv`.First_Name,
    `student_information.csv`.Last_Name
FROM `student_information.csv` 
LEFT JOIN `enrollments_data.csv` 
    ON `student_information.csv`.Student_ID = `enrollments_data.csv`.Student_ID
WHERE `enrollments_data.csv`.Student_ID IS NULL;

-- The number of students not enrolled in any course
SELECT COUNT(*) AS Students_Not_Enrolled
FROM `student_information.csv` 
LEFT JOIN `enrollments_data.csv`
    ON `student_information.csv`.Student_ID = `enrollments_data.csv`.Student_ID
WHERE `enrollments_data.csv`.Student_ID IS NULL;


-- Rank of students based on their GPA
select `student_information.csv`.First_Name,
		`student_information.csv`.Last_Name,
        `student_information.csv`.Age,
        `student_information.csv`.Gender,
        `courses_data.csv`.Course_Name,
        `student_information.csv`.GPA
from `student_information.csv`
join `enrollments_data.csv`
on `student_information.csv`.Student_ID = `enrollments_data.csv`.Student_ID
join `courses_data.csv`
on `enrollments_data.csv`.Course_ID = `courses_data.csv`.Course_ID
order by `student_information.csv`.GPA DESC
LIMIT 10;