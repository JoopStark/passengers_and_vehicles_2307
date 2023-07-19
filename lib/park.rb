class Park
  attr_reader :name, :admission_price, :revenue, :vehicles
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @revenue = 0
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
    collect_admission(vehicle)
  end

  def check_vic_pass(vehicle)
    vehicle.passengers
  end

  def collect_admission(vehicle)
    check_vic_pass(vehicle).each { |passenger| 
      if passenger.adult?
        @revenue += @admission_price
      end
    }
  end
end
    

