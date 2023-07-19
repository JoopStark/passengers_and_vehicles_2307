require './lib/park'
require './lib/vehicle'
require './lib/passenger'

describe Park do
  before(:each) do
    @jelly_stone = Park.new("Jelly Stone", 50)
    @yellow_stone = Park.new("Yellow Stone", 100)

    @honda = Vehicle.new("2001", "Honda", "Civic")
    @revian = Vehicle.new("2023", "Revian", "Pickup")
    @highlander = Vehicle.new("2023", "Toyota", "Highlander")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20}) 
    @naomi = Passenger.new({"name" => "Naomi", "age" => 20}) 
    @jeff = Passenger.new({"name" => "Jeff", "age" => 20}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    
    @honda.add_passenger(@charlie)
    @revian.add_passenger(@jude)
    @revian.add_passenger(@taylor)
    @highlander.add_passenger(@naomi)
    @highlander.add_passenger(@jeff)
  end
  
  it "exists and has attributes" do
    expect(@jelly_stone).to be_a(Park)

    expect(@jelly_stone.name).to eq("Jelly Stone")
    expect(@jelly_stone.admission_price).to eq(50)
  end

  it "has exists with no revenue" do 
    expect(@jelly_stone.revenue).to eq(0)
  end

  it "can recieve vehicles" do
    expect(@jelly_stone.vehicles).to eq([])

    @jelly_stone.add_vehicle(@revian)

    expect(@jelly_stone.vehicles).to eq([@revian])

    @jelly_stone.add_vehicle(@honda)

    expect(@jelly_stone.vehicles).to eq([@revian, @honda])
  end

  it "can list passengers vehicle" do
    @jelly_stone.add_vehicle(@revian)

    expect(@jelly_stone.check_vic_pass(@revian)).to include(@jude)
    expect(@jelly_stone.check_vic_pass(@revian)).to include(@taylor)
  end
  it "can charge vehicles per adults in vehicle" do 
    @jelly_stone.add_vehicle(@revian)
    expect(@jelly_stone.revenue).to eq(50)
  end

  it "has a total revenue" do
    expect(@jelly_stone.revenue).to eq(0)

    @jelly_stone.add_vehicle(@revian)

    expect(@jelly_stone.revenue).to eq(50)

    @jelly_stone.add_vehicle(@honda)

    expect(@jelly_stone.revenue).to eq(100)

    @jelly_stone.add_vehicle(@highlander)

    expect(@jelly_stone.revenue).to eq(200)
  end
end
