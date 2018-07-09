class Cohort
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String

  has n, :students
end
