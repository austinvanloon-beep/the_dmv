require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
    describe '#initialize' do
      it 'exists' do
        registrant = Registrant.new("Bruce", 18, true)
        expect(registrant).to be_a(Registrant)
      end
    end
  end