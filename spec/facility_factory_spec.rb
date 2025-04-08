require './lib/facility_factory'
require './lib/facility'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
  end

  it 'exists' do
    expect(@factory).to be_a(FacilityFactory)
  end
