feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('username', with: 'obi_wan')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, obi_wan"
  end
end