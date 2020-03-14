feature 'Adding a new peep' do
  scenario 'A user can peep to chitter' do
    
    visit('/chitter/new-peep')
    fill_in('username', with: 'obi_wan')
    fill_in('peep', with: 'Hello there')
    click_button('Submit')

    expect(page).to have_content("Hello there - obi_wan")
  end
end