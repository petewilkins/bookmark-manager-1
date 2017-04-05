feature 'creating links' do
  scenario 'add a new link to our bookmark manager' do
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'https://makersacademy.com/'
    click_button 'Add Link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
