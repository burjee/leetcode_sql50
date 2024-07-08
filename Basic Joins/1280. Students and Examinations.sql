SELECT sd.student_id,
       sd.student_name,
       sj.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students sd
CROSS JOIN Subjects sj
LEFT JOIN Examinations e ON sd.student_id = e.student_id
AND sj.subject_name = e.subject_name
GROUP BY sd.student_id,
         sd.student_name,
         sj.subject_name
ORDER BY sd.student_id ASC,
         sj.subject_name ASC;