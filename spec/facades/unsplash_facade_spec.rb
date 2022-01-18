require 'rails_helper'

RSpec.describe 'Unsplash Facade' do 
  let(:location) { 'Denver, CO' }

  it '.get_image', :vcr do
    response = UnsplashFacade.get_image(location)

    expect(response).to be_a(Hash)
  end
end 