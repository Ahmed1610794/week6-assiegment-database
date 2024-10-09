--q1
SELECT p.provider_name , p.provider_specialty
FROM providers p;

--q2
SELECT pt.patient_id, pt.first_name, pt.last_name, p.provider_specialty 
FROM patients pt
INNER JOIN visits v
 ON pt.patient_id = v.patient_id
INNER JOIN providers p
ON v.provider_id = p.provider_id;

--q3
SELECT pt.patient_id , pt.first_name, pt.last_name, v.date_of_visit 
FROM patients pt
LEFT JOIN visits v 
ON pt.patient_id = v.patient_id;

--q4
SELECT p.provider_name, COUNT(v.visit_id) 
FROM providers p
LEFT JOIN visits v 
ON p.provider_id = v.provider_id
GROUP BY p.provider_name;

--q5
SELECT pt.patient_id, pt.first_name, pt.last_name, ad.admission_date, ad.discharge_date 
FROM patients pt
INNER JOIN visits v
 ON pt.patient_id = v.patient_id
INNER JOIN admissions ad 
ON v.visit_id = ad.visit_id
WHERE ad.admission_required = 'Yes';