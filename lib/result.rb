class Result
  include DataMapper::Resource

  property :id,     Serial
  property :status, String

  belongs_to :stage
  belongs_to :student
  belongs_to :challenge
end
