class Instructor
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end

    def passed_students
        self.instructed_students.select{|inst| inst.status == "passed"}.uniq
    end

    def pass_student(student, name)
        if self.find_student_test(student, name)
            self.find_student_test(student, name).status = "passed"
            self.find_student_test(student, name)
        else 
            BoatingTest.new(student, name, "passed", self)
        end
    end

    def fail_student(student, name)
        if self.find_student_test(student, name)
            self.find_student_test(student, name).status = "failed"
            self.find_student_test(student, name)
        else 
            BoatingTest.new(student, name, "failed", self)
        end
    end

    def find_student_test(student, test_name)
        BoatingTest.all.find{|inst| inst.student == student && inst.name == test_name}
    end

    def all_students
        self.instructed_students.map{|inst| inst.student.first_name}
    end

    def instructed_students
        BoatingTest.all.select{|inst| inst.instructor == self}
    end
end
