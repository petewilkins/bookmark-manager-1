feature 'adding tags' do
  scenario 'add a tag to a link when we add it to our bookmark' do
    add_a_bookmark

    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'adding multiple tags' do
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com/'
    fill_in 'tags', with: 'education, bootcamp'
    click_button 'Add Link'

    visit('/tags/education')
    expect(page).to have_content('Makers Academy')
    visit('/tags/bootcamp')
    expect(page).to have_content('Makers Academy')
  end
end
