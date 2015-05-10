class Employee

	attr_accessor :name
	def initialize name
		@name = name
	end

	def send_by_number
		puts "Payroll notification send to #{@name} via SMS"
	end

	def send_by_twitter
		puts "Payroll notification send to #{@name} via twitter"
	end

	def send_by_email
		puts "Payroll notification send to #{@name} via e-mail"
	end

end


file_contents = IO.read("employee.txt")
file_array = file_contents.split("\n")
employee_array = []
i=0

file_array.each_with_index do |employee, index|
	employee_array.push(employee.split(" "))
	
	employee = Employee.new(employee_array[i][1])

	if /\d+/.match(employee_array[i][2])
		employee.send_by_number	
	elsif /^[a-zA-Z0-9]+@[a-zA-Z]+.[a-zA-Z]+/.match(employee_array[i][2])
		employee.send_by_email
	elsif /@[a-zA-Z0-9]+/.match(employee_array[i][2])
		employee.send_by_twitter
	end
	i += 1
end