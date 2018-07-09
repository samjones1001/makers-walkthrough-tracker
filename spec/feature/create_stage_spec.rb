feature 'create stages' do
  before(:each) do
  	Challenge.create(name: 'Test Challenge')
    @challenge_id = Challenge.first.id
  end

  scenario 'stages can be created' do
    visit('/admin')
    fill_in :stage_name, with: 'stage 1'
    fill_in :stage_number, with: '1'
    find("option[value='#{@challenge_id}']").click
    click_button 'Create Stage'
    expect(Stage.all.length).to eq(1)
  end
end
