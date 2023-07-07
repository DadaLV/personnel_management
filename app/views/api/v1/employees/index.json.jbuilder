# json.array! @employees do |employee|
#   json.id employee.id
#   json.first_name employee.first_name
#   json.middle_name employee.middle_name
#   json.last_name employee.last_name
#   json.passport_data employee.passport_data
#   json.date_of_birth employee.date_of_birth
#   json.place_of_birth employee.place_of_birth
#   json.home_address employee.home_address
#   json.department_id employee.department_id  
# end

json.array! @employees, :id, :first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id
