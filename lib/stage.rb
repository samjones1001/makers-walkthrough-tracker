class Stage
  include DataMapper::Resource

  property :id,     Serial
  property :number, Integer
  property :name,   String

  belongs_to :challenge
  has n, :results

  def self.get_next(student_id, challenge_id)
    stages = Stage.all(:challenge_id => challenge_id, :order => [ :number.asc ])
    results = Result.all(:challenge_id => challenge_id, :student_id => student_id, :order => [ :stage_id.asc ])
    return Stage.first(:challenge_id => challenge_id, :order => [ :number.asc ]) if results.empty?
    stage_id = Result.last(:challenge_id => challenge_id, :student_id => student_id, :order => [ :stage_id.asc ]).stage_id + 1
    return Stage.first(:id => stage_id)
  end
end
