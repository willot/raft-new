require "rails_helper"

RSpec.describe Traveler, :type => :model do
  let(:traveler) {Traveler.new}

  describe "validate presence" do
    it { expect(traveler).to validate_presence_of(:user) }
    it { expect(traveler).to validate_presence_of(:trip) }
  end

  context "Checking the association" do
    it { expect(traveler).to belong_to(:user) }
    it { expect(traveler).to belong_to(:trip) }
  end
end
