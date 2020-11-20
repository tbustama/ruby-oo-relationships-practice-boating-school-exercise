class Student
    attr_accessor :first_name
    @@all = []
    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, name, status, instructor)
    end

    def all_instructors
        self.test_student.map {|test| test.instructor}
    end

    def self.find_student(first_name)
        self.all.find{|inst| inst.first_name == first_name} 
    end

    def grade_percentage
        pass = self.test_student.select{|inst| inst.status == "passed"}
        pass.count.to_f / self.test_student.count.to_f
    end

    def test_student
        BoatingTest.all.select{|test| test.student == self}
    end
end
