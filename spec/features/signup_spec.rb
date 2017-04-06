feature 'Sign Up' do
  scenario 'allows a user to sign up' do
    visit '/users/new'
    fill_in 'email', with: "roi@ma.com"
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: 'password'
    click_button "Sign Up"
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, roi@ma.com"
  end

  scenario 'user enters mismatching passwords' do
    visit '/users/new'
    fill_in 'email', with: "roifails@ma.com"
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: 'password2'
    click_button "Sign Up"
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password and confirmation password do not match"
    expect(page).not_to have_content "Welcome, roi@ma.com"
    expect(User.count).to eq 0
  end
end
