require 'rails_helper'

RSpec.describe 'Unsplash Service' do 
  let(:location) { 'denver, co' }
  describe '.get_background_image' do 
    it 'retruns a hash containing an image url for a location', :vcr do 
      response = UnsplashService.get_background_image(location) 

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_an(Array)
      expect(response[:results].count).to eq(1)
      expect(response[:results][0]).to have_key(:urls)
      expect(response[:results][0][:urls]).to be_a(Hash)
      expect(response[:results][0][:urls]).to have_key(:regular)
      expect(response[:results][0][:urls][:regular]).to be_a(String)
      expect(response[:results][0]).to have_key(:user)
      expect(response[:results][0][:user]).to be_a(Hash)
      expect(response[:results][0][:user]).to have_key(:name)
      expect(response[:results][0][:user][:name]).to be_a(String)
      expect(response[:results][0][:user]).to have_key(:links)
      expect(response[:results][0][:user][:links]).to be_a(Hash)
      expect(response[:results][0][:user][:links]).to have_key(:html)
      expect(response[:results][0][:user][:links][:html]).to be_a(String)
    end
  end 
end 