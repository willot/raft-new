require "rails_helper"

RSpec.describe Location, :type => :model do
  let(:location) {Location.new(city: "test")}

  describe "validate presence" do
    it { expect(location).to validate_presence_of(:city) }
    it { expect(location).to validate_presence_of(:country) }
  end
end
