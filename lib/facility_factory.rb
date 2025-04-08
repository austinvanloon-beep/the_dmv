class FacilityFactory
    def create_facilities(data)
      data.map do |facility_data|
        if facility_data[:state] == "CO"
          Facility.new({
            name: facility_data[:dmv_office],
            address: "#{facility_data[:address_li]} #{facility_data[:address__1]} #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zip]}",
            phone: facility_data[:phone]
          })

