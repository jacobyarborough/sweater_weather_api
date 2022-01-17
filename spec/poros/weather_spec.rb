require 'rails_helper'

RSpec.describe Weather do
  let(:weather) { Weather.new(data) }

  it 'has attributes' do 
    expect(weather.id).to eq(null)
    expect(weather.type).to eq('forecast')

    expect(weather.current_weather).to be_a(Hash)
    expect(weather.current_weather[:datetime]).to eq('datetimesting') #need to research format
    expect(weather.current_weather[:sunrise]).to eq('datetimesting') #need to research format
    expect(weather.current_weather[:sunset]).to eq('datetimesting') #need to research format
    expect(weather.current_weather[:temperature]).to eq(31.75)
    expect(weather.current_weather[:feels_like]).to eq(31.75)
    expect(weather.current_weather[:humidity]).to eq(57)
    expect(weather.current_weather[:uvi]).to eq(0)
    expect(weather.current_weather[:visibility]).to eq(10000)
    expect(weather.current_weather[:conditions]).to eq("few clouds")
    expect(weather.current_weather[:icon]).to eq("02n")

    expect(weather.daily_weather).to be_an(Array)
    expect(weather.daily_weather.length).to eq(5)
    expect(weather.daily_weather[0]).to be_a(Hash)
    expect(weather.daily_weather[0].count).to eq(7)
    expect(weather.daily_weather[0][:date]).to eq('datetimesting') #need to research format
    expect(weather.daily_weather[0][:sunrise]).to eq('datetimesting') #need to research format
    expect(weather.daily_weather[0][:sunset]).to eq('datetimesting') #need to research format
    expect(weather.daily_weather[0][:max_temp]).to eq(47.66)
    expect(weather.daily_weather[0][:min_temp]).to eq(31.75)
    expect(weather.daily_weather[0][:conditions]).to eq("overcast clouds")
    expect(weather.daily_weather[0][:icon]).to eq("04d")

    expect(weather.hourly_weather).to be_an(Array)
    expect(weather.hourly_weather.length).to eq(8)
    expect(weather.hourly_weather[0]).to be_a(Hash)
    expect(weather.hourly_weather[0].count).to eq(4)
    expect(weather.hourly_weather[0][:time]).to eq('datetimesting') #need to research format
    expect(weather.hourly_weather[0][:temperature]).to eq(32.7)
    expect(weather.hourly_weather[0][:conditions]).to eq("few clouds")
    expect(weather.hourly_weather[0][:icon]).to eq("02n")
  end 
end 