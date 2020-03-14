
feature 'viewing peeps' do 
  scenario 'viewing the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

  # scenario 'A maker can see peeps' do
  #   time = Time.new
  #   Peep.create(peep: "hello there", username: "obi_wan", time: time)
  #   Peep.create(peep: "whats up", username: "Tom", time: time)
  #   Peep.create(peep: "ello mate", username: "Lukedon1", time: time)

  #   visit('/peeps')

  #   expect(page).to have_content("hello there - obi_wan #{time}")
  #   expect(page).to have_content("whats up - Tom #{time}")
  #   expect(page).to have_content("Lukedon1 - obi_wan #{time}")
  # end
end