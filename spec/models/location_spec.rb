require 'rails_helper'

RSpec.describe Location, :type => :model do
  let(:location) {Location.new(city: "test")}

  describe "validate presence" do
    it { expect(location).to validate_presence_of(:city) }
  end

  context "Checking the association" do
    it { expect(location).to have_many(:trip_origins) }
    it { expect(location).to have_many(:trip_destinations) }
    it { expect(location).to have_many(:travelers) }
    it { expect(location).to have_many(:users) }
    it { expect(location).to have_many(:search_result_locations) }
    it { expect(location).to have_many(:search_results) }
    it { expect(location).to have_many(:guides)}
  end
end
