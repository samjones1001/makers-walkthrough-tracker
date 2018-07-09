describe Stage do
  before(:each) do
    Cohort.create(name: 'July 2018')
    cohort_id = Cohort.first(name: 'July 2018').id

    Student.create(name: 'Barry', cohort_id: cohort_id)
    @student_id = Student.first(name: 'Barry').id

    Challenge.create(number: 1, name: 'Boris Bikes')
    @challenge_id = Challenge.first(name: 'Boris Bikes').id

    @stage_one = Stage.create(number: 1, name: 'do something', challenge_id: @challenge_id)
    @stage_two = Stage.create(number: 2, name: 'do something else', challenge_id: @challenge_id)

  end

  describe '#self.get_next' do
    it 'retrieves the first stage of a challenge by default' do
      expect(Stage.get_next(@student_id, @challenge_id)).to eq(@stage_one)
    end

    it 'retrieves the next incomplete stage of a challenge if any stages are complete' do
      Result.create(challenge_id: @challenge_id, student_id: @student_id, stage_id: @stage_one.id, status: 'Y')
      expect(Stage.get_next(@student_id, @challenge_id)).to eq(@stage_two)
    end
  end
end
