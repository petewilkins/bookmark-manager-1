feature 'Sign Up' do
  scenario 'allows a user to sign up' do
    visit '/users/new'
    fill_in 'email', with: "roi@ma.com"
    fill_in 'password', with: "password"
    click_button "Sign Up"
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome roi@ma.com"
  end
end
