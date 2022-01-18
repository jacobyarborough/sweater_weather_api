require 'rails_helper'

RSpec.describe 'Unsplash Facade' do 
  let(:location) { 'Denver, CO' }
  let(:quantity) { 5 }

  it '.get_books', :vcr do
    response = LibraryFacade.get_books(location, quantity)

    expect(response).to be_a(Hash)
  end
end 