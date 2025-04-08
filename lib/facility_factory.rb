class FacilityFactory
    def initialize(data)
      @data = data
    end
  
    def create_facilities
      @data.map do |facility_data|
        Facility.new(facility_data)
      end
    end
  end





  
  #def