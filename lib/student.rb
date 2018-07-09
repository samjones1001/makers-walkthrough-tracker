class Student
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String

  belongs_to :cohort

end
