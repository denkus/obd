select * from med.job_titles;
select * from med.doctors;
select * from med.clinics;
select * from med.doctor_clinics;
select * from med.diagnoses;
select * from med.patients;
select * from med.patient_visits;
select * from med.patient_visit_diag;
select * from med.logs;


-- Сводка по всем приемам пациентов у врачей
select pv.visit_date,
       c.short_name as clinic,
       j."name" as doc_title,
       format('%s %s %s', d.last_name, d.first_name, d.middle_name) as doc_name,
       format('%s %s %s', p.last_name, p.first_name, p.middle_name) as patient,
       pv.complaints, pv.exam, pv.recommend
from med.patient_visits pv
join med.clinics c
  on pv.clinic_id = c.id
join med.patients p
  on pv.patient_id = p.id
join med.doctors d
  on pv.doctor_id = d.id
join med.job_titles j
  on d.job_title_id = j.id
order by pv.visit_date desc, clinic, doc_title, doc_name;

-- Количество приемов, проведенных каждым из врачей указанной поликлиники
select pv.doctor_id, d.last_name, d.first_name, d.middle_name, count(*)
from med.patient_visits pv
join med.doctors d
  on pv.doctor_id = d.id
where pv.clinic_id = 1
group by pv.clinic_id, pv.doctor_id, d.last_name, d.first_name, d.middle_name
order by count(*) desc;


insert into med.patients (last_name, first_name, middle_name, gender, dob, phone)
values ('Новинков', 'Клим', 'Демидович', 'м', '1950-12-12', '89001234455');

update med.patients
set phone = '+799900001122'
where id = 4;

delete from med.patients
where id = 4;
