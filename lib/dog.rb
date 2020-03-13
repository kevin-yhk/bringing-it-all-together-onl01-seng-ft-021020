class Dog
  
  attr_accessor :id, :name, :breed 
  
  def initialize(id: nil, name:, breed:)
    @name = name
    @breed = breed
  end 
  
  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
        )
    SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
      DROP TABLE dogs 
    SQL
    DB[:conn].execute(sql)
  end 
  
  def self.new_from_db(row)
    new_dog = self.new(id: row[0], name: row[1], breed: row[2])
    new_dog.id = row[0]
    new_dog 
  end
  
  def update
    
  
  def save
    if self.id
      self.update
    else
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end
  end
  
  
  # def self.find_by_name(name)
  #   sql = <<-SQL
  #     SELECT *
  #     FROM dogs
  #     WHERE name = ?
  #   SQL
 
  #   DB[:conn].execute(sql, name).map do |row|
  #     self.new_from_db(row)
  #   end.first
  # end
end 