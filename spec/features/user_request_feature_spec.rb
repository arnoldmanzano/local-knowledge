require 'rails_helper'

feature 'Making a request for a tour' do

  before(:each) do
    signup
    request_tour
  end

  it '-> allows the user to make a tour request' do
    visit('/requests')
    expect(page).to have_content('Request for a tour in: London')
    expect(page).to have_content('Details: great times wanted')
  end

  it '-> a user\'s request will expire after 5 days' do
    Timecop.travel(5.days.from_now)
    visit('/requests')
    expect(page).to_not have_content('Requested for a tour in: London')
    expect(page).to_not have_content('Details: great times wanted')
  end

  it '-> users can update their requests' do
    visit('/requests')
    click_link 'Update'
    fill_in :'request[location]', with: 'Essex'
    fill_in :'request[description]', with: 'bad times wanted'
    expect(page).to have_content('Request for a tour in: Essex')
    expect(page).to have_content('Details: bad times wanted')

  end



end
