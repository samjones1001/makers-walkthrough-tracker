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
    visit('/cohorts')
    click_link('July 2018')
    click_button('Barry')
    expect(page).to have_content('Boris Bikes')
  end

  scenario 'visitng the /challenges page before selecting  student redirects to cohorts' do
    visit('/challenges')

    expect(current_path).to eq("/cohorts")
  end
end
