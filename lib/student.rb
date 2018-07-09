class Student
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String

  belongs_to :cohort
  has n, :results
end
