# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).



Clearance.create(id: 1, name:"Admin")
Clearance.create(id: 2, name:"Management")
Clearance.create(id: 3, name:"Supervisor")
Clearance.create(id: 4, name:"Department Trainer")
Clearance.create(id: 5, name:"Record Managers")
Clearance.create(id: 6, name:"Boarding User")

Department.create(id: 1, name:"Security")
Department.create(id: 2, name:"Surveillance")
Department.create(id: 3, name:"IT/Audit")
Department.create(id: 4, name:"F & B")
Department.create(id: 5, name:"Finance")
Department.create(id: 6, name:"Hotel")
Department.create(id: 7, name:"Marketing/HR")
Department.create(id: 8, name:"EVS")
Department.create(id: 9, name:"Casino Operations")
Department.create(id: 10, name:"Facilities")

Incident.create(id: 1, name:"Intoxication")
Incident.create(id: 2, name:"Undesirable Activity")
Incident.create(id: 3, name:"Verbal Altercation")
Incident.create(id: 4, name:"Physical Altercation")
Incident.create(id: 5, name:"TITO Theft")
Incident.create(id: 6, name:"Property Theft")


Listing.create(location: "Main Boarding", department_id: 1, extension: "7047", phone_number: "816-414-7047")
Listing.create(location: "King Boarding", department_id: 1, extension: "7049", phone_number: "816-414-7049")
Listing.create(location: "West Boarding", department_id: 1, extension: "7087", phone_number: "816-414-7087")
Listing.create(location: "Team Boarding", department_id: 1, extension: "7026", phone_number: "816-414-7026")
Listing.create(location: "Surveillance", department_id: 2, extension: "7258", phone_number: "816-414-7258")

User.create(employee_num: "1379", first_name: "Boarding", last_name: "Officer", clearance_id: 6, department_id: 1, password: "1379")
User.create(employee_num: "12345", first_name: "John", last_name: "IT", clearance_id: 1, department_id: 3, password: "1234")
User.create(employee_num: "68117", first_name: "Colten", last_name: "Peterson", clearance_id: 4, department_id: 1, password: "1234")
User.create(employee_num: "69704", first_name: "Stewart", last_name: "Varner", clearance_id: 3, department_id: 1, password: "1234")
User.create(employee_num: "69293", first_name: "Debbie", last_name: "Needles", clearance_id: 3, department_id: 1, password: "1234")
User.create(employee_num: "33615", first_name: "Dale", last_name: "McGregor", clearance_id: 6, department_id: 1, password: "1234")
User.create(employee_num: "51875", first_name: "Mike", last_name: "Daniels", clearance_id: 6, department_id: 1, password: "1234")
User.create(employee_num: "34506", first_name: "Steven", last_name: "Gage", clearance_id: 6, department_id: 1, password: "1234")