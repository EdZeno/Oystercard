require 'journey'

describe Journey do
  let(:entry) {double :station }
  let(:exit) {double :station}
  subject(:journey) {described_class.new("Shoreditch")}

describe 'finishes the journey' do
   it 'stores the exit station' do
     journey.exit(exit)
     expect(journey.exit_station).to eq(exit)
   end
end

describe 'expects "Shoreditch" to be the entry station' do
   it 'Shoreditch is the entry station' do

     expect(journey.entry_station).to eq("Shoreditch")
   end
end


describe 'calculate the fare' do
  it 'has to return an integer' do
  journey.exit(exit)
  expect(journey.fare).to eq(1)
  end
end

describe 'checks if the journey is complete' do
  it 'has to return true or false' do
    expect(subject.complete).to be(false)
  end
end
end
