class Challenge
  include DataMapper::Resource

  property :id,     Serial
  property :number, Integer
  property :name,   String

end
