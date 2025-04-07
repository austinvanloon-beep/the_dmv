require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
  describe '#register_vehicle' do
    it 'can register a vehicle and set plate type based on engine type' do
      @facility.add_service('Vehicle Registration')
      
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to_not be_nil
      expect(@cruz.plate_type).to eq(:regular)
      
      @facility.register_vehicle(@camaro)
      expect(@camaro.registration_date).to_not be_nil
      expect(@camaro.plate_type).to eq(:antique)

      @facility.register_vehicle(@bolt)
      expect(@bolt.registration_date).to_not be_nil
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'tracks registered vehicles' do
      @facility.add_service('Vehicle Registration')
      
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to include(@cruz)

      @facility.register_vehicle(@camaro)
      expect(@facility.registered_vehicles).to include(@camaro)
    end
  end
end
