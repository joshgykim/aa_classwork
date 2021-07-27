
class Employee

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary    
        @boss = boss
    end

    def bonus(multiplier)
        salary * multiplier
    end

    protected

    attr_accessor :boss
    attr_accessor :salary
end

class Manager < Employee

    attr_accessor :employees

    def initialize(name, title, salary, boss) 
        super
        @employees = []
    end

    def add_employees(*employee)
        self.employees += employee
        employee.each { |person| person.boss = self }
    end

    def bonus(multiplier)
        find_total_salary * multiplier
    end

    def find_total_salary
        total_salary = 0
        employees.each do |employee|
            total_salary += employee.salary
            if employee.is_a?(Manager)
                total_salary += employee.find_total_salary
            end
        end
        total_salary
    end

end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, nil)

ned.add_employees(darren)

shawna = Employee.new("Shawna", "TA", 12000, nil)
david = Employee.new("David", "TA", 10000, nil)

darren.add_employees(shawna, david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
