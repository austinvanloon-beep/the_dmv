require 'date'
require './lib/facility'
require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today

    if vehicle.year < 1970
      vehicle.plate_type = :antique
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end

    @registered_vehicles << vehicle

    case vehicle.plate_type
    when :antique
      @collected_fees += 50
    when :ev
      @collected_fees += 75
    else
      @collected_fees += 100
    end
  end
end