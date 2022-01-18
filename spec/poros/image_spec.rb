require 'rails_helper'

RSpec.describe Image do
  let(:location) { "Denver, CO" }
  let(:image) { Image.new(image_data, location) }

  it 'has attributes' do 
    expect(image.id).to eq(nil)
    expect(image.type).to eq('image')

    expect(image.image).to be_a(Hash)
    expect(image.image[:location]).to eq("Denver, CO") 
    expect(image.image[:image_url]).to eq("https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyOTE0MjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDI0NzYxNDU&ixlib=rb-1.2.1&q=80&w=1080")
    expect(image.image[:credit]).to be_a(Hash)
    expect(image.image[:credit][:source]).to eq('unsplash.com')
    expect(image.image[:credit][:author_link]).to eq("https://unsplash.com/@dillydallying?utm_source=sweater_weather&utm_medium=referral")
    expect(image.image[:credit][:author_name]).to eq("Dillon Wanner")
  end 
end 