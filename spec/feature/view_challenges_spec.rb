feature 'view challenges' do
  before(:each) do
  	Cohort.create(name: 'July 2018')
    Cohort.create(name: 'August')
    Student.create(name: 'Barry', cohort_id: 1)
    Student.create(name: 'Sally', cohort_id: 1)
    Student.create(name: 'Berty', cohort_id: 2)
    Challenge.create(number: 1, name: 'Boris Bikes')
  end

  scenario 'all challenges appear on the /challenges page' do
    visit('/challenges')
    expect(page).to have_content('Boris Bikes')
  end
  # 
  # scenario 'clicking the name of a cohort leads to the correct page' do
  #   id = Cohort.first(name: 'July 2018').id
  #
  #   visit('/cohorts')
  #   click_link('July 2018')
  #   expect(current_path).to eq("/cohorts/#{id}/students")
  # end
end
