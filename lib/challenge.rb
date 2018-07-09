class Challenge
  include DataMapper::Resource

  property :id,     Serial
  property :number, Integer
  property :name,   String

  has n, :stages
  has n, :results
end
