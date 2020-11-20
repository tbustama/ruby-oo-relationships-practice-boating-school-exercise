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
        self.instructed_students.select{|inst| inst.status == "passed"}
    end
    def pass_student(student, test)
        if self.find_student_test(student, name)
            self.find_student_test(student, name).status == "passed"
        else 
            BoatingTest.new(student, test, "passed", self)
        end
    end

    def fail_student(student, name)
        if self.find_student_test(student, name)
            self.find_student_test(student, name).status == "failed"
        else 
            BoatingTest.new(student, test, "failed", self)
        end
    end

    def find_student_test(student, name)
        BoatingTest.all.find{|inst| inst.student == student && inst.name == name}
    end

    def all_students
        self.instructed_students.map{|inst| inst.student.first_name}
    end

    def instructed_students
        students = BoatingTest.all.select{|inst| inst.instructor == self}
    end
end
