feature 'view students' do
  before(:each) do
  	Cohort.create(name: 'July 2018')
    Cohort.create(name: 'August 2018')
    cohort_1_id = Cohort.first(name: 'July 2018').id
    cohort_2_id = Cohort.first(name: 'August 2018').id

    Student.create(name: 'Barry', cohort_id: cohort_1_id)
    Student.create(name: 'Sally', cohort_id: cohort_1_id)
    Student.create(name: 'Berty', cohort_id: cohort_2_id)
  end

  scenario 'All students for a given cohort are listed' do
    visit('/cohorts')
    click_link('July 2018')

    expect(page).to have_selector(:link_or_button, 'Barry')
    expect(page).to have_selector(:link_or_button, 'Sally')
    expect(page).to_not have_selector(:link_or_button, 'Berty')
  end

  scenario 'Clicking on a student routes to correct page' do
    id = Student.first(name: 'Barry').id

    visit('/cohorts')
    click_link('July 2018')
    click_button('Barry')
    expect(current_path).to eq("/challenges")
  end
end
