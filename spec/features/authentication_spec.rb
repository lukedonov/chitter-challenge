feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    User.create(username: "obi_wan", password: "password123", name: 'obi-wan', email: 'obi@gmail.com')

    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'obi@gmail.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, obi-wan'
  end
end