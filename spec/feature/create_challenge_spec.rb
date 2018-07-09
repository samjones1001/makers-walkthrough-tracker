feature 'create challenges' do
  scenario 'challenges can be created' do
    visit('/admin')
    fill_in :challenge_name, with: 'A very hard challenge'
    fill_in :challenge_number, with: '1'

    click_button 'Create Challenge'
    expect(Challenge.all.length).to eq(1)
  end
end
