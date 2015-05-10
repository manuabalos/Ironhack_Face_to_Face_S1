# class Employee

# 	attr_accessor :type, :name, :salary
# 	def initialize type, name, salary
# 		@type = type
# 		@name = name
# 		@salary = salary
# 	end

# 	def payroll

# 	end

# end

# class Base

# end

# class Hour

# end

# class BasePlusHour

# end

file_contents = IO.read("employee.txt")
file_array = file_contents.split("\n")
employee_array = []
i=0

File.delete("payrollmonth.txt")
file_array.each_with_index do |employee, index|
	employee_array.push(employee.split(" "))
	total = 0
	case employee_array[i][0]
		when "Base"
			total=employee_array[i][2]
		when "Hour"
			total=employee_array[i][2].to_i*employee_array[i][3].to_i
		when "BasePlusHour"
			total=employee_array[i][2].to_i+employee_array[i][3].to_i*employee_array[i][4].to_i
		else
			puts "Unknow employee"
	end
	puts "#{employee_array[i][1]} ---> #{total}"
	IO.write("payrollmonth.txt", "#{employee_array[i][1]} ---> #{total}\n", mode: "a")
	total = 0
	i += 1
end



