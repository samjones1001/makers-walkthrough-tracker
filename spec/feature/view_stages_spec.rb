feature 'view stages' do
  before(:each) do
  	Cohort.create(name: 'July 2018')
    @cohort_id = Cohort.first.id
    Student.create(name: 'Barry', cohort_id: @cohort_id)
    @student_id = Student.first.id
    Challenge.create(number: 1, name: 'Boris Bikes')
    @challenge_id = Challenge.first.id
    Stage.create(name: 'do a thing', number: 1, challenge_id: @challenge_id)
    @stage_id = Stage.first.id
    Stage.create(name: 'do something else', number: 2, challenge_id: @challenge_id)
  end

  scenario 'the first incomplete stage appears on the /challenges/id/stages page' do
    visit('/cohorts')
    click_link('July 2018')
    click_button('Barry')
    click_link('Boris Bikes')
    expect(page).to have_content('do a thing')
    expect(page).to_not have_content('do something else')
  end

  scenario 'later stages appear once earlier stages are marked complete' do
    Result.create(status: 'Y', stage_id: @stage_id, student_id: @student_id, challenge_id: @challenge_id)

    visit('/cohorts')
    click_link('July 2018')
    click_button('Barry')
    click_link('Boris Bikes')
    expect(page).to_not have_content('do a thing')
    expect(page).to have_content('do something else')
  end
end
