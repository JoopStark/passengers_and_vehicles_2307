require './lib/passenger'
require 'pry'

describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
  end

  it "has exists and has attributes" do 
    expect(@charlie).to be_a(Passenger)

    expect(@charlie.name).to eq("Charlie")
    expect(@charlie.age).to eq(18)
  end
    
  it "#adult?" do
    expect(@charlie.adult?).to be true
    expect(@taylor.adult?).to be false
  end

  it "#driver? if driving" do
    expect(@charlie.driver?).to be false
  end

  it "can drive a car and becomes #driver?" do
    expect(@charlie.driver?).to be false

    @charlie.drive

    expect(@charlie.driver?).to be true
  end
end