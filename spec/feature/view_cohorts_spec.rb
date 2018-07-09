feature 'view cohorts' do
  before(:each) do
  	Cohort.create(name: 'July 2018')
    Cohort.create(name: 'August')
  end

  scenario 'all cohorts appear on the /cohorts page' do
    visit('/cohorts')
    expect(page).to have_content('July 2018')
  end

  scenario 'clicking the name of a cohort leads to the correct page' do
    id = Cohort.first(name: 'July 2018').id

    visit('/cohorts')
    click_link('July 2018')
    expect(current_path).to eq("/cohorts/#{id}/students")
  end
end
