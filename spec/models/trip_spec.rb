require "rails_helper"

RSpec.describe Trip, :type => :model do
  let(:trip) {Trip.new}

  describe "validate presence" do
    # it { expect(trip).to validate_presence_of(:origin) }
    # it { expect(trip).to validate_presence_of(:destination) }
    it { expect(trip).to validate_presence_of(:start_at) }
    it { expect(trip).to validate_presence_of(:end_at) }
    # it { expect(trip).to validate_presence_of(:user) }
  end
end
