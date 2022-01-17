require 'rails_helper'

RSpec.describe Weather do
  let(:weather) { Weather.new(data) }

  it 'has attributes' do 
    expect(weather.id).to eq(null)
    expect(weather.type).to eq('forecast')
    expect(weather.current_weather).to be_a(Hash)
    expect(weather[:datetime]).to eq('datetimesting') #need to research format
    expect(weather[:sunrise]).to eq('datetimesting') #need to research format
    expect(weather[:sunset]).to eq('datetimesting') #need to research format
    expect(weather[:temperature]).to eq()

  end 
end 