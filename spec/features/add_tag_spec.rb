feature 'adding tags' do
  scenario 'add a tag to a link when we add it to our bookmark' do
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com/'
    fill_in 'tags', with: 'education'
    click_button 'Add Link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end
