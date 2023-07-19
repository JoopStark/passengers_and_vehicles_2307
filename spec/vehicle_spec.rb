require './lib/vehicle'
require './lib/passenger'


describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
  end

  it "has exists and has attributes" do 
    expect(@vehicle).to be_a(Vehicle)

    expect(@vehicle.year). to eq("2001")
    expect(@vehicle.make). to eq("Honda")
    expect(@vehicle.model). to eq("Civic")
  end

  it "#speeding? starts at false" do
    expect(@vehicle.speeding?).to be false
  end

  it "it can speed and change #speeding?" do
    expect(@vehicle.speeding?).to be false
    
    @vehicle.speed
    
    expect(@vehicle.speeding?).to be true
  end

  it "starts with no passengers" do
    expect(@vehicle.passengers).to eq([])
  end

  it "can #add_passenger" do
    expect(@vehicle.passengers).to eq([])

    @vehicle.add_passenger(@charlie)    
    @vehicle.add_passenger(@jude)    
    @vehicle.add_passenger(@taylor)
    
    expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
  end
  
  it "can count adults with #num_adults" do
    @vehicle.add_passenger(@charlie)    
    @vehicle.add_passenger(@jude)    
    @vehicle.add_passenger(@taylor)

    expect(@vehicle.num_adults).to eq(2)
  end
end