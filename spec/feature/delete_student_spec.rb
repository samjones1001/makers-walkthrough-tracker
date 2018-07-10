feature 'create stages' do
  before(:each) do
    Cohort.create(name: 'July 2018')
    cohort_id = Cohort.first(name: 'July 2018').id

    Student.create(name: 'Barry', cohort_id: cohort_id)
    @student_id = Student.first.id
  end

  scenario 'students can be deleted' do
    p Student.all
    visit('/admin')
    find("option[value='#{@student_id}']").click
    click_button 'Delete Student'
    expect(Student.all.length).to eq(0)
  end
end
