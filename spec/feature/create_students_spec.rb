feature 'create students' do
  before(:each) do
  	Cohort.create(name: 'July 2018')
    @cohort_id = Cohort.first.id
  end

  scenario 'students can be created' do
    visit('/admin')
    fill_in :student_name, with: 'Boris'
    find("option[value='#{@cohort_id}']").click
    click_button 'Create Student'
    expect(Student.all.length).to eq(1)
  end
end
