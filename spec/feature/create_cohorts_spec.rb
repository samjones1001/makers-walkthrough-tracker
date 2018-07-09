feature 'create cohorts' do
  scenario 'cohorts can be created' do
    visit('/admin')
    fill_in :cohort_name, with: 'July 2018'
    click_button 'Create Cohort'
    expect(Cohort.all.length).to eq(1)
  end
end
