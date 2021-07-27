
class Employee

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary    
        @boss = boss
    end

    def bonus(multiplier)
        bonus = salary * multiplier

        return bonus
    end

    private

    attr_reader :salary
end

class Manager < Employee

    def initialize(name, title, salary, boss, employees) 
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        total_salary = 0
        employees.each do |employee|
            total_salary += employee.salary
            if !employee.employees.nil?
                

        

    end
    # managers might report to higher level managers
end


