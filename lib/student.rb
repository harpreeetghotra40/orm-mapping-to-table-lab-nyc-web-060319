class Student

attr_accessor :name, :grade
  attr_reader :id

   def initialize (name, grade, id=1)
    @name = name
    @grade = grade
    @id = id
  end

   def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        grade INTEGER
        )
    SQL
      DB[:conn].execute(sql)
  end

   def self.drop_table
    sql = <<-SQL
      DROP TABLE students
    SQL

     DB[:conn].execute(sql)  
  end

   def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
        VALUES (?, ?)
    SQL

     DB[:conn].execute(sql, self.name, self.grade)
  end

   def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end


 end	
