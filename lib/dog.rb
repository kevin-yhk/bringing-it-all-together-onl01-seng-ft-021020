class Dog
  
  attr_accessor :id, :name, :breed 
  
  def initialize(id = nil, name:, breed:)
    @name = name
    @breed = breed
  end 
end 