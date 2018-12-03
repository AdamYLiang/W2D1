require_relative 'Employee'
class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        employees.map {|employee| employee.salary}.inject(:+) * multiplier
    end
end